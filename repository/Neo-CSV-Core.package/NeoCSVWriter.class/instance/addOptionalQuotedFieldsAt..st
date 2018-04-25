convenience
addOptionalQuotedFieldsAt: keys
	keys do: [ :each |
		self addOptionalQuotedFieldAt: each ]