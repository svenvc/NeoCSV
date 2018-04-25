testing
testOptionalQuotedFields
	self
		assert:
			(String
				streamContents: [ :stream | 
					(NeoCSVWriter on: stream)
						fieldWriter: #optionalQuoted;
						nextPut:
							{'one'.
							't,wo'.
							't"hree'.
							'fo' , String crlf , 'ur'} ])
		equals: 'one,"t,wo","t""hree","fo' , String crlf , 'ur"', String crlf