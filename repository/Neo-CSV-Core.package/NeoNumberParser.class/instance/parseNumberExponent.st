parsing
parseNumberExponent
	| number negated x |
	number := 0.
	(negated := stream peekFor: $-)
		ifFalse: [ stream peekFor: $+ ].
	[ (x := stream peek) notNil and: [ (x := x digitValue) >= 0 and: [ x < base ] ] ]
		whileTrue: [ 
			number := base * number + x. 
			stream next ].
	negated
		ifTrue: [ number := number negated ].
	^ base raisedTo: number