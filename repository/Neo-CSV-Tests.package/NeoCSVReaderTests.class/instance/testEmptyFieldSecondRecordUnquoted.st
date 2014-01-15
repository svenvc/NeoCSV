testing
testEmptyFieldSecondRecordUnquoted
	self 
		assert: (NeoCSVReader on: 'foo,bar\100,' withCRs readStream) upToEnd
		equals: #(('foo' 'bar')('100' nil))