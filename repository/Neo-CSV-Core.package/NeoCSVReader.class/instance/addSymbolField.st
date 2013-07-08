convenience
addSymbolField
	"Add a field for indexable records read as Symbol"

	self addFieldConverter: [ :string | string asSymbol ]