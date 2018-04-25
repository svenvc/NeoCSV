testing
testSimpleOptionalQuoted
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						fieldWriter: #optionalQuoted;
						nextPut: #(one two 'thr,ee');
						nextPutAll: #( (1 2 3) (4 5 6) (7 8 9)) ])
		equals: (String crlf join: #( 'one,two,"thr,ee"' '1,2,3' '4,5,6' '7,8,9' ''))