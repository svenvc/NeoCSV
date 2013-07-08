testing
testReadDictionaries
	| input |
	input := (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					skipHeader;
					recordClass: Dictionary;
					addIntegerFieldAt: #x ;
					addIntegerFieldAt: #y ;
					addIntegerFieldAt: #z ;
					upToEnd)
		equals: { 
					Dictionary newFromPairs: #(x 100 y 200 z 300). 
					Dictionary newFromPairs: #(x 100 y 200 z 300). 
					Dictionary newFromPairs: #(x 100 y 200 z 300) }