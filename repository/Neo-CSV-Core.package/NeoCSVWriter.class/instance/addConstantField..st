initialize-release
addConstantField: string
	"Add a constant field to be written using fieldWriter"

	self addFieldAccessor: [ :object |
		self writeField: string ]