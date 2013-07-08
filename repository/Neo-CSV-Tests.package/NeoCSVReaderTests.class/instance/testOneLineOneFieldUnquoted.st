testing
testOneLineOneFieldUnquoted
	self 
		assert: (NeoCSVReader on: '1' readStream) upToEnd
		equals: #(('1'))