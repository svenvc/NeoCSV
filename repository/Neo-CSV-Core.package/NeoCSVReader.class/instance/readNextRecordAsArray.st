private
readNextRecordAsArray
	fieldAccessors ifNotNil: [ 
		fieldCount := fieldAccessors count: [ :each | each notNil ] ].
	^ fieldCount 
		ifNil: [ | record |
			record := self readFirstRecord.
			fieldCount := record size.
			record ] 
		ifNotNil: [
			self readNextRecord ]