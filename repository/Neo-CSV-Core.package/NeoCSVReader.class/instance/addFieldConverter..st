initialize-release
addFieldConverter: converter
	"Add the next indexable field with converter block, 
	accepting a String and returning a specific object"

	self
		recordClassIsIndexable: true; 
		addFieldAccessor: converter