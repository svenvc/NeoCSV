private
readEndOfQuotedField	
	"A double quote inside a quoted field is an embedded quote (escaped)"
	
	^ self readQuote and: [ self peekQuote not ]