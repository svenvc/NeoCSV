private
readQuote
	self peekQuote
		ifTrue: [ 
			self nextChar. 
			^ true ].
	^ false