private
applyAccessor: accessor on: object with: value
	"Use accessor to assign value on a property of object.
	Accessor can be a block or mutator symbol."
	
	"If Symbol implemented #value:value: this could be implemented more elegantly."
	
	accessor isBlock
		ifTrue: [ accessor value: object value: value ] 
		ifFalse: [ object perform: accessor with: value ]