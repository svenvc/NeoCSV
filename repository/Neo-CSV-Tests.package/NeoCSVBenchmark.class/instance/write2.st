public
write2
	self filename writeStreamDo: [ :stream | 
		(NeoCSVWriter on: (ZnBufferedWriteStream on: stream))
			addRawFields: #(first second third);
			nextPutAll: data;
			flush ]