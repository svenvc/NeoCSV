testing
testRawFieldsTestObjects
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						nextPut: #(x y z);
						addRawFields: #(x y z); 
						nextPutAll: { 
							NeoCSVTestObject example. 
							NeoCSVTestObject example. 
							NeoCSVTestObject example } ])
		equals: (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' ''))