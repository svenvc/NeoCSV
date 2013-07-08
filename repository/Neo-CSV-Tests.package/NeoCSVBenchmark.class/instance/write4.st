public
write4
	self filename writeStreamDo: [ :stream | 
		(NeoCSVWriter on: (ZnBufferedWriteStream on: stream))
			fieldWriter: #raw;
			nextPutAll: data;
			flush ]