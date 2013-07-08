initialize-release
addRawField: accessor
	"Add a field based on an accessor to be written as a #raw field.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeRawField: (accessor value: object) ]