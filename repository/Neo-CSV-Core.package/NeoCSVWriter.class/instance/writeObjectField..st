private
writeObjectField: object
	object = emptyFieldValue
		ifFalse: [ object printOn: writeStream ]