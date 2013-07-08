convenience
addRawFields: accessors
	accessors do: [ :each |
		self addRawField: each ]