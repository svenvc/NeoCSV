testing
testEmbeddedQuotes
	self 
		assert: (NeoCSVReader on: '1,"x""y""z",3' readStream) upToEnd
		equals: #(('1' 'x"y"z' '3'))