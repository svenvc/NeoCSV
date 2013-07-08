initialize-release
addQuotedFieldAt: key
	"Add a field based on a key to be written as a #quoted field"

	self addFieldAccessor: [ :object |
		self writeQuotedField: (object at: key) ]