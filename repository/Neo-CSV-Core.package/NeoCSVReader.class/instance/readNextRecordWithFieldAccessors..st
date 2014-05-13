private - reading
readNextRecordWithFieldAccessors: record
	| fieldIndex |
	fieldIndex := 1.
	fieldAccessors do: [ :each | | rawValue |
		rawValue := self readFieldAndSeparator.
		(rawValue = emptyFieldValue or: [ each isNil ])
			ifFalse: [ 
				record at: fieldIndex put: (each value: rawValue).
				fieldIndex := fieldIndex + 1 ] ]