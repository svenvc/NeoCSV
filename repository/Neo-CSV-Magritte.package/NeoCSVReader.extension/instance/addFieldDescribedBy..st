*Neo-CSV-Magritte
addFieldDescribedBy: aDescription 

	| converter |
	converter := aDescription 
		propertyAt: #csvReader
		ifPresent: [ :c | [ :trimmed | c value: trimmed ] ]
		ifAbsent: [ [ :trimmed | aDescription fromString: trimmed ] ].
				
	self 
		addField: [ :obj :value | aDescription accessor write: value to: obj ] 
		converter: [ :s | 
			s trimmed
				ifNotEmpty: converter
				ifEmpty: [ aDescription default ] ] 