initialize-release
addFieldAt: key
	"Add a field based on a key to be written using fieldWriter"

	self addFieldAccessor: [ :object |
		self writeField: (object at: key ifAbsent: [ '' ]) ]