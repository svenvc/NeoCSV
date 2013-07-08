queries
parse: stringOrStream
	| stream |
	stream := stringOrStream isString
		ifTrue: [ stringOrStream readStream ]
		ifFalse: [ stringOrStream ].
	^ (self on: stream) next