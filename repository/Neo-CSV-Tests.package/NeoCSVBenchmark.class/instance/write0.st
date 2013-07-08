public
write0
	self filename writeStreamDo: [ :stream | 
		(NeoCSVWriter on: stream)
			nextPutAll: data ]