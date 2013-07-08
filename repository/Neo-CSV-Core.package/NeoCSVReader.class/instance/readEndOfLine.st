private
readEndOfLine
	| char |
	char := self peekChar codePoint.
	char == 10 "Character lf"
		ifTrue: [ 
			self nextChar. 
			^ true ].
	char == 13 "Character cr"
		ifTrue: [
			self nextChar.
			(self atEnd not and: [ self peekChar codePoint == 10 "Character lf" ])
				ifTrue: [ 
					self nextChar ]. 
			^ true  ].
	^ false
