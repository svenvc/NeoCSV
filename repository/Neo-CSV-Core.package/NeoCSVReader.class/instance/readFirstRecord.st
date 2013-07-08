private
readFirstRecord 
	"This only used for array based records when there are no field accessors or 
	when there is no field count, to obtain a field count based on the first record"
	
	^ recordClass streamContents: [ :stream |
		[ self atEnd or: [ self readEndOfLine ] ]
			whileFalse: [ 
				stream nextPut: self readField ] ]