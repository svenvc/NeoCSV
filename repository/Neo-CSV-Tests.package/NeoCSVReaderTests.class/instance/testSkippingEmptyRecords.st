testing
testSkippingEmptyRecords
	| input output |
	input := '1,2,3\\4,5,6\,,\7,8,9' withCRs.
	output := (NeoCSVReader on: input readStream) 
		select: [ :each | each notEmpty and: [ (each allSatisfy: #isNil) not ] ].
	self assert: output equals: #(#('1' '2' '3') #('4' '5' '6') #('7' '8' '9')).
	output := (NeoCSVReader on: input readStream) 
		emptyFieldValue: '';
		select: [ :each | each notEmpty and: [ (each allSatisfy: #isEmpty) not ] ].
	self assert: output equals: #(#('1' '2' '3') #('4' '5' '6') #('7' '8' '9'))