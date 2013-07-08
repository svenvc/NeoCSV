private
readNextRecordWithoutFieldAccessors: record
	1 to: fieldCount do: [ :each | | rawValue |
		rawValue := self readField.
		rawValue isEmpty
			ifFalse: [ 
				 record at: each put: rawValue ] ]