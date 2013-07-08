queries
parse: stringOrStream base: base ifFail: block
	^ [ self parse: stringOrStream base: base ]
		on: Error
		do: block