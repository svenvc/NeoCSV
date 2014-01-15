private - reading
readUnquotedField
	^ self stringStreamContents: [ :stream |
		[ self atEnd or: [ self peekSeparator or: [ self peekEndOfLine ] ] ]
			whileFalse: [ 
				stream nextPut: self nextChar ] ]