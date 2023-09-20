Extension { #name : #MAElementDescription }

{ #category : #'*Neo-CSV-Magritte' }
MAElementDescription >> csvFieldName [
	^ self propertyAt: #csvFieldName ifAbsent: [ nil ]
]

{ #category : #'*Neo-CSV-Magritte' }
MAElementDescription >> csvFieldName: aString [
	^ self propertyAt: #csvFieldName put: aString
]

{ #category : #'*Neo-CSV-Magritte' }
MAElementDescription >> csvReader [

	^ self propertyAt: #csvReader ifAbsent: [ self defaultCsvReader ]
]

{ #category : #'*Neo-CSV-Magritte' }
MAElementDescription >> csvReader: aBlock [
	"
	aBlock 
		- 1st argument - the input string
		- 2nd (optional) argument - this description
		- return value - a value appropriate to the field e.g. aDate for MADateDescription."
	^ self propertyAt: #csvReader put: aBlock
]

{ #category : #'*Neo-CSV-Magritte' }
MAElementDescription >> defaultCsvReader [

	^ [ :trimmed | self fromString: trimmed ].
]

{ #category : #'*Neo-CSV-Magritte' }
MAElementDescription >> fromCSV: aStringOrNil [
	| value |
	(aStringOrNil isNil or: [ aStringOrNil isEmpty ]) ifTrue: [ ^ nil ].
	value := self csvReader cull: aStringOrNil trimmed cull: self.
	(self default = value and: [ self shouldCacheDefault not ]) ifTrue: [ ^ nil ].
	^ value
	"Implementation note: this was extracted from NeoCSVReader's Magritte field adding because it is useful in other places e.g. MACSVImporter"
]
