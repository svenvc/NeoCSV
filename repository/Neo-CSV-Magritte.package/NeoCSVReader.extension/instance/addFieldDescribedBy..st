*Neo-CSV-Magritte
addFieldDescribedBy: aDescription 
	| setter |
	setter := aDescription accessor writeSelector.
	aDescription 
		propertyAt: #csvReader
		ifPresent: [ :c | self addField: setter converter: [ :s | 
				s trimmed
					ifNotEmpty: [ c value: s trimmed ]
					ifEmpty: [ aDescription default ] ] ]
		ifAbsent: [ 
			self addField: setter converter: [ :s | 
				s trimmed
					ifEmpty: [ aDescription default ]
					ifNotEmpty: [ :trimmed | 
						aDescription fromString: trimmed ] ] ] 