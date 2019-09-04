Extension { #name : #Object }

{ #category : #'*Neo-CSV-Magritte' }
Object class >> csvFile [
	"To use CSV Magritte, subclasses need to implement this. `self subclassResponsibility` is commented out because many classes won't use CSV and we don't want them all to be flagged with forgetting to implement it. This sort of thing should probably be in a trait, but we still haven't ripped the bandaid off i.e. committed to forgetting about compatibility with non-Pharo systems.
	
	self subclassResponsibility"
]

{ #category : #'*Neo-CSV-Magritte' }
Object class >> fromCSV [
	^ self fromCSVStream: self csvFile readStream
]

{ #category : #'*Neo-CSV-Magritte' }
Object >> fromCSV: file [
	| reader fields header |
	reader := NeoCSVReader on: file readStream.
	header := self readCSVHeaderWith: reader.
	reader recordClass: self.
	fields := self new magritteDescription children.
	header do: [ :h | 
		fields
			detect: [ :f | f csvFieldName = h asString trimmed ]
			ifFound: [ :e | reader addFieldDescribedBy: e ]
			ifNone: [ reader addIgnoredField ] ].
	^ reader upToEnd
]

{ #category : #'*Neo-CSV-Magritte' }
Object class >> fromCSVStream: aStream [
	| reader fields header |
	reader := self neoCSVReaderClass on: aStream.
	header := reader readHeader.
	reader recordClass: self.
	fields := self new magritteDescription children.
	header do: [ :h | 
		fields
			detect: [ :f |
				f 
					propertyAt: #csvFieldName
					ifPresent: [ :val | val = h asString trimmed ]
					ifAbsent: [ false ] ]
			ifFound: [ :e | reader addFieldDescribedBy: e ]
			ifNone: [ reader addIgnoredField ] ].
	^ reader upToEnd "or do more processing e.g. `select: [ :record | record lastName isNotNil ]`"
]

{ #category : #'*Neo-CSV-Magritte' }
Object class >> fromCsvFile: file [
	^ file readStreamDo: [ :str | self fromCSVStream: str ]
]

{ #category : #'*Neo-CSV-Magritte' }
Object class >> neoCSVReaderClass [
	^ NeoCSVReader
]

{ #category : #'*Neo-CSV-Magritte' }
Object >> readCSVHeaderWith: reader [
	 ^ reader readHeader
]
