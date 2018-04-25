testing
testDecimalIntegers
	self assert: (NeoNumberParser parse: '123') equals: 123.
	self assert: (NeoNumberParser parse: '-123') equals: -123.
	self assert: (NeoNumberParser parse: '0') equals: 0.
	self assert: (NeoNumberParser parse: '12345678901234567890') equals: 12345678901234567890.

	self 
		assert: (NeoNumberParser parse: '12345678901234567890123456789012345678901234567890123456789012345678901234567890') 
		equals: 12345678901234567890123456789012345678901234567890123456789012345678901234567890.
		
	self assert: (NeoNumberParser parse: '00123ABC') equals: 123.
	self assert: (NeoNumberParser parse: '-0') equals: 0.
