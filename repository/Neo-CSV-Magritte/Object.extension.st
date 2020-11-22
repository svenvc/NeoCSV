Extension { #name : #Object }

{ #category : #'*Neo-CSV-Magritte' }
Object class >> maCSVImporter: importerClass [
	^ importerClass new
		recordClass: self;
		yourself.
]

{ #category : #'*Neo-CSV-Magritte' }
Object class >> maGenerateFieldsFromCSVHeaders: aString [
	"Given a class-side `#headers` message returning a tab-separated string (e.g. pasted from MS Excel), generate a field (i.e. constructor and accessors) for each token"
	
	| headers usedHeaders |
	headers := Character tab split: aString.
	usedHeaders := headers reject: #isEmpty.
	usedHeaders do: [ :h | self maAddField: h asCamelCase uncapitalized asSymbol ]
]
