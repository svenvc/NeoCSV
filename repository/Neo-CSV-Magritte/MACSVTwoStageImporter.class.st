"
Sometimes, you just can't fully create your domain objects from CSV in one pass. For example:
- Multiple rows combine into one object (`inject:into:` can be helpful here)
- Multiple cells combine into one object field

To handle such a case, subclass me and, at minimum, override `#convertToDomainObjects:`. See its comment for more info. Implementations of that method often utilize my `#initializeDomainObject:fromRecord:` helper method.
"
Class {
	#name : #MACSVTwoStageImporter,
	#superclass : #MACSVImporter,
	#category : #'Neo-CSV-Magritte-Neo-CSV-Magritte'
}

{ #category : #accessing }
MACSVTwoStageImporter >> convertToDomainObjects: aCollectionOfDictionaries [
	"aCollectionOfDictionaries - the result of a naive processing of CSV
	Return - a collection of domain objects"
	
	self subclassResponsibility
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
	anObject magritteDescription do: [ :desc | 
		desc
			propertyAt: #csvFieldName
			ifPresent: [ :fieldName | 
				| stringValue value |
				stringValue := aDictionary at: fieldName.
				self flag: 'This next part looks very memento-like'.
				stringValue ifNotNil: [ 
					value := desc csvReader value: stringValue.
					desc write: value to: anObject ] ] ].
	^ anObject
]

{ #category : #accessing }
MACSVTwoStageImporter >> readInput [
	^ self reader
		emptyFieldValue: #passNil;
		namedColumnsConfiguration;
		upToEnd.
]
