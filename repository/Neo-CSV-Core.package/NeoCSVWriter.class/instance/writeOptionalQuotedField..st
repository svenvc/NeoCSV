writing
writeOptionalQuotedField: object
	| string |
	object = emptyFieldValue
		ifTrue: [ ^ self ].
	string := object asString.
	({lineEnd asString.
	separator asString.
	'"'} anySatisfy: [ :each | string includesSubstring: each ])
		ifTrue: [ self writeQuotedField: object ]
		ifFalse: [ self writeRawField: object ]