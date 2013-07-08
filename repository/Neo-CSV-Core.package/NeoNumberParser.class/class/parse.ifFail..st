queries
parse: stringOrStream ifFail: block
	^ [ self parse: stringOrStream ]
		on: Error
		do: block