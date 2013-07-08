convenience
addIntegerField: accessor
	"Add a field with accessor parsed as Integer"

	self 
		addField: accessor 
		converter: [ :string | NeoNumberParser parse: string ]