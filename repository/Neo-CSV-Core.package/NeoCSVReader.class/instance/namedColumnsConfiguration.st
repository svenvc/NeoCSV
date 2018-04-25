convenience
namedColumnsConfiguration
	"Assuming there is a header row that has not yet been read,
	configure the receiver to read each row as a Dictionary where
	each field is stored under a column name.
	Note that each field is read as a string."
	
	self recordClass: Dictionary.
	self addFieldsAt: (self readHeader collect: [ :each | each asSymbol ])