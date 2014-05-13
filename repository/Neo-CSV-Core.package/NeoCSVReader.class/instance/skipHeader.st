convenience
skipHeader
	"Read a record, presumably a header, with the intention of skipping it.
	This should normally be called only at the beginning and only once.
	This sets the fieldCount (but fieldAccessors overrides fieldCount)."

	self readHeader