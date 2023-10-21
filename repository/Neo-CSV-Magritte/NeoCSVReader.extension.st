Extension { #name : #NeoCSVReader }

{ #category : #'*Neo-CSV-Magritte' }
NeoCSVReader >> addFieldDescribedByMagritte: aDescription [ 

	self 
		addField: [ :obj :value | aDescription accessor write: value to: obj ] 
		converter: [ :s | 
			s trimmed
				ifNotEmpty: aDescription csvReader
				ifEmpty: [ aDescription undefinedValue ] ] 
]
