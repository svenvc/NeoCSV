testing
testEmptyConversions
	| input |
	input := (String crlf join: #( '1,2.5,foo' ',,' )).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					addIntegerField;
					addFloatField;
					addField;
					upToEnd)
		equals: { 
					#( 1 2.5 'foo' ). 
					#( nil nil nil ) }