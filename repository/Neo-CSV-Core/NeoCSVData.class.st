"
I am NeoCSVData, representing the data of a CSV file.

I hold an optional header and a collection of records with the same fields.

I am a convenience object.

You can create an instance of me by reading me from a stream (NeoCSVData class>>readFrom:).
You can write me to a stream (NeoCSVData>>writeTo:).

Note that I assume my records are indexable collections, not dictionaries.

No field conversions are done, all fields remain strings.

Using NeoCSVReader and NeoCSVWriter directly gives you much more options.

I can also be used by construction from a collection (NeoCSVData class>>with:) with the header being set manually.
"
Class {
	#name : #NeoCSVData,
	#superclass : #Object,
	#instVars : [
		'header',
		'data'
	],
	#category : #'Neo-CSV-Core'
}

{ #category : #'instance creation' }
NeoCSVData class >> readAsDictionariesFrom: characterReadStream [
	| reader csvData |
	reader := NeoCSVReader on: characterReadStream.
	csvData := self new.
	csvData header: reader namedColumnsConfiguration.
	csvData data: reader upToEnd.
	^ csvData
]

{ #category : #'instance creation' }
NeoCSVData class >> readFrom: characterReadStream [
	| reader csvData |
	reader := NeoCSVReader on: characterReadStream.
	csvData := self new.
	csvData header: reader readHeader.
	csvData data: reader upToEnd.
	^ csvData
]

{ #category : #'instance creation' }
NeoCSVData class >> with: collectionOfRecords [
	^ self new 
		data: collectionOfRecords; 
		yourself
]

{ #category : #accessing }
NeoCSVData >> data [
	^ data
]

{ #category : #accessing }
NeoCSVData >> data: collectionOfRecords [
	data := collectionOfRecords
]

{ #category : #accessing }
NeoCSVData >> header [
	^ header
]

{ #category : #accessing }
NeoCSVData >> header: collectionOfFieldNames [
	header := collectionOfFieldNames
]

{ #category : #accessing }
NeoCSVData >> headerForPresentation [
	^ self header
		ifNil: [ self data ifNotNil: [ (1 to: self data first size) collect: #asString ] ]
]

{ #category : #accessing }
NeoCSVData >> numberOfColumns [
	^ header
		ifNil: [ 
			self data ifNil: [ 0 ] ifNotNil: [ self data first size ] ]
		ifNotNil: [ header size ]
]

{ #category : #accessing }
NeoCSVData >> numberOfRows [
	^ data ifNil: [ 0 ] ifNotNil: [ data size ]
]

{ #category : #printing }
NeoCSVData >> printOn: stream [
	super printOn: stream.
	stream 
		nextPut: $(;
		print: self numberOfRows;
		space;
		nextPutAll: 'row'.
	self numberOfRows = 1 ifFalse: [ stream nextPut: $s ].
	stream
		space;
		nextPut: $x;
		space;
		print: self numberOfColumns;
		space;
		nextPutAll: 'column'.
	self numberOfColumns = 1 ifFalse: [ stream nextPut: $s ].
	stream
		nextPut: $)
]

{ #category : #writing }
NeoCSVData >> writeOn: characterWriteStream [
	| writer |
	self data isEmptyOrNil ifTrue: [ ^ self ].
	writer := NeoCSVWriter on: characterWriteStream.
	self data first isDictionary
		ifTrue: [
			writer namedColumnsConfiguration: self header ]
		ifFalse: [
			self header ifNotNil: [ writer writeHeader: self header ] ].
	writer nextPutAll: self data
]
