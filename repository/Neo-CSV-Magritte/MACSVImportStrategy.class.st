Class {
	#name : #MACSVImportStrategy,
	#superclass : #Object,
	#instVars : [
		'reader',
		'client',
		'stream'
	],
	#category : #'Neo-CSV-Magritte'
}

{ #category : #accessing }
MACSVImportStrategy >> client [
	^ client
]

{ #category : #accessing }
MACSVImportStrategy >> client: anObject [
	client := anObject
]

{ #category : #accessing }
MACSVImportStrategy >> import [
	
	| fields header |
	header := self reader readHeader.
	self reader recordClass: client recordClass.
	fields := client recordClass new magritteDescription children.
	header do: [ :h | 
		fields
			detect: [ :f | f csvFieldName = h asString trimmed ]
			ifFound: [ :e | self reader addFieldDescribedByMagritte: e ]
			ifNone: [ self reader addIgnoredField ] ].
	^ self reader upToEnd "or do more processing e.g. `select: [ :record | record lastName isNotNil ]`"
]

{ #category : #accessing }
MACSVImportStrategy >> reader [
	^ reader ifNil: [ reader := self client readerClass on: self stream ]
]

{ #category : #accessing }
MACSVImportStrategy >> stream [
	^ stream
]

{ #category : #accessing }
MACSVImportStrategy >> stream: aStream [ 
	stream := aStream
]
