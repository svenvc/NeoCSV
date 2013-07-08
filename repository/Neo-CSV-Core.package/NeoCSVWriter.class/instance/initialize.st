initialize-release
initialize 
	super initialize.
	lineEnd := String crlf.
	separator := $, .
	fieldWriter := #writeQuotedField: 
