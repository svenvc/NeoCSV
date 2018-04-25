initialize-release
addOptionalQuotedFieldAt: key
	"Add a field based on a key to be written as a #optionalQuoted field"

	self addFieldAccessor: [ :object |
		self writeOptionalQuotedField: (object at: key) ]