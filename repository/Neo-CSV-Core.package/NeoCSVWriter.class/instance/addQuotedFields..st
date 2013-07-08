convenience
addQuotedFields: accessors
	accessors do: [ :each |
		self addQuotedField: each ]