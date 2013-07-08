private
writeQuotedField: object
	| string |
	string := object asString.
	writeStream nextPut: $".
	string do: [ :each |
		each == $" 
			ifTrue: [ writeStream nextPut: $"; nextPut: $" ]
			ifFalse: [ writeStream nextPut: each ] ].
	writeStream nextPut: $"