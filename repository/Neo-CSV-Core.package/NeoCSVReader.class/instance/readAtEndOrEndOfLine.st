private
readAtEndOrEndOfLine
	^ self atEnd or: [ self readEndOfLine ]
