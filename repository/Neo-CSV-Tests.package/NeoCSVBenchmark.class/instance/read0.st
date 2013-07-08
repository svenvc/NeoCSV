public
read0
	self filename readStreamDo: [ :stream | 
		(NeoCSVReader on: stream)
			upToEnd ]