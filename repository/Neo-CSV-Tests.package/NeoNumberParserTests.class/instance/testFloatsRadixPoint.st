testing
testFloatsRadixPoint
	#('1,5' 1.5 '-1,5' -1.5 '0,0' 0.0 '3,14159' 3.14159 '1e3' 1000.0 '1e-2' 0.01)
		pairsDo: [ :string :float | 
			self assert: (((NeoNumberParser on: string) radixPoint: $,; next) closeTo: float) ]