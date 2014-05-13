testing
testEmptyFieldValue
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						nextPut: #(one two three);
						nextPutAll: #( (1 2 nil) (4 nil 6) (nil 8 9)) ])
		equals: (String crlf join: #( '"one","two","three"' '"1","2",""' '"4","","6"' '"","8","9"' '')).
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						emptyFieldValue: #empty;
						nextPut: #(one two three);
						nextPutAll: #( (1 2 empty) (4 empty 6) (empty 8 9)) ])
		equals: (String crlf join: #( '"one","two","three"' '"1","2",""' '"4","","6"' '"","8","9"' '')).
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						emptyFieldValue: Object new;
						nextPut: #(one two three);
						nextPutAll: #( (1 2 nil) (4 nil 6) (nil 8 9)) ])
		equals: (String crlf join: #( '"one","two","three"' '"1","2","nil"' '"4","nil","6"' '"nil","8","9"' ''))