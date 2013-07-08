public
write3
	self filename writeStreamDo: [ :stream | 
		(NeoCSVWriter on: (ZnBufferedWriteStream on: stream))
			addObjectFields: #(first second third);
			nextPutAll: data;
			flush ]