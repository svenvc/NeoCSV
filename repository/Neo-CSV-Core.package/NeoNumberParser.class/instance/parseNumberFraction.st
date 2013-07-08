parsing
parseNumberFraction
	| number power |
	number := 0.
	power := 1.0.
	[ stream atEnd not and: [ stream peek digitValue between: 0 and: base - 1 ] ]
		whileTrue: [ 
			number := base * number + stream next digitValue.
			power := power * base ].
	^ number / power