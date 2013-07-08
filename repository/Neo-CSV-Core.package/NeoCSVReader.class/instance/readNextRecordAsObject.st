private
readNextRecordAsObject
	| object |
	object := recordClass new.
	fieldAccessors do: [ :each | | rawValue |
		rawValue := self readField.
		(rawValue isEmpty or: [ each isNil ])
			ifFalse: [ each value: object value: rawValue ] ].
	self assert: (self atEnd or: [ self readEndOfLine ]).
	^ object