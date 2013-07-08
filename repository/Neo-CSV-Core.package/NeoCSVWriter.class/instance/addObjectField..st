initialize-release
addObjectField: accessor
	"Add a field based on an accessor to be written as an #object field.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeObjectField: (accessor value: object) ]