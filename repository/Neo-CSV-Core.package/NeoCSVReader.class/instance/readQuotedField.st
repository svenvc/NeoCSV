private - reading
readQuotedField
	self readQuote.
	^ self stringStreamContents: [ :stream |
		[ self atEnd or: [ self readEndOfQuotedField ] ]
			whileFalse: [
				stream nextPut: self nextChar ] ]