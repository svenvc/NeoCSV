testing
testEmptyLastFieldUnquoted
	self 
		assert: (NeoCSVReader on: '1,2,' readStream) upToEnd
		equals: #(('1' '2' nil))