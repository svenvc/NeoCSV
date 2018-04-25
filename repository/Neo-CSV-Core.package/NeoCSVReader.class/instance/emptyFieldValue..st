initialize-release
emptyFieldValue: object
	"Set the value to be used when reading empty or missing fields.
	The default is nil. Empty or missing fields are never set 
	when the record class is non-indexeabe, nor are they passed to converters.
	The special #passNil can be set to force that in the case of 
	an empty or missing field nil *is* passed to a converter block
	so that per field empty values or specific behavior are possible."
	
	emptyFieldValue := object