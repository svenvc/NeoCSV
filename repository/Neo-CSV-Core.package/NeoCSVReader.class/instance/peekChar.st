private
peekChar
	^ charBuffer 
		ifNil: [ 
			charBuffer := readStream next ]