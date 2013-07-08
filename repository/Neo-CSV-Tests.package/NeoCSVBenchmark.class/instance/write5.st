public
write5
	self filename writeStreamDo: [ :stream | 
		(NeoCSVWriter on: (ZnBufferedWriteStream on: stream))
			fieldWriter: #object;
			nextPutAll: data;
			flush ]