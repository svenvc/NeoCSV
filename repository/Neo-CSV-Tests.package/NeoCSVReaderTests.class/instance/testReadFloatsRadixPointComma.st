testing
testReadFloatsRadixPointComma
	| input output |
	input := (String lf join: #( '"x";"y";"z"' '10,0;20,123;-30,5' '10,0;20,123;-30,5' '10,0;20,123;-30,5' '')).
	output := (NeoCSVReader on: input readStream) 
		separator: $; ;
		skipHeader;
		addFloatFieldRadixPointComma;
		addFloatFieldRadixPointComma;
		addFloatFieldRadixPointComma;
		upToEnd.
	output do: [ :record |
		#(10.0 20.123 -30.5) with: record do: [ :x :y | 
			self assert: (x closeTo: y) ] ]