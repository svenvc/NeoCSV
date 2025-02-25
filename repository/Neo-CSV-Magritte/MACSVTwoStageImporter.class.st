"
Sometimes, you just can't fully create your domain objects from CSV in one pass. For example:
- Multiple rows combine into one object (`inject:into:` can be helpful here)
- Multiple cells combine into one object field

To handle such a case, subclass me and, at minimum, override `#domainObjectFromDictionary:`. See its comment for more info. Implementations of that method often utilize my `#initializeDomainObject:fromRecord:` helper method.

##Combining Multiple Cells into One Field
Typically, you would override `domainObjectFromDictionary:`, do a super send, and then 
Ideally, you would have a domain value object whose state is represented by these fields. If so, a common pattern is to  and pass this object to `` like so:
```smalltalk
	result := super domainObjectFromDictionary: aDictionary.
	
	aValueObject := self 
		initializeDomainObject: MyValueObject new 
		fromRecord: aDictionary.
		
	^ result
		fooBar: aValueObject;
		yourself
```

If the object can't be created anew - say it lives in a registry - you can always just pull
"
Class {
	#name : #MACSVTwoStageImporter,
	#superclass : #MACSVImporter,
	#instVars : [
		'selectBlock',
		'preprocessor'
	],
	#category : #'Neo-CSV-Magritte-Visitors'
}

{ #category : #accessing }
MACSVTwoStageImporter >> configureReaderFor: aStream [
	
	super configureReaderFor: aStream.
	self reader recordClass: Dictionary.
	
	self reader
		emptyFieldValue: #passNil;
		addFieldsAt: (self columnNames collect: [ :each | each asSymbol ]) "Adapted from NeoCSVReader>>#namedColumnsConfiguration"
]

{ #category : #accessing }
MACSVTwoStageImporter >> convertToDomainObjects: aCollectionOfDictionaries [
	"aCollectionOfDictionaries - the result of a naive processing of CSV
	Return - a collection of domain objects"
	
	^ aCollectionOfDictionaries
		inject: OrderedCollection new 
		into: [ :col :rowDict | 
			| result |
			self preprocessor value: rowDict.
			(self selectBlock value: rowDict)
				ifTrue: [ 
					result := self domainObjectFromDictionary: rowDict.
					self prepareRecord: result.
					col add: result ].
			col ]
]

{ #category : #accessing }
MACSVTwoStageImporter >> domainObjectFromDictionary: aDictionary [

	^ self 
		initializeDomainObject: self recordClass new 
		fromRecord: aDictionary
]

{ #category : #accessing }
MACSVTwoStageImporter >> importStream: aStream [
	| rows preparedStream |
	preparedStream := self prepareStream: aStream.
	self configureReaderFor: preparedStream.
	rows := self reader upToEnd.
	^ self convertToDomainObjects: rows
]

{ #category : #accessing }
MACSVTwoStageImporter >> initialize [

	super initialize.
	self recordClass: Dictionary.
]

{ #category : #accessing }
MACSVTwoStageImporter >> initializeDomainObject: anObject fromRecord: aDictionary [
	"We needed an instance-side version because some objects may need configuration during instance creation"
	
	^ self 
		initializeDomainObject: anObject 
		fromRecord: aDictionary 
		mapping: [ :builder | ]
]

{ #category : #accessing }
MACSVTwoStageImporter >> initializeDomainObject: anObject fromRecord: aDictionary mapping: aBlock [
	
	^ self
		initializeDomainObject: anObject
		fromRecord: aDictionary
		mapping: aBlock
		descriptionDo: #yourself
]

{ #category : #accessing }
MACSVTwoStageImporter >> initializeDomainObject: anObject fromRecord: aDictionary mapping: mapBlock descriptionDo: descriptionBlock [
	"Send me only if you want to customize the domain object's Magritte description. Otherwise send one of the similar messages omitting the #descriptionDo: argument because my usage may seem a bit verbose due to creation of MADescriptions by hand, but I provide advantages - like gracefully handling nils. My arguments are as follows:
		anObject - domain object to be initialized
		aDictionary - keys are CSV column names
		mapBlock - use to modify existing descriptions; argument will be an MACSVMappedPragmaBuilder to configure
		descriptionBlock - argument is the container description for anObject, for further configuration e.g. adding an element description"
		
	| contDesc builder |
	builder := MACSVMappedPragmaBuilder new
		fieldNamePropertyKey: self fieldNamePropertyKey;
		fieldReaderPropertyKey: self fieldReaderPropertyKey;
		yourself.
	mapBlock value: builder.
		
	contDesc := builder for: anObject.
	descriptionBlock value: contDesc.
	contDesc do: [ :desc | 
		desc
			propertyAt: self fieldNamePropertyKey
			ifPresent: [ :fieldName | 
				| stringValue value fieldReader |
				stringValue := aDictionary at: fieldName.
				self flag: 'This next part looks very memento-like'.
				stringValue ifNotNil: [ 
					fieldReader := desc 
						propertyAt: self fieldReaderPropertyKey
						ifAbsent: [ desc csvReader ].
					value := fieldReader cull: stringValue cull: desc.
					desc write: value to: anObject ] ] ].
	^ anObject
]

{ #category : #accessing }
MACSVTwoStageImporter >> prepareRecord: aDomainObject [
	"Override this to fix input problems which are easier to fix utilizing real accessors and domain objects instead of in the preprocessor where you have dictionary keys and strings"
]

{ #category : #accessing }
MACSVTwoStageImporter >> prepareStream: aStream [
	"Override me e.g. if the input is not proper CSV. One might remove a standard number of header or footer lines, handle blank columns, etc"

	^ aStream
]

{ #category : #accessing }
MACSVTwoStageImporter >> preprocessor [
	^ preprocessor ifNil: [ #yourself ]
]

{ #category : #accessing }
MACSVTwoStageImporter >> preprocessor: aValuable [
	"Consider #prepareObject: first because it is generally easier to fix the record after initialization because we have real accessors and domain objects e.g. aDate instead of aDateString"

	preprocessor := aValuable
]

{ #category : #accessing }
MACSVTwoStageImporter >> selectBlock [
	^ selectBlock ifNil: [ #isNotNil ]
]

{ #category : #accessing }
MACSVTwoStageImporter >> selectBlock: anObject [
	selectBlock := anObject
]
