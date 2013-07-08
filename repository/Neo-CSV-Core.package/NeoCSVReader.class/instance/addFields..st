convenience
addFields: accessors
	"Add fields based on a collection of accessors, not doing any conversions."
	
	accessors do: [ :each |
		self addField: each ]