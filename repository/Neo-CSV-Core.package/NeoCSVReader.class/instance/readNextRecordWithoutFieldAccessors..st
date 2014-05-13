private - reading
readNextRecordWithoutFieldAccessors: record
	1 to: fieldCount do: [ :each | | rawValue |
		rawValue := self readFieldAndSeparator.
		rawValue = emptyFieldValue 
			ifFalse: [ 
				 record at: each put: rawValue ] ]