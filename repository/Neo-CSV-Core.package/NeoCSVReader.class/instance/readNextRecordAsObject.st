private - reading
readNextRecordAsObject
	| object |
	object := recordClass new.
	fieldAccessors do: [ :each | | rawValue |
		rawValue := self readFieldAndSeparator.
		"nil field accessors are used to ignore fields"
		each 
			ifNotNil: [  
				rawValue = emptyFieldValue
					ifTrue: [ 
						emptyFieldValue = #passNil 
							ifTrue: [ each value: object value: nil ] ]
					ifFalse: [ each value: object value: rawValue ] ] ].
	self readAtEndOrEndOfLine.
	^ object