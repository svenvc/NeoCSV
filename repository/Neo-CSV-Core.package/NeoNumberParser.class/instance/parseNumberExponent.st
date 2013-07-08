parsing
parseNumberExponent
	| number negated |
	number := 0.
	(negated := stream peekFor: $-)
		ifFalse: [ stream peekFor: $+ ].
	[ stream atEnd not and: [ stream peek digitValue between: 0 and: base - 1 ] ]
		whileTrue: [ number := base * number + stream next digitValue ].
	negated
		ifTrue: [ number := number negated ].
	^ base raisedTo: number