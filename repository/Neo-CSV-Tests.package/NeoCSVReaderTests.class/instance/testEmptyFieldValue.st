testing
testEmptyFieldValue
	self 
		assert: ((NeoCSVReader on: '"1",,3,"","5"' readStream) 
						emptyFieldValue: #empty; 
						upToEnd)
		equals: #(('1' empty '3' empty '5')).
	self 
		assert: ((NeoCSVReader on: '"1",,3,"","5"' readStream) 
						emptyFieldValue: ''; 
						upToEnd)
		equals: #(('1' '' '3' '' '5'))