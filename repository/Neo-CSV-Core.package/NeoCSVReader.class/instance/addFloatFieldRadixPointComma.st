convenience
addFloatFieldRadixPointComma
	"Add a field for indexable records parsed as Float using a comma as radix point"

	self addFieldConverter: [ :string | (NeoNumberParser on: string) radixPoint: $, ; next ]