convenience
addOptionalQuotedFields: accessors
	accessors do: [ :each |
		self addOptionalQuotedField: each ]