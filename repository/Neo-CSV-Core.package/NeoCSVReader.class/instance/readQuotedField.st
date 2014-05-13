private - reading
readQuotedField
	| field |
	self readQuote.
	field := self stringStreamContents: [ :stream |
		[ self atEnd or: [ self readEndOfQuotedField ] ]
			whileFalse: [
				stream nextPut: self nextChar ] ].
	^ field isEmpty
		ifTrue: [ emptyFieldValue ]
		ifFalse: [ field ]