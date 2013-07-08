private
readNextRecordWithFieldAccessors: record
	| fieldIndex |
	fieldIndex := 1.
	fieldAccessors do: [ :each | | rawValue |
		rawValue := self readField.
		rawValue isEmpty
			ifFalse: [ 
				each ifNotNil: [ 
					record at: fieldIndex put: (each value: rawValue).
					fieldIndex := fieldIndex + 1 ] ] ]