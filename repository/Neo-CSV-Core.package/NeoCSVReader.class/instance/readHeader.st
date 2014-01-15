accessing
readHeader
	"Read a record, presumably a header and return the header field names.
	This should normally be called only at the beginning and only once."

	^ Array streamContents: [ :out |
		 [ self atEnd or: [ self readEndOfLine ] ]
			whileFalse: [ 
				out nextPut: self readField.
				(self readSeparator and: [ self atEnd or: [ self peekEndOfLine ] ])
					ifTrue: [ out nextPut: String new ] ] ]