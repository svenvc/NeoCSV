Class {
	#name : #MACSVImporter,
	#superclass : #Object,
	#instVars : [
		'reader',
		'readerClass',
		'recordClass',
		'stream'
	],
	#category : #'Neo-CSV-Magritte'
}

{ #category : #accessing }
MACSVImporter >> importFile: file [
	
	^ file readStreamDo: [ :str | self importStream: str ]
]

{ #category : #accessing }
MACSVImporter >> importStream: aStream [
	
	| fields header |
	self stream: aStream.
	header := self reader readHeader.
	self reader recordClass: self recordClass.
	fields := self recordClass new magritteDescription children.
	header do: [ :h | 
		fields
			detect: [ :f | f csvFieldName = h asString trimmed ]
			ifFound: [ :e | self reader addFieldDescribedByMagritte: e ]
			ifNone: [ self reader addIgnoredField ] ].
	^ self reader upToEnd "or do more processing e.g. `select: [ :record | record lastName isNotNil ]`"
]

{ #category : #accessing }
MACSVImporter >> reader [
	^ reader ifNil: [ reader := self readerClass on: self stream ]
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
MACSVImporter >> stream [
	^ stream
]

{ #category : #accessing }
MACSVImporter >> stream: aStream [ 
	stream := aStream
]
