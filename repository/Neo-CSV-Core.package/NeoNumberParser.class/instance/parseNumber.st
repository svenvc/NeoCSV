parsing
parseNumber
	| negated number |
	negated := stream peekFor: $-.
	number := self parseNumberInteger.
	(stream peekFor: $.)
		ifTrue: [ number := number + self parseNumberFraction ].
	((stream peekFor: $e) or: [ stream peekFor: $E ])
		ifTrue: [ number := number * self parseNumberExponent ].
	negated
		ifTrue: [ number := number negated ].
	^ number