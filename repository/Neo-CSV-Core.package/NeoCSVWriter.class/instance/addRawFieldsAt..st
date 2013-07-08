convenience
addRawFieldsAt: keys
	keys do: [ :each |
		self addRawFieldAt: each ]