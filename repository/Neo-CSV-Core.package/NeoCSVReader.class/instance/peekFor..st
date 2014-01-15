private
peekFor: character
	self peekChar == character
		ifTrue: [ 
			self nextChar. 
			^ true ].
	^ false