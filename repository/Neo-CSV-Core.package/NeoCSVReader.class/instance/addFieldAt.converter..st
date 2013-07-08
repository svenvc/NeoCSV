initialize-release
addFieldAt: key converter: converter
	"Add a field that will be stored under key in recordClass as the result of 
	applying the converter block on the field String read as argument"

	self
		recordClassIsIndexable: false; 
		addFieldAccessor: [ :object :string |
			object at: key put: (converter value: string) ]