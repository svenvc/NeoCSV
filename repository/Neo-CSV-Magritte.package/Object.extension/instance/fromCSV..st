*Neo-CSV-Magritte
fromCSV: file
	| reader fields header |
	reader := NeoCSVReader on: file readStream.
	header := self readCSVHeaderWith: reader.
	reader recordClass: self.
	fields := self new magritteDescription children.
	header do: [ :h | 
		fields
			detect: [ :f | (f propertyAt: #csvFieldName) = h asString trimmed ]
			ifFound: [ :e | reader addFieldDescribedBy: e ]
			ifNone: [ reader addIgnoredField ] ].
	^ reader upToEnd