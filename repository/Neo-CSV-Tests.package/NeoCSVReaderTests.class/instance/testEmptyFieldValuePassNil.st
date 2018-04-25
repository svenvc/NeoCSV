testing
testEmptyFieldValuePassNil
	| date1 date2 |
	date1 := '1900-01-01' asDate.
	date2 := '2000-12-31' asDate.
	self 
		assert: ((NeoCSVReader on: 
							'date1,date2\2018-01-01,2018-02-01\2018-01-01,\,2018-02-01\\' withCRs readStream) 
						emptyFieldValue: #passNil;
						addFieldConverter: [ :input | input ifNil: [ date1 ] ifNotNil: [ input asDate ] ];
						addFieldConverter: [ :input | input ifNil: [ date2 ] ifNotNil: [ input asDate ] ];
						skipHeader; 
						upToEnd)
		equals: (Array 
							with: (Array with: '2018-01-01' asDate with: '2018-02-01' asDate)
							with: (Array with: '2018-01-01' asDate with: date2)
							with: (Array with: date1 with: '2018-02-01' asDate)
							with: (Array with: date1 with: date2)).