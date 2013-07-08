testing
testBinaryIntegers
	self assert: (NeoNumberParser parse: '1111011' base: 2) equals: 123.
	self assert: (NeoNumberParser parse: '-1111011' base: 2) equals: -123.
	self assert: (NeoNumberParser parse: '0' base: 2) equals: 0.

