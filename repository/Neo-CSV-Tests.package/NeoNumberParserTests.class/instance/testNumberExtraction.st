testing
testNumberExtraction
	self assert: (NeoNumberParser parse: '00123ABC') equals: 123.
	self assert: ((NeoNumberParser on: '  123ABC') consumeWhitespace; next) equals: 123.
	self should: [ (NeoNumberParser on: '  123ABC') consumeWhitespace; next; failIfNotAtEnd ] raise: Error.
