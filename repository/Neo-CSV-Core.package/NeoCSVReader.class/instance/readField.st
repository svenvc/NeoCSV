private - reading
readField
	^ self peekQuote
		ifTrue: [
			self readQuotedField ]
		ifFalse: [
			self readUnquotedField ]