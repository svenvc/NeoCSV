testing
testEmptyConversionsTestObject
	| input |
	input := (String crlf join: #( '1,2.5,foo' ',,' )).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					recordClass: NeoCSVTestObject;
					addIntegerField: #x: ;
					addFloatField: #y: ;
					addField: #z: ;
					upToEnd)
		equals: { 
					NeoCSVTestObject x: 1 y: 2.5 z: 'foo'. 
					NeoCSVTestObject new }