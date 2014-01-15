private - reading
readFirstRecord 
	"This is only used for array based records when there are no field accessors or 
	when there is no field count, to obtain a field count based on the first record"
	
	^ recordClass streamContents: [ :stream |
		[ self atEnd or: [ self readEndOfLine ] ]
			whileFalse: [ 
				stream nextPut: self readField.
				(self readSeparator and: [ self atEnd or: [ self peekEndOfLine ] ])
					ifTrue: [ stream nextPut: String new ] ] ]