Extension { #name : #MAElementDescription }

{ #category : #'*Neo-CSV-Magritte' }
MAElementDescription >> csvFieldName [
	^ self propertyAt: #csvFieldName
]

{ #category : #'*Neo-CSV-Magritte' }
MAElementDescription >> csvFieldName: aString [
	^ self propertyAt: #csvFieldName put: aString
]

{ #category : #'*Neo-CSV-Magritte' }
MAElementDescription >> csvReader [
	^ self propertyAt: #csvReader
]

{ #category : #'*Neo-CSV-Magritte' }
MAElementDescription >> csvReader: aBlock [
	^ self propertyAt: #csvReader put: aBlock
]
