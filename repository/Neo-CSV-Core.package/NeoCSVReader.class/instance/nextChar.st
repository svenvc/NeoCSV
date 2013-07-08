private
nextChar
	^ charBuffer 
		ifNil: [ 
			readStream next ]
		ifNotNil: [ | char |
			char := charBuffer.
			charBuffer := nil.
			^ char ]