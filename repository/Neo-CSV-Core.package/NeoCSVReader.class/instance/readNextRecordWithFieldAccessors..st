private - reading
readNextRecordWithFieldAccessors: record
	| fieldIndex |
	fieldIndex := 1.
	fieldAccessors do: [ :each | | rawValue |
		rawValue := self readFieldAndSeparator.
		"nil field accessors are used to ignore fields"
		each
			ifNotNil: [ 
				rawValue = emptyFieldValue
					ifTrue: [ record at: fieldIndex put: emptyFieldValue ]
					ifFalse: [ record at: fieldIndex put: (each value: rawValue) ].
				fieldIndex := fieldIndex + 1 ] ]