convenience
addIntegerField
	"Add a field for indexable records parsed as Integer"

	self addFieldConverter: [ :string | NeoNumberParser parse: string ]