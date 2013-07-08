initialize-release
addField
	"Add the next indexable field with a pass through converter"
	
	self
		recordClassIsIndexable: true; 
		addFieldAccessor: [ :string | string ]