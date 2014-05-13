testing
testReadHeader
	| input |
	input := (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' '')).
	self 
		assert: (NeoCSVReader on: input readStream) readHeader
		equals: #('x' 'y' 'z')