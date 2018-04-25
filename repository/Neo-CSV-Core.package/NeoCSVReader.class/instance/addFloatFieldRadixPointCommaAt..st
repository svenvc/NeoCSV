convenience
addFloatFieldRadixPointCommaAt: key
	"Add a field for key for #at:put: parsed as Float using a comma as radix point"

	self 
		addFieldAt: key 
		converter: [ :string | (NeoNumberParser on: string) radixPoint: $, ; next ]