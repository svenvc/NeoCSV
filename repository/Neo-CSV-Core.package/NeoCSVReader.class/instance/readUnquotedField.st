private
readUnquotedField
	^ self stringStreamContents: [ :stream |
		[ self atEnd or: [ self readSeparator or: [ self peekEndOfLine ] ] ]
			whileFalse: [ 
				stream nextPut: self nextChar ] ]