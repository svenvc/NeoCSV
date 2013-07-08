testing
testErrors
	self should: [ NeoNumberParser parse: nil ] raise: Error.
	self should: [ NeoNumberParser parse: '' ] raise: Error.
	self should: [ NeoNumberParser parse: '.5' ] raise: Error.