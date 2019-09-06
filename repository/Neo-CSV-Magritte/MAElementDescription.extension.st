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
	^ self propertyAt: #csvReader ifAbsent: [ [ :trimmed | self fromString: trimmed ] ]
]

{ #category : #'*Neo-CSV-Magritte' }
MAElementDescription >> csvReader: aBlock [
	^ self propertyAt: #csvReader put: aBlock
]
