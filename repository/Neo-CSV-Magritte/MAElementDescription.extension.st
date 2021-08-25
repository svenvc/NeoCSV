Extension { #name : 'MAElementDescription' }

{ #category : '*Neo-CSV-Magritte' }
MAElementDescription >> csvFieldName [
	^ self propertyAt: #csvFieldName ifAbsent: [ nil ]
]

{ #category : '*Neo-CSV-Magritte' }
MAElementDescription >> csvFieldName: aString [
	^ self propertyAt: #csvFieldName put: aString
]

{ #category : '*Neo-CSV-Magritte' }
MAElementDescription >> csvReader [
	| default |
	default := [ :trimmed | self fromString: trimmed ].
	^ self propertyAt: #csvReader ifAbsent: [ default ]
]

{ #category : '*Neo-CSV-Magritte' }
MAElementDescription >> csvReader: aBlock [
	"
	aBlock - should take the input string as its argument and return a value appropriate to the field e.g. aDate for MADateDescription."
	^ self propertyAt: #csvReader put: aBlock
]

{ #category : '*Neo-CSV-Magritte' }
MAElementDescription >> fromCSV: aStringOrNil [
	| value |
	(aStringOrNil isNil or: [ aStringOrNil isEmpty ]) ifTrue: [ ^ nil ].
	value := self csvReader value: aStringOrNil trimmed.
	(self default = value and: [ self shouldCacheDefault not ]) ifTrue: [ ^ nil ].
	^ value
	"Implementation note: this was extracted from NeoCSVReader's Magritte field adding because it is useful in other places e.g. MACSVImporter"
]
