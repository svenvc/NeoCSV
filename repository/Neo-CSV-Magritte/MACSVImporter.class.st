Class {
	#name : #MACSVImporter,
	#superclass : #Object,
	#instVars : [
		'reader',
		'readerClass',
		'recordClass',
		'source',
		'columnNames'
	],
	#category : #'Neo-CSV-Magritte-Visitors'
}

{ #category : #accessing }
MACSVImporter >> columnNames [
	"See setter comment"
	
	^ columnNames
]

{ #category : #accessing }
MACSVImporter >> columnNames: aCollection [
	"If not supplied, will assume the first row contains them"

	columnNames := aCollection
]

{ #category : #private }
MACSVImporter >> configureReaderFor: aStream [
	self reader on: aStream.
	self columnNames ifNil: [ self columnNames: self readHeader ].
	self reader recordClass: self recordClass.
]

{ #category : #accessing }
MACSVImporter >> execute [
	^ self source isStream
		ifTrue: [ self importStream: self source ]
		ifFalse: [ self source readStreamDo: [ :str | self importStream: str ] ]
]

{ #category : #accessing }
MACSVImporter >> fieldNamePropertyKey [
	"The property where the element description stores the field name; override to customize"

	^ #csvFieldName
]

{ #category : #accessing }
MACSVImporter >> fieldReaderPropertyKey [
	"The property where the element description stores the field reader. Override to customize. See `MAElementDescription>>#csvReader:` method comment for more info"

	^ #csvReader
]

{ #category : #private }
MACSVImporter >> importStream: aStream [
	| fields |
	self configureReaderFor: aStream.
	
	fields := self recordClass new magritteDescription children.
	self columnNames
		do: [ :h | 
			fields
				detect: [ :f | 
					f
						propertyAt: self fieldNamePropertyKey
						ifPresent: [ :fieldName | fieldName = h asString trimmed ]
						ifAbsent: [ false ] ]
				ifFound: [ :e | 
					self flag: 'need a way to customize the reader here'.
					self reader addFieldDescribedByMagritte: e ]
				ifNone: [ self reader addIgnoredField ] ].
	^ self reader upToEnd "or do more processing e.g. `select: [ :record | record lastName isNotNil ]`"
]

{ #category : #private }
MACSVImporter >> readHeader [
	"For exotic headers (i.e. not a single line with field names), override this. For example, you may for example want to skip irrevelant/blank lines."
	^ self reader readHeader
]

{ #category : #accessing }
MACSVImporter >> reader [
	^ reader ifNil: [ reader := self readerClass new ]
]

{ #category : #accessing }
MACSVImporter >> readerClass [
	^ readerClass ifNil: [ NeoCSVReader ]
]

{ #category : #accessing }
MACSVImporter >> readerClass: aClass [
	readerClass := aClass
]

{ #category : #accessing }
MACSVImporter >> recordClass [
	^ recordClass
]

{ #category : #accessing }
MACSVImporter >> recordClass: aClass [
	recordClass := aClass
]

{ #category : #accessing }
MACSVImporter >> source [

	^ source
]

{ #category : #accessing }
MACSVImporter >> source: aFileOrStream [

	source := aFileOrStream
]
