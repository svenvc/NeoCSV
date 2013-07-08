initialize-release
addField: accessor
	"Add a field based on an accessor to be written using fieldWriter.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeField: (accessor value: object) ]