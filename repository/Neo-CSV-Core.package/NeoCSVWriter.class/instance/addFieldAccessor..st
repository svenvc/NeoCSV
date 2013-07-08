private
addFieldAccessor: block
	fieldAccessors 
		ifNil: [
			fieldAccessors := Array with: block ]
		ifNotNil: [
			fieldAccessors := fieldAccessors copyWith: block ]