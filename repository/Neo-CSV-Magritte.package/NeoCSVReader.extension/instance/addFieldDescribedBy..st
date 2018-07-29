*Neo-CSV-Magritte
addFieldDescribedBy: aDescription 
	aDescription 
		propertyAt: #csvReader
		ifPresent: [ :c | self addField: [ :obj :value | aDescription accessor write: value to: obj ] converter: [ :s | 
				s trimmed
					ifNotEmpty: [ c value: s trimmed ]
					ifEmpty: [ aDescription default ] ] ]
		ifAbsent: [ 
			self addField: [ :obj :value | aDescription accessor write: value to: obj ] converter: [ :s | 
				s trimmed
					ifEmpty: [ aDescription default ]
					ifNotEmpty: [ :trimmed | 
						aDescription fromString: trimmed ] ] ] 