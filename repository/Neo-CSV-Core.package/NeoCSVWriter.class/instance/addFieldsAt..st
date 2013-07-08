convenience
addFieldsAt: keys
	keys do: [ :each |
		self addFieldAt: each ]