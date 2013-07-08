initialize-release
addObjectFieldAt: key
	"Add a field based on a key to be written as an #object field"

	self addFieldAccessor: [ :object |
		self writeObjectField: (object at: key) ]