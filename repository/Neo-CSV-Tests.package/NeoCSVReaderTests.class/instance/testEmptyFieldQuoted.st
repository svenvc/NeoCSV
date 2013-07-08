testing
testEmptyFieldQuoted
	self 
		assert: (NeoCSVReader on: '"1",,"3"' readStream) upToEnd
		equals: #(('1' '' '3'))