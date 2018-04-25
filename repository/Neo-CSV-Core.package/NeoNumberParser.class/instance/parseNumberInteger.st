parsing
parseNumberInteger
	| number x found |
	number := 0.
	found := false.
	[ (x := stream peek) notNil and: [ (x := x digitValue) >= 0 and: [ x < base ] ] ]
		whileTrue: [ 
			found := true.
			number := base * number + x.
			stream next ].
	found 
		ifFalse: [ self error: 'Integer digit expected' ].
	^ number