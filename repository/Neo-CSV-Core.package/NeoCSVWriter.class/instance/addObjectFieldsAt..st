convenience
addObjectFieldsAt: keys
	keys do: [ :each |
		self addObjectFieldAt: each ]