testing
testWriteEmbeddedQuote
	| header |
	header := String streamContents: [ :out |
		(NeoCSVWriter on: out)
			nextPut: #(foo 'x"y"z') ].
	self assert: header equals: '"foo","x""y""z"', String crlf