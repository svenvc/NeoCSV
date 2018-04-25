initialize-release
addOptionalQuotedField: accessor
	"Add a field based on an accessor to be written as a #optionalQuoted field.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeOptionalQuotedField: (accessor value: object) ]