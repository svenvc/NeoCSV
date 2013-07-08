initialize-release
recordClassIsIndexable: boolean
	"Set whether recordClass should be treated as an indexable sequenceable collection
	class that implements #new: and #streamContents and whose instances implement #at:put: 
	If false, fields accessors have to be provided.
	Will be set automatically when field accessors or converters are set."
	
	recordClassIsIndexable := boolean 