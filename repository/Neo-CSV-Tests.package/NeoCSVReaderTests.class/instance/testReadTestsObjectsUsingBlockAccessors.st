testing
testReadTestsObjectsUsingBlockAccessors
	| input |
	input := (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					skipHeader;
					recordClass: NeoCSVTestObject;
					addIntegerField: [ :object :value | object x: value ];
					addIntegerField: [ :object :value | object y: value ];
					addIntegerField: [ :object :value | object z: value ];
					upToEnd)
		equals: { 
					NeoCSVTestObject example. 
					NeoCSVTestObject example. 
					NeoCSVTestObject example }