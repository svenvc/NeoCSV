convenience
addFloatField: accessor
	"Add a field with accessor parsed as Float"

	self 
		addField: accessor 
		converter: [ :string | NeoNumberParser parse: string ]