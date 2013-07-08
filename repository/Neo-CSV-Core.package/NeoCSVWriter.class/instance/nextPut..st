accessing
nextPut: anObject
	"Write anObject as single record.
	Depending on configuration fieldAccessors or a #do: enumeration will be used."
	
	fieldAccessors 
		ifNil: [
			self writeFieldsUsingDo: anObject ]
		ifNotNil: [
			self writeFieldsUsingAccessors: anObject ].
	self writeEndOfLine 