accessing
readHeader
	"Read a record, presumably a header and return the header field names.
	This should normally be called only at the beginning and only once.
	This sets the fieldCount (but fieldAccessors overrides fieldCount)."

	| names |
	names := Array streamContents: [ :out |
		 [ self atEnd or: [ self readEndOfLine ] ]
			whileFalse: [ 
				out nextPut: self readField.
				(self readSeparator and: [ self atEnd or: [ self peekEndOfLine ] ])
					ifTrue: [ out nextPut: emptyFieldValue ] ] ].
	fieldCount := names size.
	^ names