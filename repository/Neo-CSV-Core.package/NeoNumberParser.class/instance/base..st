initialize-release
base: integer
	self assert: (integer between: 2 and: 36) description: 'Number base must be between 2 and 36'.
	base := integer