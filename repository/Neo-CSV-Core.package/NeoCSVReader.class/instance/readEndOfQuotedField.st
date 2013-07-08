private
readEndOfQuotedField
	(self readQuote and: [ self peekQuote not ])
		ifTrue: [
			self readSeparator.
			^ true ].
	^ false