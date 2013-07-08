public
write1
	self filename writeStreamDo: [ :stream | 
		(NeoCSVWriter on: (ZnBufferedWriteStream on: stream))
			nextPutAll: data;
			flush ]