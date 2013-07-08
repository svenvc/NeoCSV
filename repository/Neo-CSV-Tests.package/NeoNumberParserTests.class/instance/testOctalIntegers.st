testing
testOctalIntegers
	self assert: (NeoNumberParser parse: '173' base: 8) equals: 123.
	self assert: (NeoNumberParser parse: '-173' base: 8) equals: -123.
	self assert: (NeoNumberParser parse: '0' base: 8) equals: 0.

