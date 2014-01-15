private - reading
readNextRecordWithoutFieldAccessors: record
	1 to: fieldCount do: [ :each | | rawValue |
		rawValue := self readFieldAndSeparator.
		rawValue isEmpty
			ifFalse: [ 
				 record at: each put: rawValue ] ]