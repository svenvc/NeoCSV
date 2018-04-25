queries
parse: stringOrStream base: base
	^ (self on: stringOrStream)
		base: base;
		next