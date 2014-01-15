private - reading
readNextRecord
	| record |
	record := recordClass new: fieldCount.
	fieldAccessors
		ifNil: [ self readNextRecordWithoutFieldAccessors: record ]
		ifNotNil: [ self readNextRecordWithFieldAccessors: record ].
	self readAtEndOrEndOfLine.
	^ record