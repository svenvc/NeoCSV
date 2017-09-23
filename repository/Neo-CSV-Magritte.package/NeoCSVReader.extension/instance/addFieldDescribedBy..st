*Neo-CSV-Magritte
addFieldDescribedBy: aDescription 
	| setter |
	setter := aDescription accessor writeSelector.
	aDescription 
		propertyAt: #csvReader
		ifPresent: [ :c | self addField: setter converter: [ :s | 
				s trimmed
					ifNotEmpty: [ c value: s trimmed ]
					ifEmpty: [ nil ] "Fields with only whitespace get here by accident, so re-nil the value" ] ]
		ifAbsent: [ 
			self addField: setter converter: [ :s | 
				s trimmed
					ifEmpty: [ nil ]
					ifNotEmpty: [ :trimmed | 
						"Fields with only whitespace get here by accident, so re-nil the value"
						aDescription fromString: trimmed ] ] ] 