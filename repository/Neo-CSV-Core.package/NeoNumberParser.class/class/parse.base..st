queries
parse: stringOrStream base: base
	| stream |
	stream := stringOrStream isString
		ifTrue: [ stringOrStream readStream ]
		ifFalse: [ stringOrStream ].
	^ (self on: stream)
		base: base;
		next