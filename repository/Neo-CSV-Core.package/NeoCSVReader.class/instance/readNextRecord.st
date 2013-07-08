private
readNextRecord
	| record |
	record := recordClass new: fieldCount.
	fieldAccessors
		ifNil: [ self readNextRecordWithoutFieldAccessors: record ]
		ifNotNil: [ self readNextRecordWithFieldAccessors: record ].
	self assert: (self atEnd or: [ self readEndOfLine ]).
	^ record