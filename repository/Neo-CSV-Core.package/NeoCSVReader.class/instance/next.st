accessing
next
	"Read the next record.
	I will return an instance of recordClass."
	
	^ recordClassIsIndexable
		ifTrue: [ self readNextRecordAsArray ] 
		ifFalse: [ self readNextRecordAsObject ]