accessing
upToEnd 
	"Read and collect records into an Array until there are none left.
	Return the array."
	
	^ Array streamContents: [ :stream |
		self do: [ :each | stream nextPut: each ] ]