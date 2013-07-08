testing
testReadAsByteArrays
	| input |
	input := (String crlf join: #( '1,2,3' '1,2,3' '1,2,3' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					recordClass: ByteArray;
					addIntegerField;
					addIntegerField ;
					addIntegerField;
					upToEnd)
		equals: {
			#[1 2 3].
			#[1 2 3].
			#[1 2 3].}