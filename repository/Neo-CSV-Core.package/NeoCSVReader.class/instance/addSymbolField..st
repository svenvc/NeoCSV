convenience
addSymbolField: accessor
	"Add a field with accessor read as Symbol"

	self 
		addField: accessor 
		converter: [ :string | string asSymbol ]