testing
testReadTestsObjectsWithIgnoredField
	| input |
	input := (String crlf join: #( '"x","y",''-'',"z"' '100,200,a,300' '100,200,b,300' '100,200,c,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					skipHeader;
					recordClass: NeoCSVTestObject;
					addIntegerField: #x: ;
					addIntegerField: #y: ;
					addIgnoredField;
					addIntegerField: #z: ;
					upToEnd)
		equals: { 
					NeoCSVTestObject example. 
					NeoCSVTestObject example. 
					NeoCSVTestObject example }