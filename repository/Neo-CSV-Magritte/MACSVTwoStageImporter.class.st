Class {
	#name : #MACSVTwoStageImporter,
	#superclass : #MACSVImporter,
	#category : #'Neo-CSV-Magritte-Neo-CSV-Magritte'
}

{ #category : #accessing }
MACSVTwoStageImporter >> convertToDomainObjects: aCollectionOfDictionaries [
	self subclassResponsibility
]

{ #category : #accessing }
MACSVTwoStageImporter >> importStream: aStream [
	| rows |
	self stream: aStream.
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
					| parsableString |
					parsableString := stringValue reject: [ :c | c = $, ].
					value := desc fromString: parsableString.
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
