parsing
parseNumberFraction
	| number power x |
	number := 0.
	power := 1.0.
	[ (x := stream peek) notNil and: [ (x := x digitValue) >= 0 and: [ x < base ] ] ]
		whileTrue: [ 
			number := base * number + x.
			power := power * base.
			stream next ].
	^ number / power