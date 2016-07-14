testing
testHexadecimalIntegers
	self assert: (NeoNumberParser parse: '7B' base: 16) equals: 123.
	self assert: (NeoNumberParser parse: '-7B' base: 16) equals: -123.
	self assert: (NeoNumberParser parse: '0' base: 16) equals: 0.
	"On some platforms Character>>#digitValue only handles uppercase,
	then NeoNumberParser cannot deal with lowercase hex characters"
	$a digitValue = 10 ifFalse: [ ^ self ].
	self assert: (NeoNumberParser parse: '7b' base: 16) equals: 123.
	self assert: (NeoNumberParser parse: '-7b' base: 16) equals: -123
