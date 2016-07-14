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
		equals: #(('1' '' '3' '' '5')).
	self 
		assert: ((NeoCSVReader on: 'a,b,c\,,\"","",""\1,2,3\' withCRs readStream)
						emptyFieldValue: #empty;
						upToEnd)
		equals: #(('a' 'b' 'c')(empty empty empty)(empty empty empty)('1' '2' '3'))