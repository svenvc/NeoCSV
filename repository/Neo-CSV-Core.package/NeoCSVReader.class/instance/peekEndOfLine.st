private
peekEndOfLine
	| char |
	char := self peekChar codePoint.
	^ (char == 10 "Character lf" ) or: [ char == 13 "Character cr" ]