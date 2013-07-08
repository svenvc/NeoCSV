initialize-release
addField: accessor
	"Add a field based on a mutator accessor accepting a field 
	String as argument to be sent to an instance of recordClass.
	Accessor can be a Symbol or a Block"
	
	self
		recordClassIsIndexable: false; 
		addFieldAccessor: [ :object :string |
			self applyAccessor: accessor on: object with: string ]