private - reading
readNextRecordAsObject
	| object |
	object := recordClass new.
	fieldAccessors do: [ :each | | rawValue |
		rawValue := self readFieldAndSeparator.
		(rawValue isEmpty or: [ each isNil ])
			ifFalse: [ each value: object value: rawValue ] ].
	self readAtEndOrEndOfLine.
	^ object