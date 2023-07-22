load "stzlib.ring"

#=========== TODO: Review string comparaision logic in stzString
/*
pron()

? Q("sam") < "samira"
#--> TRUE

? Q("samira") > "ira"
#--> TRUE

? Q("qam") = "sam"
#--> FALSE

? Q("QAM") = "qam"
#--> FALSE

proff()
# Executed in 0.06 second(s)

/*==== Using a Python code inside Ring ===

pron()

# Reversing a list, the Python-way:

? Q(1:5)['::-1']
#--> [5, 4, 3, 1]

proff()

/*--------------

# We asked Bard AI about a python code that performs the
# Google Diff Algortithm (comparing two strings and
# showing their differences)...

# Here is the code proposed by Bard:
'
	def diff(old_string, new_string):
	  """Returns a list of diffs between two strings."""
	  diffs = []
	  i = 0
	  j = 0
	  while i < len(old_string) and j < len(new_string):
	    if old_string[i] == new_string[j]:
	      diffs.append("=")
	      i += 1
	      j += 1
	    elif old_string[i] < new_string[j]:
	      diffs.append("<")
	      i += 1
	    else:
	      diffs.append(">")
	      j += 1
	  return diffs

	def main():
	  old_string = "This is the old string."
	  new_string = "This is the new string."
	  diffs = diff(old_string, new_string)
	  print(diffs)

'
# When executed in Python, the code output is:
#--> [
# 	'=', '=', '=', '=', '=', '=', '=', '=', '=', '=', '=', '=',
#	'>', '>',
#	'<', '<', '<', '<', '<', '<', '<', '<', '<', '<'
# ]

# Using Softanza External Code facility, we can run quiet the same Python code in Ring:

pron()

def main()':' 
	old_string = "This is the old string."
	new_string = "This is the new string."

	diffs = diff(old_string, new_string)
	print( @@(diffs) )

	#--> [
	#	"=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=",
	#	">", ">", ">", ">", ">", ">", ">", ">", ">", ">"
	# ]
	#--> TODO: Check the difference in output between Python and Ring+Softanza
	#--> See the difference in meaning attributed by each language to
	#    string cmparaison operators =, < and >

proff()
#Executed in 0.08 second(s)

def diff(old_string, new_string)':' # Here we put : between quotes
	"""Returns a list of diffs between two strings."""

	diffs = []
	i = 1 # Here we changed 0 by 1
	j = 1 # Idem

  	while i < len(old_string) and j < len(new_string)':' # Idem

    		if old_string[i] = new_string[j]
      			diffs = Q(diffs).appendedWith("=") # Here we changed the semantics
     			i += 1
     			j += 1
 
    		but Q(old_string[i]) < new_string[j] # Here we used Q()
      			diffs = Q(diffs).appendedWith("<") # Idem
      			i += 1

   		else':' # Idem
     			diffs = Q(diffs).appendedWith(">") # Idem
     			 j += 1
		ok
	end

 	return diffs

/*-----------

# range() is used for Pyhton-code compatibility

pron()

	? range(3)
	#--> [ 0, 1, 2 ]
	
	? range([-3, 3+1, 2])
	#--> [ -3, -1, 1, 3 ]
	
proff()
# Executed in 0.03 second(s)

/*------------

pron()

bestlang = "Ring"

print( f("My best language is {bestlang}!") )
#--> My best language is Ring!

proff()
# Executed in 0.08 second(s)

/*------------
*/

# Now we rely on CharGPT AIT to generate a Google Diff Algorithm for us in Pytho,...
# Seems more interesting, and complex, than its Bard alternattive!
'
	class DiffAlgorithm:
	    def __init__(self, string1, string2):
	        self.string1 = string1
	        self.string2 = string2
	        self.n = len(string1)
	        self.m = len(string2)
	        self.max_length = self.n + self.m
	        self.v = [0] * (2 * self.max_length)
	
	    def diff(self):
	        for d in range(self.max_length):
	            for k in range(-d, d + 1, 2):
	                if k == -d or (k != d and self.v[k - 1] < self.v[k + 1]):
	                    x = self.v[k + 1]
	                else:
	                    x = self.v[k - 1] + 1
	                y = x - k
	                k, x, y = self.snake(k, x, y)
	                self.v[k] = x
	                if x >= self.n and y >= self.m:
	                    return self.construct_diff(self.v)
	
	        return None  # No diff found
	
	    def snake(self, k, x, y):
	        while x < self.n and y < self.m and self.string1[x] == self.string2[y]:
	            x += 1
	            y += 1
	            k += 1
	        return k, x, y
	
	    def construct_diff(self, v):
	        diff = []
	        x = self.n
	        y = self.m
	
	        while x > 0 or y > 0:
	            if x > 0 and y > 0 and self.string1[x - 1] == self.string2[y - 1]:
	                diff.append(('=', self.string1[x - 1]))
	                x -= 1
	                y -= 1
	            elif y > 0 and (x == 0 or v[x - 1] < v[x + 1]):
	                diff.append(('+', self.string2[y - 1]))
	                y -= 1
	            else:
	                diff.append(('-', self.string1[x - 1]))
	                x -= 1
	
	        return diff[::-1]
	
	# Example usage:
	string1 = "Hello, world!"
	string2 = "Hello, beautiful world!"
	
	diff_algo = DiffAlgorithm(string1, string2)
	differences = diff_algo.diff()
	
	for change, char in differences:
	    if change == '=':
	        print(f"Unchanged: {char}")
	    elif change == '+':
	        print(f"Added: {char}")
	    elif change == '-':
	        print(f"Deleted: {char}")
'
# End of the Python code

# Here is the transcripting of this Pyhton code in Ring:

string1 = "Hello, world!"
string2 = "Hello, beautiful world!"

oDiff = new DiffAlgorithm(string1, string2)
/*
oDiff {
	? n
	? m
	? max_length
	? @@(v)

	? snake(5, 2, 10)
}
*/
differences = oDiff.diff()
/*
? @@(difference.diff())


ForEach( [ :change, :char ], :in = differences) { X('

	if v(:change) = "="
        	print( f("Unchanged: {char}") )

    	but v(:change) = "+"
        	print( f("Added: {char}") )

    	but v(:change) = "-"
        	print( f("Deleted: {char}") )
	ok

')}
*/
#                   v
class DiffAlgorithm':' # <1>

    # v
    # Adding the needed attributes
    string1
    string2
    n
    m
    max_length
    v

    # the self keyword is not needed

    #    v                     v
    def init(string1, string2)':'
        string1 = string1
        string2 = string2
        n = len(string1)
        m = len(string2)
        max_length = n + m
	#   v
        v = Q([0]) * (2 * max_length)

    #              v
    def diff()':'
	#                          v
        for d in range(max_length)':'
	    #              v               v
            for k in range([-d, d + 1, 2])':'
		#    v                            v             v   v
                if k = -d or (k != d and v[k - 1 +1] < v[k + 1 +1])':'
		    #            v
                    x = v[k + 1 +1]
		#    v
                else':'
		    #            v
                    x = v[k - 1 +1] + 1
		# v
		ok

                y = x - k
		# vvvvvvvvvvvvvvvv  v  v
                Vr([ :k, :x, :y ]) '=' Vl( snake(k, x, y) )
		#  vvv       v
                v[ v(:k) ] = v(:x)
		#  v              v
                if v(:x) >= n and v(:y) >= m':'
		    #      v
                    return this.construct_diff(v)
		# v
		ok
            # v
            next k
	# v
        next d

        return None  # No diff found

    #                  v
    def snake(k, x, y)':'
	#                                   v  v           v  v
        while x < n and y < m and string1[x+1] = string2[y+1]':'
            x += 1
            y += 1
            k += 1
	# v
	end

	#      v
        return [k, x, y]

    #                     v
    def construct_diff(v)':'
	#      v
        diff = Q([])
        x = n
        y = m

	#                   v
        while x > 0 or y > 0':'
	    #                                     v  v                v  v
            if x > 0 and y > 0 and string1[x - 1 +1] = string2[y - 1 +1]':'
		#           v                         v
                diff.append(['=', self.string1[x - 1 +1]])
                x -= 1
                y -= 1
	    # v              v               v             v   v
            but y > 0 and (x = 0 or v[x - 1 +1] < v[x + 1 +1])':'
		#           v                         v
                diff.append(['+', self.string2[y - 1 +1]])
                y -= 1
	    #    v
            else':'
		#           v                         v
                diff.append(['-', self.string1[x - 1 +1]])
                x -= 1
	   # v
	   ok
        # v
        end

	#           v
        return diff['::-1'] # Reversed list


/*----------------

pron()

# In Softanza, you can define many variables and affect
# values to them in one line like this:

V([ :x = 10, :y = 20, :z = 30 ])

# Then, you can get the values by calling the variables
# using their names like this:

? v(:x) #--> 10
? v(:y)	#--> 20
? v(:z) #--> 30

? ""

# Or you can compose them in a list and print them like this:

? v([ :x, :y, :z ])
#--> [ 10, 20, 30 ]

proff()
# Executed in 0.05 second(s)

/*----------------

pron()

# In Python, we can assign multiple values to many variables:
'
	x, y, z = 10, 20, 30

	print(x)
	print(y)
	print(z)
'

# In Ring, with Softanza, we can say it this way:

	Vr([ :x, :y, :z ]) '=' Vl([ 10, 20, 30 ])

# And then you can call their values like this:

	print( v(:x) )	#--> 10
	print( v(:y) )	#--> 20
	print( v(:z) )	#--> 30



proff()


/*--------------

# I asked Bard (Google AI) about a code in Python that returns the
# uppercase strings from a given list of strings...

# Bard generated this code wich seems great!

'
	def uppercase_strings(list_of_strings):
		uppercase_strings = []
		
		for string in list_of_strings:
	    		if string.isupper():
	      			uppercase_positions.append(index)

	 	return uppercase_strings
	
	print( uppercase_strings([ "HELLO", "world", "this is", "RING!" ]) )
	#--> { "HELLO", "RING!" ]
	
'

# In Ring, I pasted the same code, organized it the Ring way (functions go at
# the end), and slightly change just one line of code. And then I run it, and
# it works!

	print( uppercase_strings([ "HELLO", "world", "this is", "RING!" ]) )
	#--> { "HELLO", "RING!" ]

	# Here is the function code

	def uppercase_strings(list_of_strings)
		uppercase_strings = []
	
		for str in list_of_strings

			if Q(str).isupper() # str is elevated to a stzString object using Q()
				uppercase_strings = Q(uppercase_strings).appendedWith(str)
				# This line was slightly tweakened, to keep things logical and expressive
			ok
		end
	
		return uppercase_strings

	# All the rest is keot unchanged.

/*==== Using a PHP code inside Ring  #===
	
# This code snippet is written in PHP. It calculates the min
# and max of two lists of numbers:
"
	echo(min(0, 150, 30, 20, -8, -200));  #--> -200
	echo(max(0, 150, 30, 20, -8, -200));  #--> 150
"

# Nearly the same code can be written in Ring thanks to the
# Min(), Max() and echo() functions of SoftanzaLib:

StartProfiler()

	echo( Min([0, 150, 30, 20, -8, -200]) );   #--> -200
	echo( Max([0, 150, 30, 20, -8, -200]) );   #--> 150

	# Note that the only difference is to put the numbers in a list
	# by bounding them by [ and ], inside the min() and max() functions

StopProfiler()
# Executed in 0.04 second(s)

/*==== Using a C# code inside Ring  #===

StartProfiler()

	# This is a C# code showing string interpolation:
	'
	int max = int.MaxValue;
	int min = int.MinValue;
	Console.WriteLine($"The range of integers is {min} to {max}");
	'

# And here is the same code translated to Ring:

	int max = int.MaxValue;
	int min = int.MinValue;
	Console.WriteLine( $("The range of integers is {min} to {max}") );
	#--> The range of integers is '-999_999_999_999_999' to '999_999_999_999_999'

	# Note that the only change made to the original C# code is to bound the string with ()
	
StopProfiler()
# Executed in 0.10 second(s)

/*==== USING a JS code inside Ring  #===

# The following JS code translate some string to
# uppercase in a locale sensitive way:
# (you can paste/test it here: https://bit.ly/3WdzMdF)
	"
	console.log('tunis'.toUpperCase());
	//--> TUNIS
	console.log('Iİıi'.toLocaleUpperCase('TR'));
	//--> IİIİ
	console.log('ß'.toLocaleUpperCase('de'));
	//--> SS
	"
# You can write nearly the same code, with almost the
# same JS-style, in Ring, using Softanza:
StartProfiler()

	console.log( Q('tunis').toUpperCase() );
	#--> TUNIS
	
	console.log( Q('Iİıi').toLocaleUpperCase('TR') );
	#--> IİII
	
	console.log( Q('ß').toLocaleUppercase('de') );
	#--> SS

	# Note hat the only difference is to elevate the string to
	# stzString objects using Q()

StopProfiler()
# Executed in 0.05 second(s)
