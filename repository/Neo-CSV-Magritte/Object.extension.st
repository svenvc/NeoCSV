Extension { #name : #Object }

{ #category : #'*Neo-CSV-Magritte' }
Object class >> maCSVFile [
	"To use CSV Magritte, subclasses need to implement this. `self subclassResponsibility` is commented out because many classes won't use CSV and we don't want them all to be flagged with forgetting to implement it. This sort of thing should probably be in a trait, but we still haven't ripped the bandaid off i.e. committed to forgetting about compatibility with non-Pharo systems.
	
	self subclassResponsibility"
]

{ #category : #'*Neo-CSV-Magritte' }
Object class >> maFromCSV [
	^ self maFromCSVFile: self maCSVFile
]

{ #category : #'*Neo-CSV-Magritte' }
Object class >> maFromCSVFile: file [
	^ file readStreamDo: [ :str | self maFromCSVStream: str ]
]

{ #category : #'*Neo-CSV-Magritte' }
Object class >> maFromCSVStream: aStream [
	| reader fields header |
	reader := self maNeoCSVReaderClass on: aStream.
	header := reader readHeader.
	reader recordClass: self.
	fields := self new magritteDescription children.
	header do: [ :h | 
		fields
			detect: [ :f | f csvFieldName = h asString trimmed ]
			ifFound: [ :e | reader addFieldDescribedByMagritte: e ]
			ifNone: [ reader addIgnoredField ] ].
	^ reader upToEnd "or do more processing e.g. `select: [ :record | record lastName isNotNil ]`"
]

{ #category : #'*Neo-CSV-Magritte' }
Object class >> maGenerateFieldsFromCSVHeaders [
	"Given a class-side `#headers` message returning a tab-separated string (e.g. pasted from MS Excel), generate a field (i.e. constructor and accessors) for each token"
	
	| headers usedHeaders |
	headers := Character tab split: self headers.
	usedHeaders := headers reject: #isEmpty.
	usedHeaders do: [ :h | self maAddField: h asCamelCase uncapitalized asSymbol ]
]

{ #category : #'*Neo-CSV-Magritte' }
Object class >> maNeoCSVReaderClass [
	^ NeoCSVReader
]
