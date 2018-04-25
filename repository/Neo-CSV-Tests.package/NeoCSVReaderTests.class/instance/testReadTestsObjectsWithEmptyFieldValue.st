testing
testReadTestsObjectsWithEmptyFieldValue
	| input |
	input := (String crlf join: #( '"x","y","z"' '100,200,300' '1,,3' '100,200,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					skipHeader;
					recordClass: NeoCSVTestObject2;
					emptyFieldValue: #empty;
					addIntegerField: #x: ;
					addIntegerField: #y: ;
					addIntegerField: #z: ;
					upToEnd)
		equals: { 
					NeoCSVTestObject2 example. 
					NeoCSVTestObject2 new x: 1; z: 3; yourself. "Note that y contains #y from #initialize and was NOT touched" 
					NeoCSVTestObject2 example }.
	self 
		assert: ((NeoCSVReader on: input readStream) 
					skipHeader;
					recordClass: NeoCSVTestObject2;
					addIntegerField: #x: ;
					addIntegerField: #y: ;
					addIntegerField: #z: ;
					upToEnd)
		equals: { 
					NeoCSVTestObject2 example. 
					NeoCSVTestObject2 new x: 1; z: 3; yourself. "Note that y contains #y from #initialize and was NOT touched" 
					NeoCSVTestObject2 example }