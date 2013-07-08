testing
testOneLineUnquoted
	self 
		assert: (NeoCSVReader on: '1,2,3' readStream) upToEnd
		equals: #(('1' '2' '3'))