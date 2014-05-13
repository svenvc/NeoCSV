initialize-release
emptyFieldValue: object
	"Set the empty field value to object.
	When reading fields from records to be written out, 
	if the field value equals the emptyFieldValue,
	write out an empty or missing field."
	
	emptyFieldValue := object