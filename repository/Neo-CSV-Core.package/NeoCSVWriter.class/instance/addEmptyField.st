initialize-release
addEmptyField
	"Add an empty field to be written using fieldWriter"

	self addFieldAccessor: [ :object |
		self writeField: '' ]