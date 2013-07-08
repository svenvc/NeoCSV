initialize-release
addRawFieldAt: key
	"Add a field based on a key to be written as a #raw field"

	self addFieldAccessor: [ :object |
		self writeRawField: (object at: key) ]