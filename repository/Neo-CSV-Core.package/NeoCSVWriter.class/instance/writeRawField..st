private
writeRawField: object
	object = emptyFieldValue 
		ifFalse: [	writeStream nextPutAll: object asString ]