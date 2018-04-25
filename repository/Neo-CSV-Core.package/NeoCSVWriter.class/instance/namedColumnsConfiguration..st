convenience
namedColumnsConfiguration: columns
	"Configure the receiver to output the named columns as keyed properties.
	The objects to be written should respond to #at: like a Dictionary.
	Writes a header first. Uses the configured field writer."
	
	self writeHeader: columns.
	self addFieldsAt: columns