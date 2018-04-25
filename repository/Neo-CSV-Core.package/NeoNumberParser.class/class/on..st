instance creation
on: stringOrStream
	| stream |
	stream := stringOrStream isString
		ifTrue: [ stringOrStream readStream ]
		ifFalse: [ stringOrStream ].
	^ self new
		on: stream;
		yourself