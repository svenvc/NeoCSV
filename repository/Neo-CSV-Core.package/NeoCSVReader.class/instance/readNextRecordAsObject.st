private - reading
readNextRecordAsObject
	| object |
	object := recordClass new.
	fieldAccessors do: [ :each | | rawValue |
		rawValue := self readFieldAndSeparator.
		"Note that empty/missing fields are not set"
		(rawValue = emptyFieldValue or: [ each isNil ])
			ifFalse: [ each value: object value: rawValue ] ].
	self readAtEndOrEndOfLine.
	^ object