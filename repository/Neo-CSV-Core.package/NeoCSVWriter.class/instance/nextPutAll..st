accessing
nextPutAll: collection
	"Write a collection of objects as records"
	
	collection do: [ :each | 
		self nextPut: each ]