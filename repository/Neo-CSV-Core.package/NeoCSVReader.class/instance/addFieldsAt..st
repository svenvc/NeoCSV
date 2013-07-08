convenience
addFieldsAt: keys
	"Add fields based on a collection of keys for #at:put: not doing any conversions"

	keys do: [ :each |
		self addFieldAt: each ]