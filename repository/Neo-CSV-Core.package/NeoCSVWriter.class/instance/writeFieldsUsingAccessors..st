private
writeFieldsUsingAccessors: anObject
	| first |
	first := true.
	fieldAccessors do: [ :each | | fieldValue | 
		first ifTrue: [ first := false ] ifFalse: [ self writeSeparator ].
		fieldValue := each value: anObject ]