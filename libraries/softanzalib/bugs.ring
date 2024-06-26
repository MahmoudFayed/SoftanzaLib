load "stzlib.ring"

/*====
*/
pron()

o1 = new stzString( "MMMiAAiNN" )

? @@( o1.SplitAtCharsW( 'Q(This[@i]).IsLowercase()' ) )
#--> [ "MMM", "AA", "NN" ]
# Executed in 0.16 second(s)

? @@( o1.SplitAtCharsWXT( :Where = 'Q(@Char).IsLowercase()' ) )
#--> [ "MMM", "AA", "NN" ]
# Executed in 0.24 second(s)

proff()
# Executed in 0.34 second(s)

/*-----

pron()

o1 = new stzString( "MMMiAAiNN" )
? @@( o1.SplitAfterCharsWXT( :Where = 'Q(@Char).IsLowercase()' ) )
#--> [ "MMMi", "AAi", "NN" ]

proff()
# Executed in 0.23 second(s)

/*-----

pron()

o1 = new stzString( "MMMiAAiNN" )
? @@( o1.SplitBeforeCharsWXT( :where = 'Q(@Char).IsLowercase()' ) )
#--> [ "MMM", "iAA", "iNN" ]

proff()
# Executed in 0.27 second(s)

/*====

pron()

o1 = new stzString( "IIIiiiMMMmmmAAAee" )

# More expressive : you can use the QSubString keyword

	? @@( o1.PartsWXT('Q(@SubString).IsLowercase()'))
	#--> [ "iii", "mmm", "ee" ]
	# Takes 0.29 second(s)

# More performant : you use only This[@i]-like keywords

	? @@( o1.PartsW(' Q(This[@i]).IsLowercase() ') )
	# Takes 0.23 second(s)

proff()
# Executed in 0.53 second(s)

/*------

pron()

o1 = new stzString( "IIIiiiMMMmmmAAAee" )

# More expressive (takes 0.82 seconds)

	? @@( o1.PartsWXT('Q(@SubString).IsLowercase()') ) + NL
	#--> [ "iii", "mmm", "ee" ]
	
	? @@( o1.FindPartsWXT('Q(@SubString).IsLowercase()')) + NL
	#--> [ 4, 10, 16 ]
	
	? @@( o1.FindPartsWXTZZ('Q(@SubString).IsLowercase()')) + NL
	#--> [ [ 4, 6 ], [ 10, 12 ], [ 16, 17 ] ]

# More performant (takes 0.70 seconds)

	? @@( o1.PartsW('Q(This[@i]).IsLowercase()') ) + NL
	#--> [ "iii", "mmm", "ee" ]
	
	? @@( o1.FindPartsW('Q(This[@i]).IsLowercase()')) + NL
	#--> [ 4, 10, 16 ]
	
	? @@( o1.FindPartsWZZ('Q(This[@i]).IsLowercase()'))
	#--> [ [ 4, 6 ], [ 10, 12 ], [ 16, 17 ] ]

proff()
# Executed in 1.45 second(s)

/*------
*/
pron()

o1 = new stzString( "IIIiiiMMMmmmAAAee" )

# More expressive #NOTE the use of natural keyword ~> @SubString
# (takes 0.44 second)
# ~> requires transpiling of @SubString (and others like @NextSubString,
# @PreviousSubString, etc) in the background to This[@i] keyword

	? @@( o1.SplitAtSubStringsWXT( :where = 'Q(@SubString).IsLowercase()' ) ) + NL
	#--> [ "III", "MMM", "AAA" ]

# More performant (takes 0.38 second) #NOTE difference will be more relevant with large data
# You can use only This[@i] keyword to express the conditional expression

	? @@( o1.SplitAtSubStringsW( :where = 'Q(This[@i]).IsLowercase()' ) )
	#--> [ "III", "MMM", "AAA" ]

proff()
# Executed in 0.66 second(s)

/*------

o1 = new stzString( "ABCabcEFGijHI" )
? o1.SplitBeforeSubStringsWXT( 'Q(@SubString).IsLowercase()' )
#--> [ "ABC", "EFG", "HI" ]

proff()

/*-----


/*-----
*/

