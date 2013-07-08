initialize-release
addFieldAt: key
	"Add a field that will be stored under key in recordClass as String"
	
	self
		recordClassIsIndexable: false; 
		addFieldAccessor: [ :object :string |
			object at: key put: string ]