convenience
addFloatField
	"Add a field for indexable records parsed as Float"

	self addFieldConverter: [ :string | NeoNumberParser parse: string ]