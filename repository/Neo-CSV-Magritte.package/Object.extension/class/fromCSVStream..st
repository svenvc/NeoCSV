*Neo-CSV-Magritte
fromCSVStream: aStream
	| reader fields header |
	reader := self neoCSVReaderClass on: aStream.
	header := reader readHeader.
	reader recordClass: self.
	fields := self new magritteDescription children.
	header do: [ :h | 
		fields
			detect: [ :f |
				f 
					propertyAt: #csvFieldName
					ifPresent: [ :val | val = h asString trimmed ]
					ifAbsent: [ false ] ]
			ifFound: [ :e | reader addFieldDescribedBy: e ]
			ifNone: [ reader addIgnoredField ] ].
	^ reader upToEnd "or do more processing e.g. `select: [ :record | record lastName isNotNil ]`"