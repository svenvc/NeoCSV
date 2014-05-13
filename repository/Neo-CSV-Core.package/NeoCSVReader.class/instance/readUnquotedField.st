private - reading
readUnquotedField
	(self atEnd or: [ self peekSeparator or: [ self peekEndOfLine ] ])
		ifTrue: [ ^ emptyFieldValue ].
	^ self stringStreamContents: [ :stream |
		[ self atEnd or: [ self peekSeparator or: [ self peekEndOfLine ] ] ]
			whileFalse: [ 
				stream nextPut: self nextChar ] ]