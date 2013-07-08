accessing
do: block
	"Execute block for each record until I am at end."
	
	[ self atEnd ]
		whileFalse: [ 
			block value: self next ]