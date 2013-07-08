initialize-release
initialize 
	data := Array new: 100000 streamContents: [ :stream |
		1 to: 100000 do: [ :each |
			stream nextPut: (Array with: each with: each negated with: (100000 - each)) ] ]