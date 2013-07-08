convenience
addObjectFields: accessors
	accessors do: [ :each |
		self addObjectField: each ]