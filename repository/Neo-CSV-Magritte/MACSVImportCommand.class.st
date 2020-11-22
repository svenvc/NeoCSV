Class {
	#name : #MACSVImportCommand,
	#superclass : #Object,
	#instVars : [
		'readerClass',
		'recordClass',
		'strategy'
	],
	#category : #'Neo-CSV-Magritte'
}

{ #category : #accessing }
MACSVImportCommand >> readerClass [
	^ readerClass ifNil: [ NeoCSVReader ]
]

{ #category : #'*Neo-CSV-Magritte' }
MACSVImportCommand >> readerClass: anObject [
	readerClass := anObject
]

{ #category : #accessing }
MACSVImportCommand >> recordClass [
	^ recordClass
]

{ #category : #'*Neo-CSV-Magritte' }
MACSVImportCommand >> recordClass: aClass [
	recordClass := aClass
]

{ #category : #accessing }
MACSVImportCommand >> runOnFile: file [
	^ file readStreamDo: [ :str | self runOnStream: str ]
]

{ #category : #accessing }
MACSVImportCommand >> runOnStream: aStream [
	^ self strategy
		stream: aStream;
		client: self;
		import
]

{ #category : #accessing }
MACSVImportCommand >> strategy [
	^ strategy ifNil: [ strategy := MACSVImportStrategy new ]
]

{ #category : #'as yet unclassified' }
MACSVImportCommand >> strategy: anObject [
	strategy := anObject
]
