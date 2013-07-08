private
writeFieldsUsingDo: anObject
	| first |
	first := true.
	anObject do: [ :each |
		first ifTrue: [ first := false ] ifFalse: [ self writeSeparator ].
		self writeField: each ]