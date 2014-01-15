private - reading
readFieldAndSeparator
	| field |
	field := self readField.
	self readSeparator.
	^ field