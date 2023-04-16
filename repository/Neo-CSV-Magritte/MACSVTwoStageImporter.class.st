Class {
	#name : #MACSVTwoStageImporter,
	#superclass : #MACSVImporter,
	#category : #'Neo-CSV-Magritte-Visitors'
}

{ #category : #accessing }
MACSVTwoStageImporter >> convertToDomainObjects: aCollectionOfDictionaries [
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
			propertyAt: self fieldNamePropertyKey
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
