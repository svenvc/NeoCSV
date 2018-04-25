accessing
select: filter
	"Read and collect records that satisfy filter into an Array until there are none left.
	Return the array."

	^ Array streamContents: [ :stream | 
		self 
			select: filter 
			thenDo: [ :each | stream nextPut: each ] ]