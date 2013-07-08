convenience
addIntegerFieldAt: key
	"Add a field for key for #at:put: parsed as Integer"

	self 
		addFieldAt: key 
		converter: [ :string | NeoNumberParser parse: string ]