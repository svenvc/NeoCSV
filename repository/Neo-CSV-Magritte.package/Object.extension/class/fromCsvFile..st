*Neo-CSV-Magritte
fromCsvFile: file
	^ file readStreamDo: [ :str | self fromCSVStream: str ]