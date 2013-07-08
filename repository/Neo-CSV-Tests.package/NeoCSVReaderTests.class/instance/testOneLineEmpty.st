testing
testOneLineEmpty
	self 
		assert: (NeoCSVReader on: '' readStream) upToEnd
		equals: #()