testing
testSimpleRaw
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						fieldWriter: #raw;
						nextPut: #(one two three);
						nextPutAll: #( (1 2 3) (4 5 6) (7 8 9)) ])
		equals: (String crlf join: #( 'one,two,three' '1,2,3' '4,5,6' '7,8,9' ''))