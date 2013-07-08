comparing
= anObject
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ x = anObject x
		and: [
			y = anObject y
				and: [
					z = anObject z ] ]