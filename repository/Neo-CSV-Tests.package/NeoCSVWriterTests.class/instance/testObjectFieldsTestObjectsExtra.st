testing
testObjectFieldsTestObjectsExtra
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						fieldWriter: #raw;
						nextPut: #(x empty y constant z);
						addObjectField: #x;
						addEmptyField;
						addObjectField: #y;
						addConstantField: 'X';
						addObjectField: #z; 
						nextPutAll: { 
							NeoCSVTestObject example. 
							NeoCSVTestObject example. 
							NeoCSVTestObject example } ])
		equals: (String crlf join: #( 
					'x,empty,y,constant,z' 
					'100,,200,X,300' 
					'100,,200,X,300' 
					'100,,200,X,300' ''))