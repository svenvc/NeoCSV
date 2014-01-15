testing
testReadIntegersReadingHeaderAfterFieldDefinitions
	| input |
	input := (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					addIntegerField;
					addIntegerField ;
					addIntegerField;
					skipHeader;
					upToEnd)
		equals: #((100 200 300)(100 200 300)(100 200 300))