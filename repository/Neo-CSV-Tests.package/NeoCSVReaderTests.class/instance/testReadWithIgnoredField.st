testing
testReadWithIgnoredField
	| input |
	input := (String crlf join: #( '1,2,a,3' '1,2,b,3' '1,2,c,3' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					addIntegerField;
					addIntegerField;
					addIgnoredField;
					addIntegerField;
					upToEnd)
		equals: {
			#(1 2 3).
			#(1 2 3).
			#(1 2 3).}