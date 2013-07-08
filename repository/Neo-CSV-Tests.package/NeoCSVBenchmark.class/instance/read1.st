public
read1
	self filename readStreamDo: [ :stream | 
		(NeoCSVReader on: (ZnBufferedReadStream on: stream))
			upToEnd ]