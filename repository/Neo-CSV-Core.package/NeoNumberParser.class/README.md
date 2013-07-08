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