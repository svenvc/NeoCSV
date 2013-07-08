convenience
addFloatFieldAt: key
	"Add a field for key for #at:put: parsed as Float"

	self 
		addFieldAt: key 
		converter: [ :string | NeoNumberParser parse: string ]