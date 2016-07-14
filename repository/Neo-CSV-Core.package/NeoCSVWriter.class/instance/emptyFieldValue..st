initialize-release
emptyFieldValue: object
	"Set the empty field value to object.
	When reading fields from records to be written out, 
	if the field value equals the emptyFieldValue,
	it will be considered an empty field and written as such."
	
	emptyFieldValue := object