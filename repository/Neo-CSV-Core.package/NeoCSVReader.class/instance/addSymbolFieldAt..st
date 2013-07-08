convenience
addSymbolFieldAt: key
	"Add a field for key for #at:put: read as Symbol"

	self 
		addFieldAt: key 
		converter: [ :string | string asSymbol ]