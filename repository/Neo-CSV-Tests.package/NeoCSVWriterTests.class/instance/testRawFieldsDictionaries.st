testing
testRawFieldsDictionaries
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						nextPut: #(x y z);
						addRawFieldsAt: #(x y z); 
						nextPutAll: { 
							Dictionary newFromPairs: #(x 100 y 200 z 300).
							Dictionary newFromPairs: #(x 400 y 500 z 600). 
							Dictionary newFromPairs: #(x 700 y 800 z 900) } ])
		equals: (String crlf join: #( '"x","y","z"' '100,200,300' '400,500,600' '700,800,900' ''))