private
readEndOfQuotedField	
	(self readQuote and: [ self peekQuote not ])
		ifTrue: [
			^ true ].
	"A double quote inside a quoted field is an embedded quote (escaped)"
	^ false