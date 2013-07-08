initialize-release
addField: accessor converter: converter
	"Add a field based on a mutator accessor accepting the result of 
	applying the converter block on the field String read as argument 
	to be sent to an instance of recordClass.
	Accessor can be a Symbol or a Block"

	self
		recordClassIsIndexable: false; 
		addFieldAccessor: [ :object :string |
			self applyAccessor: accessor on: object with: (converter value: string) ]