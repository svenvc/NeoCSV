testing
testWideOptionalQuoted
	self
		assert: (String streamContents: [ :out |
			(NeoCSVWriter on: out) 
				fieldWriter: #optionalQuoted; 
				nextPut: { 1. 'foo "1" ', Character euro asString. true} ])
		equals: ('1,"foo ""1"" ', Character euro asString, '",true', String crlf)