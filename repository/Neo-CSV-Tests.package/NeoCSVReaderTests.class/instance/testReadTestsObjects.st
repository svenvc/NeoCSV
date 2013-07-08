testing
testReadTestsObjects
	| input |
	input := (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					skipHeader;
					recordClass: NeoCSVTestObject;
					addIntegerField: #x: ;
					addIntegerField: #y: ;
					addIntegerField: #z: ;
					upToEnd)
		equals: { 
					NeoCSVTestObject example. 
					NeoCSVTestObject example. 
					NeoCSVTestObject example }