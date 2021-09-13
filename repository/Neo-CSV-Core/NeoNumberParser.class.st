"
I am NeoNumberParser, an alternative number parser that needs only a minimal read stream protocol. 

I accept the following syntax:

	number
	  int
	  int frac
	  int exp
	  int frac exp
	int
	  digits
	  - digits
	frac
	  . digits
	exp
	  e digits
	digits
	  digit
	  digit digits
	e
	  e
	  e+
	  e-
	  E
	  E+
	  E-

where digit depends on the base (2 to 36), 0 .. 9, A-Z, a-z.
"
Class {
	#name : #NeoNumberParser,
	#superclass : #Object,
	#instVars : [
		'stream',
		'base',
		'radixPoint',
		'digitGroupSeparator'
	],
	#category : #'Neo-CSV-Core'
}

{ #category : #'instance creation' }
NeoNumberParser class >> on: stringOrStream [
	| stream |
	stream := stringOrStream isString
		ifTrue: [ stringOrStream readStream ]
		ifFalse: [ stringOrStream ].
	^ self new
		on: stream;
		yourself
]

{ #category : #queries }
NeoNumberParser class >> parse: stringOrStream [
	^ (self on: stringOrStream) next
]

{ #category : #queries }
NeoNumberParser class >> parse: stringOrStream base: base [
	^ (self on: stringOrStream)
		base: base;
		next
]

{ #category : #queries }
NeoNumberParser class >> parse: stringOrStream base: base ifFail: block [
	^ [ self parse: stringOrStream base: base ]
		on: Error
		do: block
]

{ #category : #queries }
NeoNumberParser class >> parse: stringOrStream ifFail: block [
	^ [ self parse: stringOrStream ]
		on: Error
		do: block
]

{ #category : #testing }
NeoNumberParser >> atEnd [
	^ stream atEnd
]

{ #category : #'initialize-release' }
NeoNumberParser >> base: integer [
	"Set the base of the numbers that I parse to integer.
	The default is 10"
	
	self assert: (integer between: 2 and: 36) description: 'Number base must be between 2 and 36'.
	base := integer
]

{ #category : #parsing }
NeoNumberParser >> consumeWhitespace [
	"Strip whitespaces from the input stream."

	[ stream atEnd not and: [ stream peek isSeparator ] ] 
		whileTrue: [ stream next ]

]

{ #category : #'initialize-release' }
NeoNumberParser >> digitGroupSeparator: separatorCharacter [
	"Set the digit group separator to separatorCharacter.
	The are skipped while parsing digit characters.
	The default is nil (nothing being skipped)"
	
	digitGroupSeparator := separatorCharacter 
]

{ #category : #parsing }
NeoNumberParser >> digitsDo: oneArgumentBlock [
	"Evaluate oneArgumentBlock with integer digit values from the input stream,
	while the stream is not at end and the digit value is within [0, base).
	Skip digit group separator characters."
	
	| character digitValue |
	[ (character := stream peek) notNil ]
		whileTrue: [ 
			character = digitGroupSeparator
				ifFalse: [ 
					((digitValue := character digitValue) >= 0 and: [ digitValue < base ])
						ifTrue: [ oneArgumentBlock value: digitValue ]
						ifFalse: [ ^ self ] ].
			stream next ]
]

{ #category : #parsing }
NeoNumberParser >> failIfNotAtEnd [
	self atEnd
		ifFalse: [ self error: 'extraneous input detected' ]
]

{ #category : #'initialize-release' }
NeoNumberParser >> initialize [
	super initialize.
	self base: 10.
	self radixPoint: $.
]

{ #category : #accessing }
NeoNumberParser >> next [
	^ self parseNumber
]

{ #category : #'initialize-release' }
NeoNumberParser >> on: readStream [
	stream := readStream 
]

{ #category : #parsing }
NeoNumberParser >> parseNumber [
	| negated number |
	negated := stream peekFor: $-.
	number := self parseNumberInteger.
	(stream peekFor: radixPoint)
		ifTrue: [ number := number + self parseNumberFraction ].
	((stream peekFor: $e) or: [ stream peekFor: $E ])
		ifTrue: [ number := number * self parseNumberExponent ].
	negated
		ifTrue: [ number := number negated ].
	^ number
]

{ #category : #parsing }
NeoNumberParser >> parseNumberExponent [
	| number negated |
	number := 0.
	(negated := stream peekFor: $-)
		ifFalse: [ stream peekFor: $+ ].
	self digitsDo: [ :x | 
		number := base * number + x ].
	negated
		ifTrue: [ number := number negated ].
	^ base raisedTo: number
]

{ #category : #parsing }
NeoNumberParser >> parseNumberFraction [
	| number power |
	number := 0.
	power := 1.0.
	self digitsDo: [ :x | 
		number := base * number + x.
		power := power * base ].
	^ number / power
]

{ #category : #parsing }
NeoNumberParser >> parseNumberInteger [
	| number found |
	number := 0.
	found := false.
	self digitsDo: [ :x | 
		found := true.
		number := base * number + x ].
	found 
		ifFalse: [ self error: 'Integer digit expected' ].
	^ number
]

{ #category : #'initialize-release' }
NeoNumberParser >> radixPoint: radixCharacter [
	"Set the radix of the numbers that I parse to radixCharacter.
	The default is $."
	
	radixPoint := radixCharacter 
]
