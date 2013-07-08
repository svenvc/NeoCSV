initialize-release
addQuotedField: accessor
	"Add a field based on an accessor to be written as a #quoted field.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeQuotedField: (accessor value: object) ]