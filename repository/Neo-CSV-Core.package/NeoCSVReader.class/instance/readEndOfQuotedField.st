private
readEndOfQuotedField
	(self readQuote and: [ self peekQuote not ])
		ifTrue: [
			^ true ].
	^ false