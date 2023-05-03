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
MACSVTwoStageImporter >> convertToDomainObjects: aCollectionOfDictionaries [
	^ aCollectionOfDictionaries
		inject: OrderedCollection new 
		into: [ :col :rowDict | 
			| result |
			self preprocessor value: rowDict.
			(self selectBlock value: rowDict)
				ifTrue: [ 
					result := self domainObjectFromDictionary: rowDict.
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
	| rows |
	self reader on: aStream.
	rows := self readInput.
	^ self convertToDomainObjects: rows
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
	"
	anObject - domain objec to be initialized
	aDictionary - keys are CSV column names
	mapBlock - use to modify existing descriptions; argument will be an MACSVMappingPragmaBuilder to configure
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
					value := fieldReader value: stringValue.
					desc write: value to: anObject ] ] ].
	^ anObject
]

{ #category : #accessing }
MACSVTwoStageImporter >> preprocessor [
	^ preprocessor ifNil: [ #yourself ]
]

{ #category : #accessing }
MACSVTwoStageImporter >> preprocessor: anObject [
	preprocessor := anObject
]

{ #category : #accessing }
MACSVTwoStageImporter >> readInput [
	^ self reader
		emptyFieldValue: #passNil;
		namedColumnsConfiguration;
		upToEnd.
]

{ #category : #accessing }
MACSVTwoStageImporter >> selectBlock [
	^ selectBlock ifNil: [ #isNotNil ]
]

{ #category : #accessing }
MACSVTwoStageImporter >> selectBlock: anObject [
	selectBlock := anObject
]
