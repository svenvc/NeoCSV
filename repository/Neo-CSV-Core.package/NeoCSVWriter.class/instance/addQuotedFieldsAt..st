convenience
addQuotedFieldsAt: keys
	keys do: [ :each |
		self addQuotedFieldAt: each ]