initialize-release
fieldCount: anObject
	"Set the field count up front.
	This will be used when reading records as Arrays.
	This instance variable will be set and used automatically based on the first record seen.
	If set, the fieldAccessors collection defines (overrides) the fieldCount."

	fieldCount := anObject