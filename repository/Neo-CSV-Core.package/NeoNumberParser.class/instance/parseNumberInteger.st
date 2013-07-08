parsing
parseNumberInteger
	| number |
	number := nil.
	[ stream atEnd not and: [ stream peek digitValue between: 0 and: base - 1 ] ]
		whileTrue: [ number := base * (number ifNil: [ 0 ]) + stream next digitValue ].
	number ifNil: [ self error: 'Integer digit expected' ].
	^ number