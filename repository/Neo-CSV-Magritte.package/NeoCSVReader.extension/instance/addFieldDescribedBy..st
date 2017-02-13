*Neo-CSV-Magritte
addFieldDescribedBy: aDescription 
	| setter |
	setter := aDescription accessor writeSelector.
	aDescription 
		propertyAt: #csvReader
		ifPresent: [ :c | self addField: setter converter: c ]
		ifAbsent: [ self addField: setter ] 