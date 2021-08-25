Class {
	#name : 'MACSVImporter',
	#superclass : 'Object',
	#instVars : [
		'reader',
		'readerClass',
		'recordClass',
		'source'
	],
	#category : 'Neo-CSV-Magritte-Visitors'
}

{ #category : 'accessing' }
MACSVImporter >> execute [
	^ self source isStream
		ifTrue: [ self importStream: self source ]
		ifFalse: [ self source readStreamDo: [ :str | self importStream: str ] ]
]

{ #category : 'private' }
MACSVImporter >> importStream: aStream [
	
	| fields header |
	self reader on: aStream.
	header := self readHeader.
	self reader recordClass: self recordClass.
	fields := self recordClass new magritteDescription children.
	header do: [ :h | 
		fields
			detect: [ :f | f csvFieldName = h asString trimmed ]
			ifFound: [ :e | self reader addFieldDescribedByMagritte: e ]
			ifNone: [ self reader addIgnoredField ] ].
	^ self reader upToEnd "or do more processing e.g. `select: [ :record | record lastName isNotNil ]`"
]

{ #category : 'private' }
MACSVImporter >> readHeader [
	"For exotic headers (i.e. not a single line with field names), override this. For example, you may for example want to skip irrevelant/blank lines."
	^ self reader readHeader
]

{ #category : 'accessing' }
MACSVImporter >> reader [
	^ reader ifNil: [ reader := self readerClass new ]
]

{ #category : 'accessing' }
MACSVImporter >> readerClass [
	^ readerClass ifNil: [ NeoCSVReader ]
]

{ #category : 'accessing' }
MACSVImporter >> readerClass: aClass [
	readerClass := aClass
]

{ #category : 'accessing' }
MACSVImporter >> recordClass [
	^ recordClass
]

{ #category : 'accessing' }
MACSVImporter >> recordClass: aClass [
	recordClass := aClass
]

{ #category : 'accessing' }
MACSVImporter >> source [

	^ source
]

{ #category : 'accessing' }
MACSVImporter >> source: aFileOrStream [

	source := aFileOrStream
]
