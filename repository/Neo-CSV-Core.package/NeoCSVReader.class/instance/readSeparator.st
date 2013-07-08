private
readSeparator
	self peekChar == separator
		ifTrue: [ 
			self nextChar. 
			^ true ].
	^ false