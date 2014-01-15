accessing
writeHeader: fieldNames
	"Write the header, a collection of field names.
	This should normally be called only at the beginning and only once."
	
	fieldNames 
		do: [ :each | self writeQuotedField: each ]
		separatedBy: [ self writeSeparator ].
	self writeEndOfLine