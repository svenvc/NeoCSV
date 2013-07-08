public
read3
	self filename readStreamDo: [ :stream | 
		(NeoCSVReader on: (ZnBufferedReadStream on: stream))
			recordClass: NeoCSVTestObject;
			addIntegerField: #x: ;
			addIntegerField: #y: ;
			addIntegerField: #z: ;
			upToEnd ]