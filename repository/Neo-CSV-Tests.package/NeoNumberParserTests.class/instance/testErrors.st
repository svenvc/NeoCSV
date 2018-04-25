testing
testErrors
	self should: [ NeoNumberParser parse: nil ] raise: Error.
	self should: [ NeoNumberParser parse: '' ] raise: Error.
	self should: [ NeoNumberParser parse: '.5' ] raise: Error.
	
	self should: [ NeoNumberParser parse: '-' ] raise: Error.
	self should: [ NeoNumberParser parse: '+' ] raise: Error.
	self should: [ NeoNumberParser parse: 'x' ] raise: Error.
	
	self should: [ NeoNumberParser parse: '-a' ] raise: Error.
	self should: [ NeoNumberParser parse: '_' ] raise: Error.