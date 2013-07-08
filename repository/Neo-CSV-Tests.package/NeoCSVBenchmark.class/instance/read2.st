public
read2
	self filename readStreamDo: [ :stream | 
		(NeoCSVReader on: stream)
			recordClass: NeoCSVTestObject;
			addIntegerField: #x: ;
			addIntegerField: #y: ;
			addIntegerField: #z: ;
			upToEnd ]