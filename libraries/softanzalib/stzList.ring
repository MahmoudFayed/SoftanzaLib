#---------------------------------------------------------------------------#
# 		   SOFTANZA LIBRARY (V1.0) - STZLIST			    #
#	An accelerative library for Ring applications, and more!	    #
#---------------------------------------------------------------------------#
#									    #
# 	Description	: The core class for managing lists in Softanza     #
#	Version		: V1.0 (2020-2023)				    #
#	Author		: Mansour Ayouni (kalidianow@gmail.com)		    #
#									    #
#---------------------------------------------------------------------------#

  /////////////////////
 ///   FUNCTIONS   ///
/////////////////////

func StzListQ(paList)
	return new stzList(paList)

func StzNamedList(paNamed)
	if CheckParams()
		if NOT (isList(paNamed) and Q(paNamed).IsPairOfStringAndList())
			StzRaise("Incorrect param type! paNamed must be a pair of string and list.")
		ok
	ok

	oList = new stzList(paNamed[2])
	oList.SetName(paNamed[1])
	return oList

	func StzNamedListQ(paNamed)
		return StzNamedList(paNamed)

	func StzNamedListXTQ(paNamed)
		return StzNamedList(paNamed)

func StzListMethods()
	return Stz(:List, :Methods)

func StzListAttributes()
	return Stz(:List, :Attributes)

func StzListClassName()
	return "stzlist"

	func StzListClass()
		return "stzlist"

func U(p)
	/* EXAMPLE

	? U([ "♥", 1, 2, 2, "♥", "♥", 3 ]) # Or Unique() or WithoutDuplicates()
	#--> [ "♥", 1, 2, 3 ]
	
	*/

	if CheckParams()
		if NOT isList(p)
			StzRaise("Incorrect param type!")
		ok
	ok

	result = StzListQ(p).WithoutDuplicates()
	return result

	func WithoutDuplicates(p)
		return U(p)

	func Unique(p)
		return U(p)

func L(p)

	if isList(p)
		return p

	but isString(p)

		if Q(p).IsListInString()
			return Q(p).ToList()

		but Q(p).ContainsNoSpaces()
			return Q(p).Chars()

		but Q(p).ContainsSpaces()
			return Q(p) / " "
		ok

	but isObject(p)
		return StzObject(p).ObjectAttributesAndValues()

	but isNumber(p)
		aResult = []
		for i = 1 to p
			aResult + NULL
		next

		return aResult

	else
		StzRaise("Incorrect param! Can't tranform param to list.")
	ok

	func LQ(p)
		return new stzList(L(p))

func ListIsListOfStzNumbers(paList)
	return StzListQ(paList).IsListOfStzNumbers()

func ListIsListOfStzStrings(paList)
	return StzListQ(paList).IsListOfStzStrings()

func ListIsListOfStzLists(paList)
	return StzListQ(paList).IsListOfStzLists()

func ListIsListOfStzObjects(paList)
	return StzListQ(paList).IsListOfStzObjects()

func ListReverse(paList)
	return reverse(paList) # Here we rely on the native Ring reverse() function

func ListFirstItem(paList)
	return paList[1]

	#< @AlternativeFunctionNames

	func FirstItemInList(paList)
		return ListFirstItem(paList)

	#>

func ListLastItem(paList)
	return paList[ len(paList) ]

	#< @AlternativeFunctionNames

	func LastItemInList(paList)
		return ListLastItem(paList)

	#>

func UpdateLastItem(paList, pValue)
	oTempList = new stzList(paList)
	return oTempList.UpdateLastItem(pValue)

func LastItemIn(paList)
	return paList( len(paList) )

func FirstListIn(paList)
	oTempList = new stzList(paList)
	return LastItemIn( oTempList.WalkUntilItemIsList() )

func GenerateListAccessCode_FromNameAndPath(pcListName, paPath)
	// Warining: aPath must contain only numbers!!!
	cCode = pcListName
	for n in paPath
		cCode += ("["+ n + ']')
	next

	return cCode
		
func ListIsSet(paList)
	oList = new stzList(paList)
	return oList.IsSet()

func ListIsListOfNumbers(paList)
	return StzListQ(paList).IsListOfNumbers()

func ListItemsAreAllStrings(paList)
	oTempList = new stzList(paList)
	return oTempList.ItemsAreAllStrings()

func ListIsHashList(paList)
	oTempList = new stzList(paList)
	return oTempList.IsHashList()

func ListIsListOfLists(paList)
	return StzListQ(paList).IsListOfLists()

func ListIsListOfSets(paList)
	return StzListQ(paList).IsListOfSets()

func ListIsListOfLetters(paList)
	return StzListQ(paList).IsListOfLetters()

func ListIsListOfHashLists(paList)
	return StzListQ(paList).IsListOfHashLists()

func ListIsListOfZerosAndOnes(paList)
	return StzListQ(paList).IsListOfZerosAndOnes()

func ListIsLocaleList(paList)
	return StzListQ(paList).IsLocaleList()

func ListUnicodes(paList)
	return StzListQ(paList).Unicodes()

func CallMethod( pcMethod, paOnObjects )

	if NOT ( paOnObjects[1] = "on" and StzListQ(paOnObjects[2]).IsListOfStrings() )
		StzRaise(stzObjectError(:CanNotProcessMethodCall))
	ok

	aResult = []
	for cObjName in paOnObjects[2]
		cCode = "aResult + " + cObjName + "." + pcMethod
		eval(cCode)
	next
	return aResult

func AreChars(paChars)
	bResult = TRUE
	for c in paChars
		if NOT ( isString(c) and StringIsChar(c) )
			bResult = FALSE
			exit
		ok
	next
	return bResult

func AreBothChars(p1, p2)
	return AreChars([ p1, p2 ])

	func BothAreChars(p1, p2)
		return AreBothChars(p1, p2)
	
func AreBothAsciiChars(p1, p2)
	if IsAsciiChar(p1) and IsAsciiChar(p2)
		return TRUE
	else
		return FALSE
	ok

	func BothAreAsciiChars(p1, p2)
		return AreBothAsciiChars(p1, p2)

func AreBothEqual(p1, p2)
	return AreEqual([ p1, p2 ])

	func BothAreEqual(p1, p2)
		return AreEqual([ p1, p2 ])
	
		def BothAreNotEqual(p1, p2)
			return NOT BothAreEqual(p1, p2)

func AreEqual(paItems)
	return StzListQ(paItems).NumberOfOccurrence(paItems[1]) = len(paItems)

func HaveSameType(paItems)
	bResult = TRUE
	for i = 2 to len(paItems)
		if ring_type( paItems[i] ) != ring_type( paItems[i] )
			bResult = FALSE
			exit
		ok
	next
	return bResult

func BothHaveSameType(p1, p2)
	return ring_type(p1) = ring_type(p2)

func HaveSameContent(paItems)
	/* Two items have same content when:
	 if they are stringified they are equal strings.

	Stringifying number 12 generate string "12"
	*/
	if NOT isList(paItems)
		StzRaise("Incorrect param type! paItems must be a list.")
	ok

	if len(paItems) = 1
		return TRUE
	ok

	bResult = TRUE
	for i = 2 to len(paItems)
		bOk = Q( @@( paItems[i] ) ).IsEqualTo( @@( paItems[1] ) )
		if NOT bOk
			bResult = FALSE
			exit
		ok
	next
	return bResult

func HaveBothSameType(p1, p2)
	return ring_type(p1) = ring_type(p2)

func IsEmptyList(paList)
	return StzListQ(paList).IsEmpty()
		
	def IsAnEmptyList(paList)

func ListShow(paList)
	StzListQ(paList).Show()

func AreNumbers(paList)
	return StzListQ(paList).ContainsOnlyNumbers()

	def AllAreNumbers(paList)
		return AreNumbers(paList)

	def AreAllNumbers(paList)
		return AreNumbers(paList)

	def TheseAreNumbers(paList)
		return AreNumbers(paList)

	def AllTheseAreNumbers(paList)
		return AreNumbers(paList)

func AreStrings(paList)
	return StzListQ(paList).ContainsOnlyStrings()

	def AllAreStrings(paList)
		return AreStrings(paList)

	def AreAllStrings(paList)
		return AreStrings(paList)

	def TheseAreStrings(paList)
		return AreStrings(paList)

	def AllTheseAreStrings(paList)
		return AreStrings(paList)

func AreLists(paList)
	return StzListQ(paList).ContainsOnlyLists()

	def AllAreLists(paList)
		return AreLists(paList)

	def AreAllLists(paList)
		return AreLists(paList)

	def TheseAreLists(paList)
		return AreLists(paList)

func AreObjects(paList)
	return StzListQ(paList).ContainsOnlyObjects()

	def AllAreObjects(paList)
		return AreObjects(paList)

	def AreAllObjects(paList)
		return AreObjects(paList)

	def TheseAreObjects(paList)
		return AreObjects(paList)

func ListIsListOfStrings(paList)
	return StzListQ(paList).IsListOfStrings()

	func IsListOfStrings(paList)
		return ListIsListOfStrings(paList)


func IsRangeNamedParamList(paList)
	return StzListQ(paList).IsRangeNamedParam()

	func ListIsRangeNamedParamList(paList)
		return This.IsRangeNamedParamList(paList)

func ListToCode(paList)
	return StzListQ(paList).ToCode()


func AllTheseAreNull(paList)
	return StzListQ(paList).AllItemsAreNull()

	func AllOfTheseAreNull(paList)
		return AllTheseAreNull(paList)

	func TheseAreNull(paList)
		return AllTheseAreNull(paList)

func AllOfTheseAreNotNull(paList)
	bResult = TRUE
	for item in paList
		if isString(item) and isNull(item)
			bResult = FALSE
			exit
		ok
	next

	return bResult

	func NoOneOfTheseIsNull(paList)
		return AllOfTheseAreNotNull(paList)

	func TheseAreNotNull(paList)
		return AllOfTheseAreNotNull(paList)

func BothAreNull(p1, p2)
	return TheseAreNull([ p1, p2 ])

func BothAreNotNull(p1, p2)
	return TheseAreNotNull([ p1, p2 ])

func NoOneOfTheseIsAString(paList)
	bResult = TRUE
	for item in paList
		if isString(item)
			bResult = FALSE
			exit
		ok
	next
	
	return bResult


func List@(paList)
	if isList(paList)
		return ComputableForm(paList)
	ok

func ListFindAll(paList, p)
	return StzListQ(paList).FindAll(p)

func ListOfNTimes(n, pItem)
	aResult = []
	for i = 1 to n
		aResult + pItem
	next
	return aResult

func NumberOfCharsBetweenIB(p1, p2)

	# Checking params

	if isList(p2) and Q(p2).IsAndNamedParam()
		p2 = p2[2]
	ok

	if BothAreChars(p1, p2)
		p1 = Unicode(p1)
		p2 = Unicode(p2)
	ok

	if NOT BothAreNumbers(p1, p2)
		StzRaise("Incorrect params! p1 and p2 must corrspond to valid Unicode numbers.")
	ok

	aSorted = Q([ p1, p2 ]).Sorted()
	n1 = aSorted[1]
	n2 = aSorted[2]

	if (n1 <= 0 or n2 <= 0) or
	   (n1 > NumberOfCharsInUnicode() or n2 > NumberOfCharsInUnicode())

		StzRaise("Incorrect params! p1 and p2 must correspond to valid chars in the unicode database.")
	ok

	# Doing the job

	nResult = n2 - n1 + 1
	return nResult

func CharsBetweenIB(p1, p2)

	# Checking params

	if isList(p2) and Q(p2).IsAndNamedParam()
		p2 = p2[2]
	ok

	if BothAreChars(p1, p2)
		p1 = Unicode(p1)
		p2 = Unicode(p2)
	ok

	if NOT BothAreNumbers(p1, p2)
		StzRaise("Incorrect params! p1 and p2 must corrspond to valid Unicode numbers.")
	ok

	aSorted = Q([ p1, p2 ]).Sorted()
	n1 = aSorted[1]
	n2 = aSorted[2]

	if (n1 <= 0 or n2 <= 0) or
	   (n1 > NumberOfCharsInUnicode() or n2 > NumberOfCharsInUnicode())

		StzRaise("Incorrect params! p1 and p2 must correspond to valid chars in the unicode database.")
	ok

	# Doing the job

	aResult = []
	for i = n1 to n2
		aResult + StzCharQ(i).Content()
	next

	return aResult

	func CharsBetweenB(p1, p2) # ...B() extension --> Bounds included in the result
		return CharsBetweenIB(p1, p2)

func NumberOfCharsBetween(p1, p2)
	return NumberOfCharsBetweenIB(p1, p2) - 2 # Bounds included

func CharsBetween(p1, p2)

	# Checking params

	if isList(p2) and Q(p2).IsAndNamedParam()
		p2 = p2[2]
	ok

	if NOT ( BothAreNumbers(p1, p2) or BothAreChars(p1, p2) )
		StzRaise("Error!")
	ok

	if BothAreChars(p1, p2)
		p1 = Unicode(p1)
		p2 = Unicode(p2)
	ok

	aSorted = Q([ p1, p2 ]).Sorted()
	n1 = aSorted[1]
	n2 = aSorted[2]

	if (n1 <= 0 or n2 <= 0) or
	   (n1 > NumberOfCharsInUnicode() or n2 > NumberOfCharsInUnicode())

		StzRaise("Incorrect params! p1 and p2 must correspond to valid chars in the unicode database.")
	ok

	# Doing the job

	if n1 = n2 + 1
		return []

	else
		aResult = []
		for i = n1 + 1 to n2 - 1
			aResult + StzCharQ(i).Content()
		next
	
		return aResult
	ok

func ContiguousListOfChars(cChar1, cChar2)
	aResult = []
	for i = CharUnicode(cChar1) to CharUnicode(cChar2)
		aResult + StzCharQ(i).Content()
	next

	return aResult

	func ContiguousList(cChar1, cChar2)
		return ContinuousListOfChars(cChar1, cChar2)

	func ContinuousListOfChars(cChar1, cChar2)
		return ContiguousListOfChars(cChar1, cChar2)

	func ContinuousList(cChar1, cChar2)
		return ContiguousList(cChar1, cChar2)

	func Contig(cChar1, cChar2)
		return ContiguousList(cChar1, cChar2)

	func ContigList(cChar1, cChar2)
		return ContiguousList(cChar1, cChar2)

	func CL(cChar1, cChar2)
		return ContiguousList(cChar1, cChar2)


func ListXT(p)

	if isList(p)
		return p

	but isString(p) and StzStringQ(p).IsListInShortForm()
		aResult = StzStringQ(p).ToList()
		return aResult

	else
		StzRaise("Can't process the param you provided! It must be a list or a list in string.")
	ok

func List(pFrom, pTo)
	/* EXAMPLE

	? ListXT( :From = "A", :To = "D" )
	#--> [ "A", "B", "C", "D" ]

	*/

	if isList(pFrom) and Q(pFrom).IsFromNamedParam()
		pFrom = pFrom[2]
	ok

	if isList(pTo) and Q(pTo).IsToNamedParam()
		pTo = pto[2]
	ok

	if NOT BothAreChars(pFrom, pTo)
		StzRaise("Incorrect params! Bonth pFrom and pTo must be chars.")
	ok

	return ContiguousList(pFrom, pto)

  /////////////////
 ///   CLASS   ///
/////////////////

class stzList from stzObject
	@aContent = []

	@aWalkers = []

	  #--------------#
	 #     INIT     #
	#--------------#

	def init(paList)
		if isList(paList)
			@aContent = paList

		else
			StzRaise("Can't create the stzList object!")
		ok

	  #---------------------#
	 #     CONSTRAINTS     #
	#---------------------#
	// TODO: Finish stzConstraint --> Finsh Constraints section here and
	// in other classes (StzString...)
/*
	def MustBe(pcIsMethod)


	def CanNotBe(pcIsMethod)
*/

	  #-----------------#
	 #     GENERAL     #
	#-----------------#

	def Content()
		return @aContent

		def Value()
			return Content()

	def List()
		return Content()

		def ListQ() # Same as Copy()
			return new stzList( This.List() )

	def Copy()
		return new stzList( This.List() )

	def ReversedCopy()
		return This.ReverseQ()

	def NumberOfItems()
		return len(This.Content())

		def NumberOfItemsQ()
			return new stzNumber(This.NumberOfItems())

		def Size()
			return This.NumberOfItems()

		def Length()
			return This.NumberOfItems()

		def CountItems()
			return This.NumberOfItems()

		def HowManyItems()
			return This.NumberOfItems()
	
		def HowManyItem()
			return This.NumberOfItems()

	def Items()
		return This.Content()

		#< @FunctionFluentForm

		def ItemsQ()
			return This

		#>

	def Item(n)
		if CheckParams()
			if isString(n)
				if n = "first"
					n = 1
	
				but n = "last"
					n = This.NumberOfItems()
	
				ok
			ok
	
			if NOT isNumber(n)
				StzRaise("Incorrect param type! n should be a number.")
			ok
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		if n < 0
			n = nLen + n + 1
		ok

		return This.Content()[n]

		def ItemQ(n)
			return Q(This.Item(n))

		#< @AlternativeFunctionNames

		def NthItem(n)
			return This.Item(n)

			def NthItemQ(n)
				return Q(This.NthItem(n))

		def ItemAtPosition(n)
			return This.Item(n)

		def ItemAt(n)
			return This.Item(n)

		#>

	def FirstItem()
		return This.NthItem(1)

		def FirstItemQ()
			return Q(This.FirstItem())

	def LastItem()
		return This.NthItem( This.NumberOfItems() )

		def LastItemQ()
			return Q(This.LastItem())

	def FirstAndLastItems()
		aResult = [ This.FirstItem(), This.LastItem() ]
		return aResult

	def LastAndFirstItems()
		aResult = [ This.LastItem(), FirstItem() ]
		return aResult

	def CentralPosition()
		oTemp = new stzNumber( (This.NumberOfItems()/2) )
		n = oTemp.IntegerPartValue()
		return n

		def CentralItemPosition()
			return This.CentralPosition()

	def CentralItem()
		return This[CentralPosition()]

		def CentralItemQ()
			return Q(This.CentralItem())

	def HasCentralItem()
		return This.NumberOfItemsQ().IsNotEven()

		def ContainsCentralItem()
			return This.HasCentralItem()

	  #-------------------------------------#
	 #  GETTING THE LIST OF N FIRST ITEMS  #
	#-------------------------------------#

	def NFirstItems(n)
		aContent = This.Content()
		aResult = []

		for i = 1 to n
			aResult + aContent[i]
		next

		return aResult
		
		#< @FunctionFluentForms

		def NFirstItemsQ(n)
			return NFirstItemsQR(n, :stzList)

		def NFirstItemsQR(n, pcReturnType)
			if isList(pcReturnType) and
			   Q(pcReturnType).IsReturnedAsNamedParam()

				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.NFirstItems(n) )

			on :stzListOfStrings
				return new stzListOfStrings( This.NFirstItems(n) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.NFirstItems(n) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForm

		def FirstNItems(n)
			return This.NFirstItems(n)

			def FirstNItemsQ(n)
				return This.NFirstItemsQ(n)

			def FirstNItemsQR(n, pcReturnType)
				return This.NFirstItemsQR(n, pcReturnType)

		#>

		#< @FunctionSpecieficForms

		def First2Items()
			return This.FirstNItems(2)
	
			def 2FirstItems()
				return This.First2Items()
	
			def FirstTwoItems()
				return This.First2Items()
	
			def TwoFirstItems()
				return This.First2Items()
	
		def First3Items()
			return This.FirstNItems(3)
	
			def 3FirstItems()
				return This.First3Items()
	
			def FirstThreeItems()
				return This.First2Items()
	
			def ThreeFirstItems()
				return This.First3Items()
	
		def First4Items()
			return This.FirstNItems(4)
	
			def 4FirstItems()
				return This.First4Items()
	
			def FirstFourItems()
				return This.First4Items()
	
			def FourFirstItems()
				return This.First4Items()
	
		def First5Items()
			return This.FirstNItems(5)
	
			def 5FirstItems()
				return This.First5Items()
	
			def FirstFiveItems()
				return This.First5Items()
	
			def FiveFirstItems()
				return This.First5Items()
	
		def First6Items()
			return This.FirstNItems(6)
	
			def 6FirstItems()
				return This.First6Items()
	
			def FirstSixItems()
				return This.First6Items()
	
			def SixFirstItems()
				return This.First6Items()
	
		def First7Items()
			return This.FirstNItems(7)
	
			def 7FirstItems()
				return This.First7Items()
	
			def FirstSevenItems()
				return This.First7Items()
	
			def SevenFirstItems()
				return This.First7Items()
	
		def First8Items()
			return This.FirstNItems(8)
	
			def 8FirstItems()
				return This.First8Items()
	
			def FirstEightItems()
				return This.First8Items()
	
			def EightFirstItems()
				return This.First8Items()
	
		def First9Items()
			return This.FirstNItems(9)
	
			def 9FirstItems()
				return This.First9Items()
	
			def FirstNineItems()
				return This.First9Items()
	
			def NineFirstItems()
				return This.First9Items()
	
		def First10Items()
			return This.FirstNItems(10)
	
			def 10FirstItems()
				return This.First10Items()
	
			def FirstTenItems()
				return This.First10Items()
	
			def TenFirstItems()
			return This.First10Items()

		#>

	  #------------------------------------#
	 #  GETTING THE LIST OF N LAST ITEMS  #
	#------------------------------------#

	def NLastItems(n)
		aContent = This.Content()
		nLen = len(aContent)
		n1 = nLen - n + 1
		n2 = nLen

		aResult = []

		for i = n1 to n2
			aResult + aContent[i]
		next

		return aResult

		#< @FunctionFluentForms

		def NLastItemsQ(n)
			return NLastItemsQR(n, :stzList)

		def NLastItemsQR(n, pcReturnType)
			if isList(pcReturnType) and
			   Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.NLastItems(n) )

			on :stzListOfStrings
				return new stzListOfStrings( This.NLastItems(n) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.NLastItems(n) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForm

		def LastNItems(n)
			return This.NLastItems(n)

			def LastNItemsQ(n)
				return This.NLastItemsQ(n)

			def LastNItemsQR(n, pcReturnType)
				return This.NLastItemsQR(n, pcReturnType)

		#>

		#< @FunctionSpecieficForms

		def Last2Items()
			return This.LastNItems(2)
	
			def 2LastItems()
				return This.Last2Items()
	
			def LastTwoItems()
				return This.Last2Items()
	
			def TwoLastItems()
				return This.Last2Items()
	
		def Last3Items()
			return This.LastNItems(3)
	
			def 3LastItems()
				return This.Last3Items()
	
			def LastThreeItems()
				return This.Last2Items()
	
			def ThreeLastItems()
				return This.Last3Items()
	
		def Last4Items()
			return This.LastNItems(4)
	
			def 4LastItems()
				return This.Last4Items()
	
			def LastFourItems()
				return This.Last4Items()
	
			def FourLastItems()
				return This.Last4Items()
	
		def Last5Items()
			return This.LastNItems(5)
	
			def 5LastItems()
				return This.Last5Items()
	
			def LastFiveItems()
				return This.Last5Items()
	
			def FiveLastItems()
				return This.Last5Items()
	
		def Last6Items()
			return This.LastNItems(6)
	
			def 6LastItems()
				return This.Last6Items()
	
			def LastSixItems()
				return This.Last6Items()
	
			def SixLastItems()
				return This.Last6Items()
	
		def Last7Items()
			return This.LastNItems(7)
	
			def 7LastItems()
				return This.Last7Items()
	
			def LastSevenItems()
				return This.Last7Items()
	
			def SevenLastItems()
				return This.Last7Items()
	
		def Last8Items()
			return This.LastNItems(8)
	
			def 8LastItems()
				return This.Last8Items()
	
			def LastEightItems()
				return This.Last8Items()
	
			def EightLastItems()
				return This.Last8Items()
	
		def Last9Items()
			return This.LastNItems(9)
	
			def 9LastItems()
				return This.Last9Items()
	
			def LastNineItems()
				return This.Last9Items()
	
			def NineLastItems()
				return This.Last9Items()
	
		def Last10Items()
			return This.LastNItems(10)
	
			def 10LastItems()
				return This.Last10Items()
	
			def LastTenItems()
				return This.Last10Items()
	
			def TenLastItems()
				return This.Last10Items()
	
		#>

	  #---------------------------------------------#
	 #  NEXT N ITEMS STARTING AT A GIVEN POSITION  #
	#=============================================#

	def NextNItems(n, pnStartingAt)

		# Checking params

		if NOT isNumber(n)
			StzRaise("Incorrect param type! n must be a number.")
		ok

		if isList(pnStartingAt) and Q(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if pnStartingAt = :First or pnStartingAt = :FirstItem
				pnStartingAt = 1

			but pnStartingAt = :Last or pnStartingAt = :LastItem
				pnStartingAt = This.NumberOfItems()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			StzRaise("Incorrect param type! pnStartingAt must be a number.")
		ok

		if pnStartingAt < 0
			pnStartingAt = This.NumberOfItems() - Abs(pnStartingAt) + 1
		ok

		# Doing the job

		acResult = This.SectionQ(pnStartingAt, pnStartingAt + n - 1).Items()

		return acResult

		#< @FunctionFluentForm

		def NextNItemsQ(n, pnStartingAt)
			return This.NextNItemsQR(n, pnStartingAt, :stzList)

		def NextNItemsQR(n, pnStartingAt, pcReturnType)
			switch pcReturnType
			on :stzList
				return new stzList( This.NextNItems(n, pnStartingAt) )

			on :stzListOfStrings
				return new stzListOfStrings( This.NextNItems(n, pnStartingAt) )

			on :stzListOfChars
				return new stzListOfChars( This.NextNItems(n, pnStartingAt) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.NextNItems(n, pnStartingAt) )

			on :stzListOfLists
				return new stzListOfLists( This.NextNItems(n, pnStartingAt) )

			on :stzListOfPairs
				return new stzListOfPairs( This.NextNItems(n, pnStartingAt) )

			on :stzListOfObjects
				return new stzListOfObjects( This.NextNItems(n, pnStartingAt) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

	  #-------------------------------------------------#
	 #  PREVIOUS N CHARS STARTING AT A GIVEN POSITION  #
	#-------------------------------------------------#

	def PreviousNItems(n, pnStartingAt)

		# Checking params

		if NOT isNumber(n)
			StzRaise("Incorrect param type! n must be a number.")
		ok

		if isList(pnStartingAt) and Q(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if pnStartingAt = :First or pnStartingAt = :FirstItem
				pnStartingAt = 1

			but pnStartingAt = :Last or pnStartingAt = :LastItem
				pnStartingAt = This.NumberOfItems()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			StzRaise("Incorrect param type! pnStartingAt must be a number.")
		ok

		if pnStartingAt < 0
			pnStartingAt = This.NumberOfItems() - Abs(pnStartingAt) + 1
		ok

		# Doing the job

		acResult = This.SectionQ(pnStartingAt - n + 1, pnStartingAt).Items()

		return acResult


		#< @FunctionFluentForm

		def PreviousNItemsQ(n, pnStartingAt)
			return This.PreviousNItemsQR(n, pnStartingAt, :stzList)

		def PreviousNItemsQR(n, pnStartingAt, pcReturnType)
			switch pcReturnType
			on :stzList
				return new stzList( This.PreviousNItems(n, pnStartingAt) )

			on :stzListOfStrings
				return new stzListOfStrings( This.PreviousNItems(n, pnStartingAt) )

			on :stzListOfChars
				return new stzListOfChars( This.PreviousNItems(n, pnStartingAt) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.PreviousNItems(n, pnStartingAt) )

			on :stzListOfLists
				return new stzListOfLists( This.PreviousNItems(n, pnStartingAt) )

			on :stzListOfPairs
				return new stzListOfPairs( This.PreviousNItems(n, pnStartingAt) )

			on :stzListOfObjects
				return new stzListOfObjects( This.PreviousNItems(n, pnStartingAt) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

	  #--------------------#
	 #      UPDATING      #
	#--------------------#

	/*
	Semantic Note:
		Update	-> Assigning a hole new list to the list
		Replace	-> Replacing items or sections of items
	*/

	def Update(paNewList)
		if isList(paNewList) and Q(paNewList).IsWithOrByOrUsingNamedParam()
			paNewList = paNewList[2]
		ok

		@aContent = paNewList

		#< @FunctionFluentForm

		def UpdateQ(paNewList)
			This.Update(paNewList)
			return This

		#>

		#< @FunctionAlternativeForms

		def UpdateWith(paNewList)
			This.Update(paNewList)

			def UpdateWithQ(paNewList)
				return This.UpdateQ(paNewList)
	
		def UpdateBy(paNewList)
			This.Update(paNewList)

			def UpdateByQ(paNewList)
				return This.UpdateQ(paNewList)

		def UpdateUsing(paNewList)
			This.Update(paNewList)

			def UpdateUsingQ(paNewList)
				return This.UpdateQ(paNewList)

		#>

	def Updated(paNewList)
		return paNewList

		#< @FunctionAlternativeForms

		def UpdatedWith(paNewList)
			return This.Updated(paNewList)

		def UpdatedBy(paNewList)
			return This.Updated(paNewList)

		def UpdatedUsing(paNewList)
			return This.Updated(paNewList)

		#>

	  #----------------------#
	 #     ADDING ITEMS     #
	#----------------------#

	def AddItem(pItem)
		@aContent + pItem

		#< @FunctionFluentForm

		def AddItemQ(pItem)
			This.AddItem(pItem)
			return This
		
		#

		#< @FunctionAlternativeForm

		def Add(pItem)
			This.AddItem(pItem)

			def AddQ(pItem)
				This.Add(pItem)
				return This

		def AppendWith(pItem)
			This.AddItem(pItem)

			def AppendWithQ(pItem)
				This.AppendWithQ(pItem)
				return This

		def Append(pItem)
			if isList(pItem) and Q(pItem).IsWithOrUsingOrByNamedParam()
				pItem = pItem[2]
			ok

			This.AddItem(pItem)

			def AppendQ(pItem)
				This.Append(pItem)
				return This

		#>

	def ItemAdded(pItem)
		aResult = This.Copy().AddItemQ(pItem).Content()
		return aResult

		def Added(pItem)
			return This.ItemAdded(pItem)

		def AppendedWith(pItem)
			return This.ItemAdded(pItem)

		def Appended(pItem)
			return This.ItemAdded(pItem)

	  #-----------------------------------------------------------#
	 #  ADDING AN ITEM AT A GIVEN POSITION --> INSERT OR EXTEND  #
	#-----------------------------------------------------------#

	def AddItemAt(n, pItem) # TODO: Test it!

		if NOT isNumber(n)
			StzRaise("Incorrect param type! n must be a number.")
		ok

		if n <= This.NumberOfItems()
			This.InsertAt(n, pItem)

		else
			This.ExtendToPosition(n - 1, :With = NULL)
			This.Add(pItem)
		ok

		#< @FunctionFluentForm

		def AddItemAtQ(n, pItem)
			This.AddItem(n, pItem)
			return This

		#>

		#< @FunctionAlternativeForms

		def AddItemAtPosition(n, pItem)
			This.AddItemAt(n, pItem)

			def AddItemAtPositionQ(n, pItem)
				This.AddItemAtPosition(n, pItem)
				return This

		def AddAt(n, pItem)
			This.AddItem(n, pItem)

			def AddAtQ(n, pItem)
				This.AddAt(n, pItem)
				return This
	
		def AddAnNthItem(n, pItem)
			This.AddItem(n, pItem)

			def AddAnNthItemQ(n, pItem)
				This.AddAnNthItem(n, pItem)
				return This

		#>

	  #---------------------------------#
	 #  ADDING MANY ITEMS TO THE LIST  #
	#---------------------------------#

	def AddMany(paItems)
		if CheckParams()
			if NOT isList(paItems)
				StzRaise("Incorrect param type! paItems must be a list.")
			ok
		ok

		nLen = len(paItems)

		for i = 1 to nLen
			@aContent + paItems[i]
		next
	
		#< @FunctionFluentForm

		def AddManyQ(paItems)
			This.AddMany(paItems)
			return This

		#>

		#< @FunctionAlternativeForm

		def AddManyItems(paItems)
			This.AddMany(paItems)

			def AddManyItemsQ(paItems)
				This.AddManyItems(paItems)

		def AddEach(paItems)
			This.AddMany(paItems)

			def AddEachQ(paItems)
				This.AddEach(paItems)
				return This

		#>

	def ManyAdded(paItems)
		aResult = This.Copy().AddManyQ(paItems).Content()
		return aResult

		def ManyItemsAdded(paItems)
			return This.ManyAdded(paItems)

		def EachAdded(paItems)
			return This.ManyAdded(paItems)

		def EachItemAdded(paItems)
			return This.ManyAdded(paItems)

	  #===================================================#
	 #     INSERTING AN ITEM BEFORE A GIVEN POSITION     #
	#===================================================#

	def Insert(pItem, pWhere)

		if isList(pItem) and Q(pItem).IsItemNamedParam()
			pItem = pItem[2]
		ok

		if isList(pWhere)
			if Q(pWhere).IsOneOfTheseNamedParams([
				:At, :AtPosition, :Before, :BeforePosition ])

				This.InsertBefore(pWhere[2], pItem)
				return

			but Q(pWhere).IsOneOfTheseNamedParams([ :After, :AfterPosition ])

				This.InsertAfter(pWhere[2], pItem)
				return
			ok
		else
			This.InsertBefore(pWhere, pItem)
		ok

		#< @FunctionFluentForm

		def InsertQ(pItem, pWhere)
			This.Insert( pItem, pWhere )
			return This

		#>

		#< @FunctionAlternativeForm

		def InsertItem(pItem, pWhere)
			This.Insert(pItem, pWhere)

			def InsertItemQ(pItem, pWhere)
				This.InsertItem(pItem, pWhere)
				return This
		#>

	def InsertBeforePosition(n, pItem)
		if isList(n) and Q(n).IsPositionNamedParam()
			n = n[2]
		ok

		if isList(n) and Q(n).IsListOfNumbers()
			This.InsertBeforePositions(n, pItem)
			return
		ok

		if isList(pItem) and Q(pItem).IsItemNamedParam()
			pItem = pItem[2]
		ok

		if n >= 1 and n <= This.NumberOfItems()
			ring_insert(This.List(), n-1, pItem)

		but n > This.NumberofItems()
			This.ExtendToN(n)
			ring_insert(This.List(), n-1, pItem)
			# Using Ring native insert function here
		ok

		#< @FunctionFluentForm

		def InsertBeforePositionQ(n, pItem)
			This.InsertBeforePosition(n, pItem)
			return This

		#>

		#< @FunctionAlternativeForm

		def InsertBefore(n, pItem)
			if isList(n) and Q(n).IsOneOfTheseNamedParams([ :Position, :ItemAt, :ItemAtPosition ])
				n = n[2]
			ok

			This.InsertBeforePosition(n, pItem)

			def InsertBeforeQ(n, pItem)
				This.InsertBefore(n, pItem)
				return This

		def InsertAt(n, pItem)
			if isList(n) and Q(n).IsOneOfTheseNamedParams([ :Position, :ItemAt, :ItemAtPosition ])
				n = n[2]
			ok

			This.InsertBeforePosition(n, pItem)

			def InsertAtQ(n, pItem)
				This.InsertAt(n, pItem)
				return This

		#>
		
	  #----------------------------------------------------#
	 #     INSERTING AN ITEM AFTER A GIVEN POSITION      #
	#----------------------------------------------------#

	def InsertAfterPosition(n, pItem)

		if isList(n) and Q(n).IsListOfNumbers()
			This.InsertAfterPositions(n, pItem)
			return
		ok

		if n > 0 and n < This.NumberOfItems()
			ring_insert(This.List(), n, pItem)

		ok

		#< @FunctionFluentForm

		def InserAfterPositionQ(n, pItem)
			This.InsertAfterPosition(n, pItem)
			return This

		#>

		#< @FunctionAlternativeForm

		def InsertAfter(n, pItem)
			if isList(n) and Q(n).IsOneOfTheseNamedParams([ :Position, :ItemAt, :ItemAtPosition ])
				n = n[2]
			ok

			This.InsertAfterPosition(n, pItem)

			def InsertAfterQ(n, pItem)
				This.InsertAfter(n, pItem)
				return This

		#>

	#---------------------------------------#
	# TODO: Add same functions as stzString #
	#---------------------------------------#
	
	/*
	INSERTING BEFORE/AFTER THE NTH OCCURRENCE OF AN ITEM
		INSERTING BEFORE/AFTER THE FIRST OCCURRENCE OF AN ITEM
		INSERTING BEFORE/AFTER THE LAST OCCURRENCE OF AN ITEM
	
	INSERTING BEFORE THE NEXT NTH OCCURRENCE OF AN ITEM STARTING AT
		INSERTING BEFORE/AFTER THE NEXT OCCURRENCE OF AN ITEM STARTING AT
	
	INSERTING BEFORE THE PREVIOUS NTH OCCURRENCE OF AN ITEM STARTING AT
		INSERTING BEFORE/AFTER THE PREVIOUS OCCURRENCE OF AN ITEM STARTING AT
	*/

	  #--------------------------------#
	 #     OTHER INSERTING FORMS      # TODO
	#--------------------------------#

	def InsertAfterEachNumberOfSteps(n, pItem) // TODO
		/* Example : InsertAfterEachNumberOfSteps(2, "*")
		a = [ "A" , "B" , "C"  , "D" , "E" , "F" , "G" ]
		-->
		a = [ "A" , "B" , "*" , "D" , "E" , "*" , "F" , "G" ]
		*/

	def InsertAfterEachSequenceOfSteps(paSteps, pItem) // TODO
		/* Example : InsertAfterEachSequenceOfSteps([2,1], pcStr)
		a = [ "A" , "B" , "C"  , "D" , "E" , "F" , "G" ]
		-->
		a = [ "A" , "B" , "*" , "D" , "*" "E" , "F" , "*" , "G" , "*" ]
		*/

	def InsertRandomlyBefore(pItem)
		n = random( This.NumberOfItems() )
		This.InsertBefore(n, pItem)

		#< @FunctionFluentForm

		def InsertRandomlyBeforeQ(pItem)
			This.InsertRandomlyBefore(pItem)
			return This

		#>

	def InsertRandomlyAfter(pItem)
		n = random( This.NumberOfItems() )
		This.InsertAfter(n, pItem)

		#< @FunctionFluentForm

		def InsertRandomlyAfterQ(pItem)
			This.InsertRandomlyAfter(pItem)
			return This

		#>

	  #---------------------------------------------#
	 #  MOVING ITEM AT POSITION N1 TO POSITION N2  #
	#---------------------------------------------#

	def Move(n1, n2)

		# Checking params correctness

		if isList(n1) and
		   Q(n1).IsOneOfTheseNamedParams([
			:From, :FromPosition,
			:At, :AtPosition,
			:Item, :ItemAt, :ItemAtPosition,
			:FromItemAt, :FromItemAtPosition,
			:ItemFrom, :ItemFromPosition
		   ])

			n1 = n1[2]
		ok

		if isList(n2) and
		   Q(n2).IsOneOfTheseNamedParams([
			:To, :ToPosition, :ToItem, :ToItemAt,
			:ToItemAtPosition, :ToPositionOfItem ])

			n2 = n2[2]
		ok

		if isString(n1) and
		   Q(n1).IsOneOfThese([ :First, :FirstPosition, :FirstItem ])
				    
			n1 = 1
		ok

		if isString(n2) and
		   Q(n1).IsOneOfThese([ :Last, :LastPosition, :LastItem ])

			n2 = This.NumberOfItems()
		ok

		if NOT Q([n1, n2]).BothAreNumbers()
			StzRaise("Incorrect param type! n1 and n2 must be numbers.")
		ok

		# Doing the job
		
		if n1 > n2
		# . . . 2 . . 1 . .
		#       ^     |
		#       |_____|

			TempItem = This[n1]
			This.RemoveAt(n1)
			This.InsertBefore(n2, TempItem)

		but n1 < n2
		# . . . 1 . . 2 . .
		#       |     ^
		#       |_____|

			TempItem = This[n1]

			if n2 = This.NumberOfItems()
				This.AddItem(TempItem)
			else
				This.InSertAfter(n2, TempItem)
			ok

			This.RemoveAt(n1)
		ok

		#< @FunctionAlternativeForm

		def MoveItem(n1, n2)
			This.Move(n1, n2)

		#>

	  #-----------------------------------------#
	 #  SWAPPING ITEMS AT TWO GIVEN POSITIONS  #
	#-----------------------------------------#

	def Swap(n1, n2)
		if isList(n1) and
		   Q(n1).IsOneOfTheseNamedPArams([
			:Between, :BetweenPosition, :BetweenPositions,
			:BetweenItem, :BetweenItems,
			:BetweenItemAt, :BetweenItemAtPosition, :BetweenItemAtPositions,
			:Position, :Positions, :ItemAt, :ItemAtPosition, :ItemAtPositions,
			:Items, :ItemsAt, :ItemsAtPosition, :ItemsAtPositions
		   ])

			n1 = n1[2]
		ok

		if isList(n2) and
		   Q(n2).IsOneOfTheseNamedPArams([
			:And, :AndPosition, :AndItemAt, :AndItemAtPosition, :AndItem ])

			n2 = n2[2]
		ok

		copy = This[n2]
		This.ReplaceNth(n2, :By = This[n1])
		This.ReplaceNth(n1, :By = copy)

		#< @FunctionAlternativeForms

		def SwapBetween(n1, n2)
			This.Swap(n1, n2)

		def SwapBetweenPositions(n1, n2)
			This.Swap(n1, n2)

		def SwapItems(n1, n2)
			if isList(n1) and
			   Q(n1).IsOneOfTheseNamedParams([ :At, :AtPosition, :AtPositions ])
				n1 = n1[2]
			ok
	
			if isList(n2) and
			   Q(n2).IsOneOfTheseNamedParams([ :And, :AndPosition ])
				n2 = n2[2]
			ok
	
			This.Swap(n1, n2)

		def SwapItem(n1, n2)
			if isList(n1) and
			   Q(n1).IsOneOfTheseNamedParams([ :At, :AtPosition ])
				n1 = n1[2]
			ok
	
			if isList(n2) and
			   Q(n2).IsOneOfTheseNamedParams([
				:And, :AndPosition, :AndItemAt, :AndItemAtPosition ])

				n2 = n2[2]
			ok
	
			This.Swap(n1, n2)
		#>

	  #=========================================#
	 #   REPLACING ALL ITEMS WITH A NEW ITEM   #
	#=========================================#

	def ReplaceAllItems(pNewItem)

		for i = 1 to This.NumberOfItems()
			This.ReplaceItemAtPosition(i, pNewItem)
		next

		#< @FunctionFluentForm

		def ReplaceAllItemsQ(pNewItem)
			This.ReplaceAllItems(pNewItem)
			return This
		#>

	  #-------------------------------------------#
	 #   REPLACING ALL OCCURRENCES OF AN ITEM    # TODO: Add Case Sensitivity
	#-------------------------------------------#

	def ReplaceAllOccurrences(pItem, pNewItem)

		if CheckParams()

			if isList(pItem) and StzListQ(pItem).IsOfNamedParam()
				pItem = pItem[2]
			ok
	
			if @BothAreLists(pItem, pNewItem)
				This.ReplaceManyByMany(pItem, pNewItem)
				return
			ok

			if isList(pNewItem)
				This.ReplaceByMany(pNewItem)
				return
			ok

		ok

		anPositions = This.FindAll(pItem)

		for n in anPositions
			This.ReplaceItemAtPosition(n, pNewItem)
		next

		#< @FunctionFluentForm

		def ReplaceAllOccurrencesQ(pItem, pNewIteme)
			This.ReplaceAllOccurrences(pItem, pNewItem)
			return This
		#>

		#< @FunctionAlternativeForms

		def ReplaceItem(pItem, pNewItem)
			This.ReplaceAllOccurrences(pItem, pNewItem)

			def ReplaceItemQ(pItem, pNewItem)
				This.ReplaceItem(pItem, pNewIteme)
				return This

		def ReplaceAll(pItem, pNewItem)
			This.ReplaceAllOccurrences(pItem, pNewItem)

			def ReplaceAllQ(pItem, pNewItem)
				This.ReplaceAll(pItem, pNewIteme)
				return This

		def Replace(pItem, pNewItem)
			if isList(pItem) and Q(pItem).IsEachNamedParam()
				pItem = pItem[2]
			ok

			This.ReplaceAllOccurrences(pItem, pNewItem)

			def ReplaceQ(pItem, pNewIteme)
				This.Replace(pItem, pNewItem)
				return This

		#>

	def ItemReplacedBy(pItem, pNewItem)

		aResult =  This.Copy().
				ReplaceItemQ(pItem, pNewItem).
				Content()

		return aResult

		def AllOccurrencesOfItemReplacedBy(pItem, pNewItem)
			return ItemReplacedBy(pItem, pNewItem)

	  #------------------------------------------------#
	 #   REPLACING SOME OCCURRENCES OF A GIVEN ITEM   #
	#------------------------------------------------#

	# TODO: Add ReplaceTheseOccurrencesByMany()
	#       and ReplaceTheseOccurrencesByManyXT()

	def ReplaceTheseOccurrences(panOccurr, pItem, pNewItem)

		anPositions = This.FindAllQ(pItem).ItemsAt(panOccurr)
		This.ReplaceItemsAtPositions(anPositions, pNewItem)

		def ReplaceTheseOccurrencesQ(panOccurr, pItem, pNewItem)
			This.ReplaceTheseOccurrences(panOccurr, pItem, pNewItem)
			return This

		def ReplaceOccurrences(panOccurr, pItem, pNewItem)
			This.ReplaceTheseOccurrences(panOccurr, pItem, pNewItem)

			def ReplaceOccurrencesQ(panOccurr, pItem, pNewItem)
				This.ReplaceOccurrences(panOccurr, pItem, pNewItem)
				return This


	def TheseOccurrencesReplaced(panOccurr, pItem, pNewItem)
		This.ReplaceTheseOccurrencesQ(panOccurr, pItem, pNewItem)
		return This

		def OccurrencesReplaced(panOccurr, pItem, pNewItem)
			return This.TheseOccurrencesReplaced(panOccurr, pItem, pNewItem)

	  #----------------------------------------------#
	 #   REPLACING FIRST N OCCURRENCES OF AN ITEM   #
	#----------------------------------------------#

	def ReplaceFirstNOccurrences(n, pItem, pNewItem)
		This.ReplaceTheseOccurrences( 1 : n, pItem, pNewItem )

		def ReplaceFirstNOccurrencesQ(n, pItem, pNewItem)
			This.ReplaceFirstNOccurrences(n, pItem, pNewItem)
			return This

		def ReplaceNFirstOccurrences(n, pItem, pNewItem)
			This.ReplaceFirstNOccurrences(n, pItem, pNewItem)

			def ReplaceNFirstOccurrencesQ(n, pItem, pNewItem)
				This.ReplaceNFirstOccurrences(n, pItem, pNewItem)

	def FirstNOccurrencesReplaced(n, pItem, pNewItem)
		return This.Copy().ReplaceFirstNOccurrencesQ(n, pItem, pNewItem).Content()

		def NFirstOccurrencesReplaced(n, pItem, pNewItem)
			return This.FirstNOccurrencesReplaced(n, pItem, pNewItem)

	  #---------------------------------------------#
	 #   REPLACING LAST N OCCURRENCES OF AN ITEM   #
	#---------------------------------------------#

	def ReplaceLastNOccurrences(n, pItem, pNewItem)
		nNumberOfOccurr = This.NumberOfOccurrences(pItem)
		n1 = nNumberOfOccurr - n + 1
		This.ReplaceTheseOccurrences( n1 : nNumberOfOccurr, pItem, pNewItem )

		def ReplaceLastNOccurrencesQ(n, pItem, pNewItem)
			This.ReplaceLastNOccurrences(n, pItem, pNewItem)
			return This

		def ReplaceNLastOccurrences(n, pItem, pNewItem)
			This.ReplaceLastNOccurrences(n, pItem, pNewItem)

			def ReplaceNLastOccurrencesQ(n, pItem, pNewItem)
				This.ReplaceNLastOccurrences(n, pItem, pNewItem)

	def LastNOccurrencesReplaced(n, pItem, pNewItem)
		return This.Copy().ReplaceLastNOccurrencesQ(n, pItem, pNewItem).Content()

		def NLastOccurrencesReplaced(n, pItem, pNewItem)
			return This.LastNOccurrencesReplaced(n, pItem, pNewItem)

	  #---------------------------------------------#
	 #    REPLACING MANY ITEMS AT THE SAME TIME    # TODO: Add case sensitivity
	#=============================================#

	def ReplaceManyItems(paItems, pNewItem)

		if CheckParams()
			if NOT isList(paItems)
				StzRaise("Incorrect param type! paItems must be a list.")
			ok

			if isList(pNewItem) and Q(pNewItem).IsWithOrByOrUsingNamedParam()
				pNewItem = pNewItem[2]
			ok

			if isList(pNewItem)
				This.ReplaceManyByMany(paItems, pNewItem)
				return
			ok
		ok

		anPos = This.FindMany(paItems)
		This.ReplaceItemsAtPositions(anPos, pNewItem)

		#< @FunctionFluentForm

		def ReplaceManyItemsQ(paItems, pNewItem)
			This.ReplaceManyItems(paItems, pNewItem)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceMany(paItems, pNewItem)
			This.ReplaceManyItems(paItems, pNewItem)

			def ReplaceManyQ(paItems, pNewItem)
				This.ReplaceMany(paItems, pNewItem)
				return This

		def ReplaceAllOfThese(paItems, pNewItem)
			This.ReplaceManyItems(paItems, pNewItem)

			def ReplaceAllOfTheseQ(paItems, pNewItem)
				This.ReplaceAllOfThese(paItems, pNewItem)
				return This

		#--

		def ReplaceTheseItems(paItems, pNewItem)
			This.ReplaceManyItems(paItems, pNewItem)

			def ReplaceTheseItemsQ(paItems, pNewItem)
				This.ReplaceTheseItems(paItems, pNewItem)
				return This

		#>

	def ManyItemsReplaced(paItems, pNewItem)

		aResult  = This.Copy().
				ReplaceTheseItemsQ(paItems, pNewItem).
				Content()

		return aResult

		def TheseItemsReplaced(paItems, pNewItem)
			return This.ManyItemsReplaced(paItems, pNewItem)
	
	  #--------------------------------------------------#
	 #    REPLACING MANY ITEMS AT THE SAME TIME -- XT   # TODO: Add case sensitivity
	#--------------------------------------------------#

	def ReplaceManyItemsXT(paItems, pNewItem)

		if CheckParams()
			if NOT isList(paItems)
				StzRaise("Incorrect param type! paItems must be a list.")
			ok

			if isList(pNewItem) and Q(pNewItem).IsWithOrByOrUsingNamedParam()
				pNewItem = pNewItem[2]
			ok

			if isList(pNewItem)
				This.ReplaceManyByManyXT(paItems, pNewItem)
				return
			ok
		ok

		This.ReplaceManyItems(paItems, pNewItem)

		#< @FunctionFluentForm

		def ReplaceManyItemsXTQ(paItems, pNewItem)
			This.ReplaceManyItemsXT(paItems, pNewItem)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceManyXT(paItems, pNewItem)
			This.ReplaceManyItems(paItems, pNewItem)

			def ReplaceManyXTQ(paItems, pNewItem)
				This.ReplaceManyXT(paItems, pNewItem)
				return This

		def ReplaceAllOfTheseXT(paItems, pNewItem)
			This.ReplaceManyItemsXT(paItems, pNewItem)

			def ReplaceAllOfTheseXTQ(paItems, pNewItem)
				This.ReplaceAllOfTheseXT(paItems, pNewItem)
				return This

		#--

		def ReplaceTheseItemsXT(paItems, pNewItem)
			This.ReplaceManyItemsXT(paItems, pNewItem)

			def ReplaceTheseItemsXTQ(paItems, pNewItem)
				This.ReplaceTheseItemsXT(paItems, pNewItem)
				return This

		#>

	def ManyItemsReplacedXT(paItems, pNewItem)

		aResult  = This.Copy().
				ReplaceTheseItemsXTQ(paItems, pNewItem).
				Content()

		return aResult

		def TheseItemsReplacedXT(paItems, pNewItem)
			return This.ManyItemsReplacedXT(paItems, pNewItem)

	  #------------------------------------------#
	 #    REPLACING MANY ITEMS BY MANY OTHERS   #
	#==========================================#

	def ReplaceManyByMany(paItems, paNewItems)

		if CheckParams()

			if NOT isList(paItems)
				StzRaise("Incorrect param! paNewItems must be a list.")
			ok
	
		ok

		anPos = This.FindMany(paItems)
		This.ReplaceOccurrencesByMany(anPos, paNewItems)

		#< @FunctionFluentForm

		def ReplaceManyByManyQ(paItems, paNewItems)
			This.ReplaceManyByMany(paItems, paNewItems)
			return This

		#>

	def ManyReplacedByMany(paItems, pacNewItems)
		aResult = This.Copy().ReplaceManyByManyQ(paItems, paNewItems).Content()
		return aResult

	  #-----------------------------------------------------#
	 #    REPLACING MANY ITEMS BY MANY OTHERS -- EXTENDED  #
	#-----------------------------------------------------#

	def ReplaceManyByManyXT(paItems, paNewItems)
		/*
		StzListQ([ "A", "A", "A", "A", "A" ]) {
			ReplaceManyByManyXT("A", :With = [ "#1", "#2" ])
			? Content()

		}
		#--> [ "#1", "#2", "#1", "#2", "#1" ]
		*/

		if CheckParams()

			if NOT isList(paItems)
				StzRaise("Incorrect param! paNewItems must be a list.")
			ok
	
		ok

		anPos = This.FindMany(paItems)
		This.ReplaceOccurrencesByManyXT(anPos, paNewItems)

		def ReplaceManyByManyXTQ(paItems, paNewItems)
			This.ReplaceManyByManyXT(paItems, paNewItems)
			return This

	def ManyReplacedByManyXT(paItems, pacNewItems)
		aResult = This.Copy().ReplaceManyByManyXTQ(paItems, paNewItems).Content()
		return aResult

	   #------------------------------------------------#
	  #   REPLACING THE NEXT OCCURRENCES OF AN ITEM    #
         #   STARTING AT A GIVEN POSITION                 #
	#------------------------------------------------#

	def ReplaceNextOccurrencesCS(pItem, pOtherItem, pnStartingAt, pCaseSensitive)

		anPositions = This.FindNextOccurrencesCS(pItem, pnStartingAt, pCaseSensitive)
		This.ReplaceItemsAtPositions(anPositions, pOtherItem)

		def ReplaceNextOccurrencesCSQ(pItem, pOtherItem, pnStartingAt, pCaseSensitive)
			This.ReplaceNextOccurrencesCS(pItem, pOtherItem, pnStartingAt, pCaseSensitive)
			return This

		def ReplaceNextCS(pItem, pOtherItem, pnStartingAt, pCaseSensitive)
			This.ReplaceNextOccurrencesCS(pItem, pOtherItem, pnStartingAt, pCaseSensitive)

			def ReplaceNextCSQ(pItem, pOtherItem, pnStartingAt, pCaseSensitive)
				This.ReplaceNextCS(pItem, pOtherItem, pnStartingAt, pCaseSensitive)
				return This

	def NextOccurrencesReplacedCSQ(pItem, pOtherItem, pnStartingAt, pCaseSensitive)

		acResult = This.Copy().
				ReplaceNextOccurrencesCSQ(pItem, pOtherItem, pnStartingAt, pCaseSensitive).
				Content()
		return acResult

	#-- WITHOUT CASESENSITIVITY

	def ReplaceNextOccurrences(pItem, pOtherItem, pnStartingAt)
		This.ReplaceNextOccurrencesCS(pItem, pOtherItem, pnStartingAt, :CaseSensitive = TRUE)

		def ReplaceNextOccurrencesQ(pItem, pOtherItem, pnStartingAt)
			This.ReplaceNextOccurrences(pItem, pOtherItem, pnStartingAt)
			return This

		def ReplaceNext(pItem, pOtherItem, pnStartingAt)
			This.ReplaceNextOccurrences(pItem, pOtherItem, pnStartingAt)

			def ReplaceNextQ(pItem, pOtherItem, pnStartingAt)
				This.ReplaceNext(pItem, pOtherItem, pnStartingAt)
				return This

	def NextOccurrencesReplacedQ(pItem, pOtherItem, pnStartingAt)

		acResult = This.Copy().
				ReplaceNextOccurrencesQ(pItem, pOtherItem, pnStartingAt).
				Content()

		return acResult

	   #--------------------------------------------------#
	  #   REPLACING THE PREVIOUS OCCURRENCES OF AN ITEM  #
         #   STARTING AT A GIVEN POSITION                   #
	#--------------------------------------------------#

	def ReplacePreviousOccurrencesCS(pItem, pOtherItem, pnStartingAt, pCaseSensitive)

		anPositions = This.FindPreviousOccurrencesCS(pItem, pnStartingAt, pCaseSensitive)
		This.ReplaceItemsAtPositions(anPositions, pOtherItem)

		def ReplacePreviousOccurrencesCSQ(pItem, pOtherItem, pStartingAt, pCaseSensitive)
			This.ReplacePreviousOccurrencesCS(pItem, pOtherItem, pnStartingAt, pCaseSensitive)
			return This

		def ReplacePreviousCS(pItem, pOtherItem, pnStartingAt, pCaseSensitive)
			This.ReplacePreviousOccurrencesCS(pItem, pOtherItem, pnStartingAt, pCaseSensitive)

			def ReplacePreviousCSQ(pItem, pOtherItem, pnStartingAt, pCaseSensitive)
				This.ReplacePreviousCS(pItem, pOtherItem, pnStartingAt, pCaseSensitive)
				return This

	def PreviousOccurrencesReplacedCSQ(pItem, pOtherItem, pnStartingAt, pCaseSensitive)

		acResult = This.Copy().
				ReplacePreviousOccurrencesCSQ(pItem, pOtherItem, pnStartingAt, pCaseSensitive).
				Content()
		return acResult

	#-- WITHOUT CASESENSITIVITY

	def ReplacePreviousOccurrences(pItem, pOtherItem, pnStartingAt)
		This.ReplacePreviousOccurrencesCS(pItem, pOtherItem, pnStartingAt, :CaseSensitive = TRUE)

		def ReplacePreviousOccurrencesQ(pItem, pOtherItem, pStartingAt)
			This.ReplacePreviousOccurrences(pItem, pOtherItem, pnStartingAt)
			return This

		def ReplacePrevious(pItem, pOtherItem, pnStartingAt)
			This.ReplacePreviousOccurrences(pItem, pOtherItem, pnStartingAt)

			def ReplacePreviousQ(pItem, pOtherItem, pnStartingAt)
				This.ReplacePrevious(pItem, pOtherItem, pnStartingAt)
				return This

	def PreviousOccurrencesReplacedQ(pItem, pOtherItem, pnStartingAt)

		acResult = This.Copy().
				ReplacePreviousOccurrencesQ(pItem, pOtherItem, pnStartingAt).
				Content()
		return acResult

	  #-----------------------------------------#
	 #   REPLACING NTH OCCURRENCE OF AN ITEM   #
	#-----------------------------------------#

	def ReplaceNthOccurrenceCS(n, pItem, pOtherItem, pCaseSensitive)
		if isList(pItem) and StzListQ(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pOtherItem) and
		   StzListQ(pOtherItem).IsWithOrByNamedParam()
		
			pOtherItem = pOtherItem[2]
		ok

		nItemPosition = This.FindNthOccurrenceCS(n, pItem, pCaseSensitive)
		This.ReplaceItemAtPositionCS(nItemPosition, pOtherItem, pCaseSensitive)

		#< @FunctionFluentForm

		def ReplaceNthOccurrenceCSQ(n, pItem, pOtherItem, pCaseSensitive)
			This.ReplaceNthOccurrenceCS(n, pItem, pOtherItem, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceNthCS(n, pItem, pOtherItem, pCaseSensitive)
			This.ReplaceNthOccurrenceCS(n, pItem, pOtherItem, pCaseSensitive)

			def ReplaceNthCSQ(n, pItem, pOtherItem, pCaseSensitive)
				This.ReplaceNthCS(n, pItem, pOtherItem, pCaseSensitive)
				return This
			
		#>

	def NthOccurrenceReplacedCS(n, pItem, pOtherItem, pCaseSensitive)

		aResult  = This.Copy().
				ReplaceNthOccurrenceCSQ(n, pItem, pOtherItem, pCaseSensitive).
				Content()

		return aResult

		def NthReplacedCS(n, pItem, pOtherItem, pCaseSensitive)
			return This.NthOccurrenceReplacedCS(n, pItem, pOtherItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ReplaceNthOccurrence(n, pItem, pOtherItem)
		This.ReplaceNthOccurrenceCS(n, pItem, pOtherItem, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ReplaceNth(n, pItem, pOtherItem)
			This.ReplaceNthOccurrence(n, pItem, pOtherItem)

			def ReplaceNthQ(n, pItem, pOtherItem)
				This.ReplaceNth(n, pItem, pOtherItem)
				return This
			
		#>

	def NthOccurrenceReplaced(n, pItem, pOtherItem)

		aResult  = This.Copy().
				ReplaceNthOccurrenceQ(n, pItem, pOtherItem).
				Content()

		return aResult

		def NthReplaced(n, pItem, pOtherItem)
			return This.NthOccurrenceReplaced(n, pItem, pOtherItem, pCaseSensitive)

	  #--------------------------------------------#
	 #   REPLACING FIRST OCCURRENCE OF AN ITEM    #
	#--------------------------------------------#

	def ReplaceFirstOccurrenceCS(pItem, pOtherItem, pCaseSensitive)
		This.ReplaceNthOccurrenceCS(1, pItem, pOtherItem, pCaseSensitive)

		def ReplaceFirstOccurrenceCSQ(pItem, pOtherItem, pCaseSensitive)
			This.ReplaceFirstOccurrenceCS(pItem, pOtherItem, pCaseSensitive)
			return This

		#< @FunctionAlternativeForm

		def ReplaceFirstCS(pItem, pOtherItem, pCaseSensitive)
			This.ReplaceFirstOccurrenceCS(pItem, pOtherItem, pCaseSensitive)

			def ReplaceFirstCSQ(pItem, pOtherItem, pCaseSensitive)
				This.ReplaceFirstCS(pItem, pOtherItem, pCaseSensitive)
				return This
		#>

	def FirstOccurrenceReplacedCS(pItem, pOtherItem, pCaseSensitive)
		aResult  = This.Copy().
				ReplaceFirstOccurrenceCSQ(pItem, pOtherItem, pCaseSensitive).
				Content()

		return aResult

		def FirstReplacedCS(pItem, pOtherItem, pCaseSensitive)
			return This.FirstOccurrenceReplacedCS(pItem, pOtherItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ReplaceFirstOccurrence(pItem, pOtherItem)
		This.ReplaceFirstOccurrenceCS(pItem, pOtherItem, :CaseSensitive = TRUE)

		def ReplaceFirstOccurrenceQ(pItem, pOtherItem)
			This.ReplaceFirstOccurrence(pItem, pOtherItem)
			return This

		#< @FunctionAlternativeForm

		def ReplaceFirst(pItem, pOtherItem)
			This.ReplaceFirstOccurrence(pItem, pOtherItem)

			def ReplaceFirstQ(pItem, pOtherItem)
				This.ReplaceFirst(pItem, pOtherItem)
				return This
		#>

	def FirstOccurrenceReplaced(pItem, pOtherItem)
		aResult  = This.Copy().
				ReplaceFirstOccurrenceQ(pItem, pOtherItem).
				Content()

		return aResult

		def FirstReplaced(pItem, pOtherItem)
			return This.FirstOccurrenceReplaced(pItem, pOtherItem)

	  #-----------------------------------------#
	 #   REPLACING LAST OCCURRENCE OF AN ITEM  #
	#-----------------------------------------#

	def ReplaceLastOccurrenceCS(pItem, pOtherItem, pCaseSensitive)
		n = This.FindLastOccurrenceCS(pItem, pCaseSensitive)

		This.ReplaceItemAtPosition(n, pOtherItem)

		def ReplaceLastOccurrenceCSQ(pItem, pOtherItem, pCaseSensitive)
			This.ReplaceLastOccurrenceCS(pItem, pOtherItem, pCaseSensitive)
			return This

		#< @FunctionAlternativeForms

		def ReplaceLastCS(pItem, pOtherItem, pCaseSensitive)
			This.ReplaceLastOccurrenceCS(pItem, pOtherItem, pCaseSensitive)

			def ReplaceLastCSQ(pItem, pOtherItem, pCaseSensitive)
				This.ReplaceLastCS(pItem, pOtherItem, pCaseSensitive)
				return This

		#>

	def LastOccurrenceReplacedCS(pItem, pOtherItem, pCaseSensitive)

		aResult  = This.Copy().
				ReplaceLastOccurrenceCSQ(pItem, pOtherItem, pCaseSensitive).
				Content()

		return aResult

		def LastReplacedCS(pItem, pOtherItem, pCaseSensitive)
			return This.LastOccurrenceReplacedCS(pItem, pOtherItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ReplaceLastOccurrence(pItem, pOtherItem)
		n = This.FindLastOccurrence(pItem)

		This.ReplaceItemAtPosition(n, pOtherItem)

		def ReplaceLastOccurrenceQ(pItem, pOtherItem)
			This.ReplaceLastOccurrence(pItem, pOtherItem)
			return This

		#< @FunctionAlternativeForms

		def ReplaceLast(pItem, pOtherItem)
			This.ReplaceLastOccurrence(pItem, pOtherItem)

			def ReplaceLastQ(pItem, pOtherItem)
				This.ReplaceLast(pItem, pOtherItem)
				return This

		#>

	def LastOccurrenceReplaced(pItem, pOtherItem)

		aResult  = This.Copy().
				ReplaceLastOccurrenceQ(pItem, pOtherItem).
				Content()

		return aResult

		def LastReplaced(pItem, pOtherItem)
			return This.LastOccurrenceReplaced(pItem, pOtherItem)

	   #-----------------------------------------------#
	  #    REPLACING NEXT NTH OCCURRENCE OF AN ITEM   #
	 #    STARTING AT A GIVEN POSITION IN THE LIST   #
	#-----------------------------------------------#

	def ReplaceNextNthOccurrenceCS(n, pItem, pNewItem, pnStartingAt, pCaseSensitive)

		# Checking params correctness

		if NOT isNumber(n)
			StzRaise("Incorrect param! n must be a number.")
		ok

		if isList(pItem) and StzListQ(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pNewItem) and
		   StzListQ(pNewItem).IsWithOrByNamedParam()

			if Q(pNewItem[1]).LastChar() = "@"
				
				cCode = 'pNewtItem = ' +
					Q(pNewItem[2]).
					RemoveSpacesQ().
					RemoveTheseBoundsQ("{","}").
					Content()

				eval(cCode)
			else
				pNewItem = pNewItem[2]
			ok
		ok

		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if Q(pnStartingAt).IsOneOfThese([
				:First, :FirstPosition, :FirstItem ], :CS = FALSE)

				pnStartingAt = 1
			
			but Q(pnStartingAt).IsOneOfThese([
				:Last, :LastPosition, :LastItem ], :CS = FALSE)

				pnStartingAt = This.NumberOfItems()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			StzRaise("Incorrect param! pnStartingAt must be a number.")
		ok

		# Doing the job

		oSection   = This.SectionQR(pnStartingAt, This.NumberOfItems(), :stzList)
		anPos = oSection.FindAllCS(pItem, pCaseSensitive)

		if len(anPos) > 0
			anPos = StzListOfNumbersQ(anPos).AddToEachQ(pnStartingAt - 1).Content()
			nPos = anPos[n]
	
			This.ReplaceItemAtPosition(nPos, pNewItem)
		ok
	
		#< @FunctionFluentForm

		def ReplaceNextNthOccurrenceCSQ(n, pItem, pnStartingAt, pNewItem, pCaseSensitive)
			This.ReplaceNextNthOccurrenceCS(n, pItem, pnStartingAt, pNewItem, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceNthNextOccurrenceCS(n, pItem, pnStartingAt, pNewItem, pCaseSensitive)
			This.ReplaceNextNthOccurrenceCS(n, pItem, pnStartingAt, pNewItem, pCaseSensitive)

			def ReplaceNthNextOccurrenceCSQ(n, pItem, pnStartingAt, pNewItem, pCaseSensitive)
				This.ReplaceNthNextOccurrenceCS(n, pItem, pnStartingAt, pNewItem, pCaseSensitive)
				return This

		#>

	def NextNthOccurrenceReplacedCS(n, pItem, pnStartingAt, pNewItem, pCaseSensitive)

		aResult  = This.Copy().
				ReplaceNthNextOccurrenceCSQ(n, pItem, pnStartingAt, pNewItem, pCaseSensitive).
				Content()
		return aResult

		def NthNextOccurrenceReplacedCS(n, pItem, pnStartingAt, pNewItem, pCaseSensitive)
			return This.NextNthOccurrenceReplaced(n, pItem, pnStartingAt, pNewItem)

	#-- WITHOUT CASESENSITIVITY

	def ReplaceNextNthOccurrence(n, pItem, pNewItem, pnStartingAt, pCaseSensitive)
		return This.ReplaceNextNthOccurrenceCS(n, pItem, pNewItem, pnStartingAt, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def ReplaceNextNthOccurrenceQ(n, pItem, pnStartingAt, pNewItem)
			This.ReplaceNextNthOccurrence(n, pItem, pnStartingAt, pNewItem)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceNthNextOccurrence(n, pItem, pnStartingAt, pNewItem)
			This.ReplaceNextNthOccurrence(n, pItem, pnStartingAt, pNewItem)

			def ReplaceNthNextOccurrenceQ(n, pItem, pnStartingAt, pNewItem)
				This.ReplaceNthNextOccurrence(n, pItem, pnStartingAt, pNewItem)
				return This

		#>

	def NextNthOccurrenceReplaced(n, pItem, pnStartingAt, pNewItem)

		aResult  = This.Copy().
				ReplaceNthNextOccurrenceQ(n, pItem, pnStartingAt, pNewItem).
				Content()

		return aResult

		def NthNextOccurrenceReplaced(n, pItem, pnStartingAt, pNewItem)
			return This.NextNthOccurrenceReplaced(n, pItem, pnStartingAt, pNewItem)

	   #------------------------------------------------#
	  #    REPLACING NEXT OCCURRENCE OF AN ITEM        #
	 #    STARTING AT A GIVEN POSITION IN THE LIST    #
	#------------------------------------------------#

	def ReplaceNextOccurrenceCS(pItem, pNewItem, pnStartingAt, pCaseSensitive)
		This.ReplaceNextNthOccurrenceCS(1, pItem, pNewItem, pnStartingAt, pCaseSensitive)

		def ReplaceNextOccurrenceCSQ(pItem, pNewItem, pnStartingAt, pCaseSensitive)
			This.ReplaceNextOccurrenceCS(pItem, pNewItem, pnStartingAt, pCaseSensitive)
			return This

	def NextOccurrenceReplacedCS(pItem, pNewItem, pnStartingAt, pCaseSensitive)

		aResult =  This.Copy().
				ReplaceNextOccurrenceCSQ(pItem, pNewItem, pnStartingAt, pCaseSensitive).
				Content()

		return aResult

	#-- WITHOUT CASESENSITIVITY

	def ReplaceNextOccurrence(pItem, pNewItem, pnStartingAt)
		This.ReplaceNextNthOccurrenceCS(1, pItem, pNewItem, pnStartingAt, pCaseSensitive)

		def ReplaceNextOccurrenceQ(pItem, pNewItem, pnStartingAt)
			This.ReplaceNextOccurrence(pItem, pNewItem, pnStartingAt)
			return This

	def NextOccurrenceReplaced(pItem, pNewItem, pnStartingAt)

		aResult  = This.Copy().
				ReplaceNextOccurrenceQ(pItem, pNewItem, pnStartingAt).
				Content()

		return aResult

	   #-----------------------------------------------------#
	  #    REPLACING MANY NEXT NTH OCCURRENCES OF AN ITEM   #
	 #    STARTING AT A GIVEN POSITION IN THE LIST         #
	#-----------------------------------------------------#

	def ReplaceNextNthOccurrencesCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
		/* Example

		StzListOfQ([ "A" , "B", "A", "C", "A", "D", "A" ]) {
			ReplaceNextNthOccurrences([2, 3], :of = "A", :with = "*",  :StartingAt = 3)
			? Content() # !--> [ "A" , "B", "A", "C", "*", "D", "*" ]
		}		

		*/

		if NOT (isList(panList) and StzListQ(panList).IsListOfNumbers() and
		        StzListQ(panList).NumberOfItemsW("StzNumberQ(@item).IsBetween(1, " + This.NumberOfItems() + ")") = len(panList) )

			StzRaise("Incorrect param! panList must be a list of numbers between 1 and This.NumberOfItems().")
		ok

		if isList(pItem) and StzListQ(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pNewItem) and
		   StzListQ(pNewItem).IsWithOrByNamedParam()
			if Q(pNewItem[1]).LastChar() = "@"
				cCode = 'pNewtItem = ' + pNewItem[2]
				eval(cCode)
			else
				pNewItem = pNewItem[2]
			ok
		ok

		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if Q(pnStartingAt).IsOneOfThese([
				:First, :FirstPosition, :FirstItem ], :CS = FALSE)

				pnStartingAt = 1
			
			but Q(pnStartingAt).IsOneOfThese([
				:Last, :LastPosition, :LastItem ], :CS = FALSE)

				pnStartingAt = This.NumberOfItems()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			StzRaise("Incorrect param! pnStartingAt must be a number.")
		ok
			
		oSection = This.SectionQ(pnStartingAt, :LastItem)

		anPositions = oSection.
			      FindAllCSQR(pItem, pCaseSensitive, :stzListOfNumbers).
			      AddToEachQ(pnStartingAt-1).
			      Content()

		anPositionsToBeReplaced = []

		nLen = len(panList)
		nLenPos = len(anPositions)

		for i = 1 to nLen
			if i <= nLenPos
				anPositionsToBeReplaced +  anPositions[panList[i]]
			ok
		next

		This.ReplaceAllItemsAtThesePositions(anPositionsToBeReplaced, pNewItem)

		#< @FunctionFluentForm

		def ReplaceNextNthOccurrencesCSQ(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
			This.ReplaceNextNthOccurrencesCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForm

		def ReplaceNthNextOccurrencesCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
			This.ReplaceNextNthOccurrences(panList, pItem, pNewItem, pnStartingAt)

			def ReplaceNthNextOccurrencesCSQ(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
				This.ReplaceNthNextOccurrencesCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
				return This
		#>

	def NextNthOccurrencesReplacedCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)

		aResult = This.
			  ReplaceNextNthOccurrencesCSQ(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive).
			  Content()

		return aResult

		def NthNextOccurrencesReplacedCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ReplaceNextNthOccurrences(panList, pItem, pNewItem, pnStartingAt)
		return This.ReplaceNextNthOccurrencesCS(panList, pItem, pNewItem, pnStartingAt, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def ReplaceNextNthOccurrencesQ(panList, pItem, pNewItem, pnStartingAt)
			This.ReplaceNextNthOccurrences(panList, pItem, pNewItem, pnStartingAt)
			return This

		#>

		#< @FunctionAlternativeForm

		def ReplaceNthNextOccurrences(panList, pItem, pNewItem, pnStartingAt)
			This.ReplaceNextNthOccurrences(panList, pItem, pNewItem, pnStartingAt)

			def ReplaceNthNextOccurrencesQ(panList, pItem, pNewItem, pnStartingAt)
				This.ReplaceNthNextOccurrences(panList, pItem, pNewItem, pnStartingAt)
				return This
		#>

	def NextNthOccurrencesReplaced(panList, pItem, pNewItem, pnStartingAt)

		aResult = This.
			  ReplaceNextNthOccurrencesQ(panList, pItem, pNewItem, pnStartingAt).
			  Content()

		return aResult

		def NthNextOccurrencesReplaced(panList, pItem, pNewItem, pnStartingAt)
			return This.NextNthOccurrencesReplaced(panList, pItem, pNewItem, pnStartingAt)

	   #---------------------------------------------------#
	  #    REPLACING PREVIOUS NTH OCCURRENCE OF AN ITEM   #
	 #    STARTING AT A GIVEN POSITION IN THE LIST       #
	#---------------------------------------------------#

	def ReplacePreviousNthOccurrenceCS(n, pItem, pNewItem, pnStartingAt, pCaseSensitive)
		if isList(pItem) and StzListQ(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pNewItem) and
		   StzListQ(pNewItem).IsWithOrByNamedParam()

			if Q(pNewItem[1]).LastChar() = "@"
				cCode = 'pNewtItem = ' + pNewItem[2]
				eval(cCode)

			else
				pNewItem = pNewItem[2]
			ok
		ok

		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if Q(pnStartingAt).IsOneOfThese([
				:First, :FirstPosition, :FirstItem ], :CS = FALSE)

				pnStartingAt = 1
			
			but Q(pnStartingAt).IsOneOfThese([
				:Last, :LastPosition, :LastItem ], :CS = FALSE)

				pnStartingAt = This.NumberOfItems()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			StzRaise("Incorrect param! pnStartingAt must be a number.")
		ok

		oSection   = This.SectionQR(1, pnStartingAt, :stzList)
		aPositions = oSection.FindAllCS(pItem, pCaseSensitive)

		nPosition = aPositions[ len(aPositions) - n + 1 ]

		This.ReplaceItemAtPositionCS(nPosition, pNewItem, pCaseSensitive)

		def ReplacePreviousNthOccurrenceCSQ(n, pItem, pNewItem, pnStartingAt, pCaseSensitive)
			This.ReplacePreviousNthOccurrenceCS(n, pItem, pNewItem, pnStartingAt, pCaseSensitive)
			return This

		def ReplaceNthPreviousOccurrenceCS(n, pItem, pNewItem, pnStartingAt, pCaseSensitive)
			This.ReplacePreviousNthOccurrenceCS(n, pItem, pNewItem, pnStartingAt, pCaseSensitive)

			def ReplaceNthPreviousOccurrenceCSQ(n, pItem, pNewItem, pnStartingAt, pCaseSensitive)
				This.ReplaceNthPreviousOccurrenceCS(n, pItem, pNewItem, pnStartingAt, pCaseSensitive)
				return This

	def NthPreviousOccurrenceReplacedCS(n, pItem, pNewItem, pnStartingAt, pCaseSensitive)

		aResult =  This.Copy().
				ReplaceNthPreviousOccurrenceCSQ(n, pItem, pNewItem, pnStartingAt, pCaseSensitive).
				Content()

		return aResult

		def PreviousNthOccurrenceReplacedCS(n, pItem, pNewItem, pnStartingAt, pCaseSensitive)
			return This.NthPreviousOccurrenceReplacedCS(n, pItem, pnStartingAt, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

		def ReplacePreviousNthOccurrenceQ(n, pItem, pNewItem, pnStartingAt)
			This.ReplacePreviousNthOccurrence(n, pItem, pNewItem, pnStartingAt)
			return This

		def ReplaceNthPreviousOccurrence(n, pItem, pNewItem, pnStartingAt)
			This.ReplacePreviousNthOccurrence(n, pItem, pNewItem, pnStartingAt)

			def ReplaceNthPreviousOccurrenceQ(n, pItem, pNewItem, pnStartingAt)
				This.ReplaceNthPreviousOccurrence(n, pItem, pNewItem, pnStartingAt)
				return This

	def NthPreviousOccurrenceReplaced(n, pItem, pNewItem, pnStartingAt)

		aResult =  This.Copy().
				ReplaceNthPreviousOccurrenceQ(n, pItem, pNewItem, pnStartingAt).
				Content()

		return aResult

		def PreviousNthOccurrenceReplaced(n, pItem, pNewItem, pnStartingAt)
			return This.NthPreviousOccurrenceReplaced(n, pItem, pnStartingAt)

	   #-----------------------------------------------#
	  #    REPLACING PREVIOUS OCCURRENCE OF AN ITEM   #
	 #    STARTING AT A GIVEN POSITION IN THE LIST   #
	#-----------------------------------------------#

	def ReplacePreviousOccurrenceCS(pItem, pNewItem, pnStartingAt, pCaseSensitive)
		This.ReplacePreviousNthOccurrenceCS(1, pItem, pNewItem, pnStartingAt, pCaseSensitive)

		def ReplacePreviousOccurrenceCSQ(pItem, pNewItem, pnStartingAt, pCaseSensitive)
			This.ReplacePreviousOccurrenceCS(pItem, pNewItem, pnStartingAt, pCaseSensitive)
			return This

	def PreviousOccurrenceReplacedCS(pItem, pNewItem, pnStartingAt, pCaseSensitive)

		aResult =  This.Copy().
				ReplacePreviousOccurrenceCSQ(pItem, pNewItem, pnStartingAt, pCaseSensitive).
				Content()
		return aResult

	#-- WITHOUT CASESENSITIVITY

	def ReplacePreviousOccurrence(pItem, pNewItem, pnStartingAt)
		This.ReplacePreviousOccurrenceCS(pItem, pNewItem, pnStartingAt, :CaseSensitive = TRUE)

		def ReplacePreviousOccurrenceQ(pItem, pNewItem, pnStartingAt)
			This.ReplacePreviousOccurrence(pItem, pNewItem, pnStartingAt)
			return This

	def PreviousOccurrenceReplaced(pItem, pNewItem, pnStartingAt)

		aResult =  This.Copy().
				ReplacePreviousOccurrenceQ(pItem, pNewItem, pnStartingAt).
				Content()
		return aResult

	   #---------------------------------------------------------#
	  #     REPLACING MANY PREVIOUS NTH OCCURRENCES OF AN ITEM  #
	 #    STARTING AT A GIVEN POSITION IN THE LIST             #
	#---------------------------------------------------------#

	def ReplacePreviousNthOccurrencesCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
		/* Example

		StzListQ([ "A" , "B", "A", "C", "A", "D", "A" ]) {
			ReplacePreviousNthOccurrences([2, 3], :of = "A", :with = "*",  :StartingAt = 5)
			? Content() # !--> [ "*" , "B", "*", "C", "A", "D", "A" ]
		}		

		*/

		if NOT ( isList(panList) and StzListQ(panList).IsListOfNumbers() and

		         StzListQ(panList).NumberOfItemsW("StzNumberQ(@item).IsBetween(1, " + This.NumberOfItems() + ")") = len(panList) )

			StzRaise("Incorrect param! panList must be a list of numbers between 1 and This.NumberOfItems().")
		ok

		if isList(pItem) and StzListQ(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pNewItem) and
		   ( StzListQ(pNewItem).IsWithNamedParam() or StzListQ(pNewItem).IsByNamedParam() )

			if Q(pNewItem[1]).LastChar() = "@"
				cCode = 'pNewtItem = ' + pNewItem[2]
				eval(cCode)

			else
				pNewItem = pNewItem[2]
			ok
		ok

		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if Q(pnStartingAt).IsOneOfThese([
				:First, :FirstPosition, :FirstItem ], :CS = FALSE)

				pnStartingAt = 1
			
			but Q(pnStartingAt).IsOneOfThese([
				:Last, :LastPosition, :LastItem ], :CS = FALSE)

				pnStartingAt = This.NumberOfItems()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			StzRaise("Incorrect param! pnStartingAt must be a number.")
		ok
			
		oSection = This.SectionQ(1, pnStartingAt)

		anPositions = oSection.FindAllCSQ(pItem, pCaseSensitive).ItemsReversed()

		anPositionsToBeReplaced = []
		nLen = len(panList)
		nLenPos = len(anPositions)

		for i = 1 to nLen
			if i <= nLenPos
				anPositionsToBeReplaced +  anPositions[panList[i]]
			ok
		next

		This.ReplaceAllItemsAtThesePositionsCS(anPositionsToBeReplaced, pNewItem, pCaseSensitive)

		#< @FunctionFluentForm

		def ReplacePreviousNthOccurrencesCSQ(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
			This.ReplacePreviousNthOccurrencesCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForm

		def ReplaceNthPreviousOccurrencesCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
			This.ReplacePreviousNthOccurrencesCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)

			def ReplaceNthPreviousOccurrencesCSQ(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
				This.ReplaceNthPreviousOccurrencesCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
				return This
		#>

	def PreviousNthOccurrencesReplacedCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
		aResult =  This.
			   ReplacePreviousNthOccurrencesCSQ(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive).
			   Content()

		return aResult

		def NthPreviousOccurrencesReplacedCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)
			return This.PreviousNthOccurrencesReplacedCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ReplacePreviousNthOccurrences(panList, pItem, pNewItem, pnStartingAt)
		This.ReplacePreviousNthOccurrencesCS(panList, pItem, pNewItem, pnStartingAt, pCaseSensitive)

		#< @FunctionFluentForm

		def ReplacePreviousNthOccurrencesQ(panList, pItem, pNewItem, pnStartingAt)
			This.ReplacePreviousNthOccurrences(panList, pItem, pNewItem, pnStartingAt)
			return This

		#>

		#< @FunctionAlternativeForm

		def ReplaceNthPreviousOccurrences(panList, pItem, pNewItem, pnStartingAt)
			This.ReplacePreviousNthOccurrences(panList, pItem, pNewItem, pnStartingAt)

			def ReplaceNthPreviousOccurrencesQ(panList, pItem, pNewItem, pnStartingAt)
				This.ReplaceNthPreviousOccurrences(panList, pItem, pNewItem, pnStartingAt)
				return This
		#>

	def PreviousNthOccurrencesReplaced(panList, pItem, pNewItem, pnStartingAt)

		aResult =  This.
			   ReplacePreviousNthOccurrencesQ(panList, pItem, pNewItem, pnStartingAt).
			   Content()

		return aResult

		def NthPreviousOccurrencesReplaced(panList, pItem, pNewItem, pnStartingAt)
			return This.PreviousNthOccurrencesReplaced(panList, pItem, pNewItem, pnStartingAt)


	  #==============================================#
	 #  REPLACING AN ITEM AT ONE OR MORE POSITIONS  #
	#==============================================#

	def ReplaceAt(n, pOtherItem)
		if isList(n) and Q(n).IsListOfNumbers()
			This.ReplaceItemsAtPositions(n, pOtherItem)

		but isNumber(n)
			This.ReplaceItemAtPosition(n, pOtherItem)

		else
			StzRaise("Incorrect param type! n must be a number or a list of numbers.")
		ok

		def ReplaceAtQ(n, pOtherItem)
			This.ReplaceAt(n, pOtherItem)
			return This

	  #----------------------------------------#
	 #   REPLACING ITEM AT A GIVEN POSITION   #
	#----------------------------------------#

	def ReplaceItemAtPosition(n, pcOtherItem)

		/* Example 1:

			o1 = new stzList([ "ONE", "two" ])
			o1.ReplaceItemAtPosition(2, :With = "TWO")
			? o1.Content	#--> [ "ONE", "TWO" ]

		Example 2:

			o1 = new stzList([ "A", "b", "C" ])
			o1.ReplaceItemAtPosition(2, :With@ = "upper(@item)")
			? o1.Content()	#--> [ "A", "B", "C" ]
		*/

		if NOT Q(n).IsNumberOrString()
			StzRaise("Invalid param type! n must be a number.")
		ok

		nLen = This.NumberOfItems()

		if isString(n)
			if Q(n).IsOneOfThese([
				:First, :FirstPosition, :FirstItem ])
				  
				n = 1

			but Q(n).IsOneOfThese([
				:Last, :LastPosition, :LastItem ])

				n = nLen
			ok
		ok

		if n < 1 or n > nLen
			StzRaise("the Nth position you provided is out of range!")
		ok

		if isList(pcOtherItem) and
		   Q(pcOtherItem).IsWithOrByNamedParam()

			if Q(pcOtherItem[1]).LastChar() = "@" and
		  	   isString(pcOtherItem[2])

				cCode = "pcOtherItem = " + StzCCodeQ(pcOtherItem[2]).Transpiled()
				@item = This.ItemAtPosition(n)	
				@position = n
				@i = n

				eval(cCode)
			else

				pcOtherItem = pcOtherItem[2]
			ok
		ok

		# Doing the job

		This.List()[n] = pcOtherItem

		#< @FunctionFluentForm

		def ReplaceItemAtPositionQ(n, pOtherItem)
			This.ReplaceItemAtPosition(n, pOtherItem)
			return This

		#>

		#< @FunctionAlternativeForm

		def ReplaceAtPosition(n, pOtherItem)
			This.ReplaceItemAtPosition(n, pOtherItem)

			def ReplaceAtPositionQ(n, pOtherItem)
				This.ReplaceAtPosition(n, pOtherItem)
				return This

		def ReplaceItemAt(n, pOtherItem)
			This.ReplaceItemAtPosition(n, pOtherItem)

			def ReplaceItemAtQ(n, pOtherItem)
				This.ReplaceItemAt(n, pOtherItem)
				return This

		def ReplaceNthItem(n, pOtherItem)
			This.ReplaceItemAtPosition(n, pOtherItem)

			def ReplaceNthItemQ(n, pOtherItem)
				This.ReplaceNthItem(n, pOtherItem)
				return This

		#>
	
	def ItemAtPositionNReplaced(n, pOtherItem)
		aResult = This.Copy().ReplaceItemAtPositionQ( n, pOtherItem ).Content()
		return aResult

		def ItemAtPositionNReplacedWith(n, pOtherItem)
			return This.ItemAtPositionNReplaced(n, pOtherItem)

		def NthItemReplacedWith(n, pOtherItem)
			return This.ItemAtPositionNReplacedWith(n, pOtherItem)

			def NthItemReplaced(n, pOtherItem)
				return This.NthItemReplacedWith(n, pOtherItem)

	  #------------------------------#
	 #   REPLACING THE FIRST ITEM   #
	#------------------------------#

	def ReplaceFirstItem(pOtherItem)
		This.ReplaceNthItem(1, pOtherItem)

		def ReplaceFirstItemQ(pOtherItem)
			This.ReplaceFirstItem(pOtherItem)
			return This

	def FirstItemReplaced(pOtherItem)
		aResult = This.Copy().ReplaceFirstItemQ(pOtherItem).Content()
		return aResult

		def FirstItemReplacedWith(pOtherItem)
			return This.FirstItemReplaced(pOtherItem)

	  #-----------------------------#
	 #   REPLACING THE LAST ITEM   #
	#-----------------------------#

	def ReplaceLastItem(pOtherItem)
		This.ReplaceNthItem(This.NumberOfItems(), pOtherItem)

		def ReplaceLastItemQ(pOtherItem)
			This.ReplaceLastItem(pOtherItem)
			return This

	def LastItemReplaced(pOtherItem)
		aResult = This.Copy().ReplaceLastItemQ(pOtherItem).Content()
		return aResult

		def LastItemReplacedWith(pOtherItem)
			return This.LastItemReplaced(pOtherItem)

	  #--------------------------------------------#
	 #   REPLACING ITEMS AT THE GIVEN POSITIONS   #
	#--------------------------------------------#

	def ReplaceItemsAtPositions(panPositions, pOtherItem)

		if NOT ( isList(panPositions) and Q(panPositions).IsListOfNumbers() )
			StzRaise("Incorrect param type! panPositions must be a list of numbers.")
		ok

		nLen = len(panPositions)
		aContent = This.Content()

		if isList(pOtherItem) and
		   Q(pOtherItem).IsWithOrByNamedParam() and
		   Q(pOtherItem[1]).LastChar() = "@"

			cCode = '@cNewItem = ( ' + StzCCodeQ(pOtherItem[2]).Transpiled() + ' )'
			
			for i = 1 to nLen
				@Position = panPositions[i]
				@i = @Position
				@item = aContent[i]

				eval(cCode)
				This.ReplaceItemAtPosition(@Position, @cNewItem)
			next
		else

			for i = 1 to nLen
				This.ReplaceItemAtPosition(panPositions[i], pOtherItem)
			next
		ok
	
		#< @FunctionFluentForm

		def ReplaceItemsAtPositionsQ(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceAtPositions(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)

			def ReplaceAtPositionsQ(panPositions, pOtherItem)
				This.ReplaceAtPositions(panPositions, pOtherItem)
				return This

		def ReplaceManyAt(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)

			def ReplaceManyAtQ(panPositions, pOtherItem)
				This.ReplaceManyAt(panPositions, pOtherItem)
				return This

		def ReplaceManyAtPositions(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)

			def ReplaceManyAtPositionsQ(panPositions, pOtherItem)
				This.ReplaceManyAtPositions(panPositions, pOtherItem)
				return This

		def ReplaceManyItemsAt(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)

			def ReplaceManyItemsAtQ(panPositions, pOtherItem)
				This.ReplaceManyItemsAt(panPositions, pOtherItem)
				return This

		def ReplaceManyItemsAtPositions(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)

			def ReplaceManyItemsAtPositionsQ(panPositions, pOtherItem)
				This.ReplaceManyItemsAtPositions(panPositions, pOtherItem)
				return This

		def ReplaceManyAtThesePositions(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)

			def ReplaceManyAtThesePositionsQ(panPositions, pOtherItem)
				This.ReplaceManyAtThesePositions(panPositions, pOtherItem)
				return This

		def ReplaceManyItemsAtThesePositions(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)

			def ReplaceManyItemsAtThesePositionsQ(panPositions, pOtherItem)
				This.ReplaceManyItemsAtThesePositions(panPositions, pOtherItem)
				return This

		#--

		def ReplaceItemsAtThesePositions(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)
		
			def ReplaceItemsAtThesePositionsQ(panPositions, pOtherItem)
				This.ReplaceItemsAtThesePositions(panPositions, pOtherItem)
				return This

		#--

		def ReplaceAllItemsAtPositions(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)
		
			def ReplaceAllItemsAtPositionsQ(panPositions, pOtherItem)
				This.ReplaceAllItemsAtPositions(panPositions, pOtherItem)
				return This

		#--

		def ReplaceAllItemsAtThesePositions(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)
		
			def ReplaceAllItemsAtThesePositionsQ(panPositions, pOtherItem)
				This.ReplaceAllItemsAtThesePositions(panPositions, pOtherItem)
				return This

		#--

		def ReplaceTheseItemsAtPositions(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)

			def ReplaceTheseItemsAtPositionsQ(panPositions, pOtherItem)
				This.ReplaceTheseItemsAtPositions(panPositions, pOtherItem)
				return This

		#--

		def ReplaceTheseItemsAtThesePositions(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)

			def ReplaceTheseItemsAtThesePositionsQ(panPositions, pOtherItem)
				This.ReplaceTheseItemsAtThesePositions(panPositions, pOtherItem)
				return This

		#--

		def ReplaceAllTheseItemsAtPositions(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)

			def ReplaceAllTheseItemsAtPositionsQ(panPositions, pOtherItem)
				This.ReplaceAllTheseItemsAtPositions(panPositions, pOtherItem)
				return This

		#--

		def ReplaceAllTheseItemsAtThesePositions(panPositions, pOtherItem)
			This.ReplaceItemsAtPositions(panPositions, pOtherItem)

			def ReplaceAllTheseItemsAtThesePositionsQ(panPositions, pOtherItem)
				This.ReplaceAllTheseItemsAtThesePositions(panPositions, pOtherItem)
				return This

		#>

	def ItemsAtThesePositionsRplaced(panPositions, pOtherItem)
		aResult = This.Copy().ReplaceItemsAtPositionsQ(panPositions, pOtherItem).Content()
		return aResult

		def ItemsAtThesePositionsRplacedWith(panPositions, pOtherItem)
			return This.ItemsAtThesePositionsRplaced(panPositions, pOtherItem)

	  #----------------------------------------------------------#
	 #  REPLACING ITEMS AT GIVEN POSITIONS BY MANY OTHER ITEMS  # TODO: Add case sensitivity
	#----------------------------------------------------------#

	def ReplaceOccurrencesByMany(panPositions, paNewItems) # TODO: Add alternatives
		/* EXAMPLE

		o1 = new stzList([ "A", "B", "*", "D", "*",  "=" ])
		o1.ReplaceOccurrencesByMany([ 3, 5, 6 ], ["C", "E", "F"])
		? o1.Content()
		#--> [ "A", "B", "C", "D", "E", "F" ])

		*/

		if CheckParams()

			if NOT (isList(panPositions) and Q(panPositions).IsListOfNumbers())
				StzRaise("Incorrect param type! panPositions must be a list of numbers.")
			ok

			if isList(paNewItems) and Q(paNewItems).IsWithOrByOrUsingNamedParam()
				paNewItems = paNewItems[2]
			ok

		ok

		nMin = Min([ len(panPositions), len(paNewItems), This.NumberOfItems() ])

		for i = 1 to nMin
			This.ReplaceAt(panPositions[i], paNewItems[i])
		next

		#< @FunctionFluentForm

		def ReplaceOccurrencesByManyQ(panPositions, paNewItems)
			This.ReplaceOccurrencesByMany(panPositions, paNewItems)
			return This

		#>

	def OccurrencesReplacedByMany(panPositions, paNewItems)
		aResult = This.Copy().ReplaceOccurrencesByManyQ(panPositions, paNewItems).Content()
		return aResult

	  #----------------------------------------------------------#
	 #  REPLACING ITEMS AT GIVEN POSITIONS BY MANY OTHER ITEMS  # TODO: Add case sensitivity
	#----------------------------------------------------------#

	def ReplaceOccurrencesByManyXT(panPositions, paNewItems) # TODO: Add alternatives

		/* EXAMPLE

		o1 = new stzList([ "A", "B", "*", "*", "*",  "*" ])
		o1.ReplaceOccurrencesByManyXT([ 3, 4, 5, 6 ], [ "#1", "#2" ])
		? @@( o1.Content() )

		*/

		if CheckParams()

			if NOT (isList(panPositions) and Q(panPositions).IsListOfNumbers())
				StzRaise("Incorrect param type! panPositions must be a list of numbers.")
			ok

			if isList(paNewItems) and Q(paNewItems).IsWithOrByOrUsingNamedParam()
				paNewItems = paNewItems[2]
			ok

		ok

		nLenPos = len(panPositions)
		nLenItems = len(paNewItems)

		aNewItems = paNewItems

		if nLenItems < nLenPos

			j = 0

			for i = (nLenItems + 1) to nLenPos

				j++

				if j > nLenItems
					j = 1
				ok

				aNewItems + paNewItems[j]

			next
		ok

		This.ReplaceOccurrencesByMany(panPositions, aNewItems)

		#< @FunctionFluentForm

		def ReplaceOccurrencesByManyXTQ(panPositions, paNewItems)
			This.ReplaceOccurrencesByManyXT(panPositions, paNewItems)
			return This

		#>

	def OccurrencesReplacedByManyXT(panPositions, paNewItems)
		aResult = This.Copy().ReplaceOccurrencesByManyXTQ(panPositions, paNewItems).Content()
		return aResult

	  #---------------------------------------------------#
	 #    REPLACING A SECTION OF ITEMS BY A GIVEN ITEM   #
	#===================================================#

	def ReplaceSection(n1, n2, pNewItem)
		/* EXAMPLE 1

		o1 = new stzList([ "A", "B", "_", "_", "_", "D" ])
		o1.ReplaceSection(3, 5, "C")
		? o1.Content() #--> [ "A", "B", "C", "D" ]

		EXAMPLE 2 (Using :By@)

		o1 = new stzList([ "A", "B", "c", "d", "e", "F" , "G" ])
		
		o1.ReplaceSection(3, 5, :By@ = '{ @EachItemQ.Uppercased() }')
		? o1.Content()
		#--> [ "A", "B", "C", "D", "E", "F", "G" ]

		*/

		# Checking the pcNewSubStr param

		if isList(pNewItem) and Q(pNewItem).IsWithOrByNamedParam()

			if Q(pNewItem[1]).LastChar() = "@"

				pNewItem = eval@( pNewItem[2], :On = This.Section(n1, n2) )

			else
				pNewItem = pNewItem[2]
			ok
		ok

		This.RemoveSectionQ(n1, n2)
		This.InsertBefore(n1, pNewItem)

		def ReplaceSectionQ(n1, n2, pNewItem)
			This.ReplaceSection(n1, n2, pNewItem)
			return This

	def SectionReplaced(n1, n2, pNewItem)
		aResult = This.Copy().ReplaceSectionQ(n1, n2, pNewItem).Content()
		return aResult

		def SectionReplacedWith(n1, n2, pNewItem)
			return This.SectionReplaced(n1, n2, pNewItem)
	
	  #----------------------------------------------#
	 #    REPLACING MANY SECTIONS BY A GIVEN ITEM   #
	#----------------------------------------------#

	def ReplaceManySections(paSections, pNewItem)
		for anSection in paSections
			This.ReplaceSection(anSection, pNewItem)
		next

		def ReplaceManySectionsQ(paSections, pNewItem)
			This.ReplaceManySections(paSections, pNewItem)
			return This
		
	def ManySectionsReplaced(paSections, pNewItem)
		aResult = This.Copy().ReplaceManySectionsQ(paSections, pNewItem).Content()
		return aResult

		def ManySectionsReplacedWith(paSections, pNewItem)
			return This.ManySectionsReplaced(paSections, pNewItem)

	  #------------------------------------------------------#
	 #   REPLACING EACH ITEM IN SECTION BY ONE GIVEN ITEM   #
	#------------------------------------------------------#

	def ReplaceEachItemInSection(n1, n2, pNewItem)
		/* EXAMPLE

		o1 = new stzList([ "A", "B", "_", "_", "_", "D" ])
		o1.ReplaceEachItemInSection(3, 5, "C")
		? o1.Content() #--> [ "A", "B", "C", "C", "C", "D" ]

		*/

		This.ReplaceItemsAtThesePositions(n1 : n2, pNewItem)

		def ReplaceEachItemInSectionQ(n1, n2, pNewItem)
			This.ReplaceEachItemInSection(n1, n2, pNewItem)
			return This

	def EachItemInSectionReplaced(n1, n2, pNewItem)
		acResult = This.Copy().ReplaceEachItemInSectionQ(n1, n2, pNewItem).Content()
		return acResult

		def EachItemInSectionReplacedWith(n1, n2, pNewItem)
			return This.EachItemInSectionReplaced(n1, n2, pNewItem)

		def EachItemReplacedInSection(n1, n2, pNewItem)
			return This.EachItemInSectionReplaced(n1, n2, pNewItem)

		def EachItemReplacedInSectionWith(n1, n2, pNewItem)
			return This.EachItemReplacedInSection(n1, n2, pNewItem)
	
	  #----------------------------------------------------------#
	 #   REPLACING EACH ITEM IN MANY SECTIONS BY A GIVEN ITEM   #
	#----------------------------------------------------------#

	def ReplaceEachItemInManySections(paSections, pNewItem)
		for anSection in paSections
			n1 = anSection[1]
			n2 = anSection[2]
			This.ReplaceEachItemInSection(n1, n2, pNewItem)
		next

		def ReplaceEachItemInManySectionsQ(paSections, pNewItem)
			This.ReplaceEachItemInManySections(paSections, pNewItem)
			return This

	def EachItemInManySectionsReplaced(paSections, pNewItem)

		acResult = This.Copy().
				ReplaceEachItemInManySectionsQ(paSections, pNewItem).
				Content()

		return acResult

	   #-----------------------------------------------#
	  #   REPLACING A SECTION OF ITEMS IN THE LIST    #
	 #   BY MANY ITEMS ONE BY ONE    	         #
	#-----------------------------------------------#

	def ReplaceSectionByMany(n1, n2, paOtherListOfItems)
		/* EXAMPLE

		o1 = new stzList([ "A", "B", "_", "_", "_", "F" ])
		o1.ReplaceSectionByMany(3, 5, [ "C", "D", "F" ])
		? o1.Content() #--> [ "A", "B", "C", "D", "E", "F" ]

		*/
		i = 0

		for n = n1 to n2
			i++
			if i <= len(paOtherListOfItems)
				item = paOtherListOfItems[i]
			else
				item = NULL
			ok

			This.ReplaceItemAtPosition(n, item)
		next

		def ReplaceSectionByManyQ(n1, n2, paOtherListOfItems)
			This.ReplaceSectionByMany(n1, n2, paOtherListOfItems)
			return This

	def SectionReplacedByMany(n1, n2, paOtherListOfItems)
		aResult = This.ReplaceSectionByManyQ(n1, n2, paOtherListOfItems).Content()
		return aResult

	   #---------------------------------------------------#
	  #   REPLACING MANY SECTIONS OF ITEMS IN THE LIST    #
	 #   BY MANY ITEMS ONE BY ONE                        #
	#---------------------------------------------------#

	def ReplaceManySectionsByMany(paSections, paOtherListOfItems)
		for anSection in paSections
			n1 = paSections[1]
			n2 = paSections[2]
			This.ReplaceSectionByMany(n1, n2, paOtherListOfItems)
		next

		def ReplaceManySectionsByManyQ(paSections, paOtherListOfItems)
			This.ReplaceManySectionsByMany(paSections, paOtherListOfItems)
			return This

	def ManySectionsReplacedByMany(paSections, paOtherListOfStr)
		acResult = This.Copy().
				ReplaceManySectionsByManyQ(paSections, paOtherListOfItems).
				Content()

		return acResult

	  #--------------------------------------------#
	 #   REPLACING A RANGE OF ITEMS IN THE LIST   #
	#--------------------------------------------#

	def ReplaceRange(n, nRange, pNewItem)

		anSection = RangeToSection([ n, nRange ])
		n1 = anSection[1]
		n2 = anSection[2]

		This.ReplaceSection(n1, n2, pNewItem)

		def ReplaceRangeQ(n, nRange, pNewItem)
			This.ReplaceRange(n, nRange, pNewItem)
			return This

	def RangeReplaced(n, nRange, pNewItem)
		acResult = This.Copy().ReplaceRangeQ(n, nRange, pNewItem).Content()
		return acResult

	  #------------------------------------------------#
	 #   REPLACING MANY RANGES OF ITEMS IN THE LIST   #
	#------------------------------------------------#

	def ReplaceRanges(panRanges, pNewItem)
		for anRange in panRanges
			n = anRange[1]
			nRange = anRange[2]
			This.ReplaceRange(n, nRange, pNewItem)
		next

		def ReplaceRangesQ(panRanges, pNewItem)
			This.ReplaceManyRanges(panRanges, pNewItem)
			return This

		def ReplaceManyRanges(panRanges, pNewItem)
			This.ReplaceRanges(panRanges, pNewItem)

			def ReplaceManyRangesQ(panRanges, pNewItem)
				This.ReplaceManyRanges(panRanges, pNewItem)
				return This

	def RangesReplaced(panRanges, pNewItem)
		acResult = This.Copy().ReplaceManyRangesQ(panRanges, pNewItem).Content()
		return acResult

		def ManyRangesReplaced(panRanges, pNewItem)
			return This.RangesReplaced(panRanges, pNewItem)

	  #-----------------------------------------------------------#		
	 #   REPLACING EACH ITEM IN A RANGE BY THE SAME GIVEN ITEM   #
	#-----------------------------------------------------------#

	def ReplaceEachItemInRange(n, nRange, pNewItem)

		anSection = RangeToSection([ n, nRange ])
		anPositions = ring_sort( StzListOfPairsQ(anSection).ExpandedIfPairsOfNumbers() )

		This.ReplaceItemsAtThesePositions(anPositions, pNewItem)

		def ReplaceEachItemInRangeQ(n, nRange, pNewItem)
			This.ReplaceEachItemInRange(n, nRange, pNewItem)
			return This

	def EachItemInRangeReplaced(n, nRange, pNewItem)

		acResult = This.Copy().ReplaceEachItemInRangeQ(n, nRange, pNewItem).Content()
		return acResult

		def EachItemReplacedInRange(n, nRange, pNewItem)
			return This.EachItemInRangeReplaced(n, nRange, pNewItem)
		
	  #---------------------------------------------------------------#		
	 #   REPLACING EACH ITEM IN MANY RANGES BY THE SAME GIVEN ITEM   #
	#---------------------------------------------------------------#

	def ReplaceEachItemInManyRanges(panRanges, pNewItem)

		for anRange in panRanges
			anSection = RangeToSection(anRange)
			n1 = anSection[1]
			n2 = anSection[2]
			This.ReplaceEachItemInSection(n1, n2, pNewItem)
		next

		def ReplaceEachItemInManyRangesQ(panRanges, pNewItem)
			This.ReplaceEachItemInManyRanges(panRanges, pNewItem)
			return This

	def EachItemInManyRangesReplaced(panRanges, pNewItem)

		acResult =  This.Copy().
				ReplaceEachItemInManyRangesQ(panRanges, pNewItem).
				Content()

		return acResult

		def EachItemReplacedInManyRanges(panRanges, pNewItem)
			return This.EachItemInManyRangesReplaced(panRanges, pNewItem)
	
	   #--------------------------------------------#
	  #   REPLACING A RANGE OF ITEMS IN THE LIST   #
	 #   WITH MANY ITEMS ONE BY ONE               #
	#--------------------------------------------#

	def ReplaceRangeByMany(n, nRange, paOtherListOfItems)

		anSection = RangeToSection([ n, nRange ])
		n1 = anSection[1]
		n2 = anSection[2]

		i = 0
		for n = n1 to n2
			i++
			if i <= len(paOtherListOfItems)
				item = paOtherListOfItems[i]
			else
				item = NULL
			ok

			This.ReplaceItemAtPosition(n, item)
		next

		def ReplaceRangeByManyQ(n, nRange, paOtherListOfItems)
			This.ReplaceRangeByMany(n, nRange, paOtherListOfItems)
			return This

	def RangeReplacedByMany(n, nRange, paOtherListOfItems)
		aResult = This.ReplaceRangeByManyQ(n, nRange, paOtherListOfItems).Content()
		return aResult

	   #------------------------------------------------#
	  #   REPLACING MANY RANGES OF ITEMS IN THE LIST   #
	 #   WITH MANY ITEMS ONE BY ONE                   #
	#------------------------------------------------#

	def ReplaceManyRangesByMany(panRanges, paOtherListOfItems)
		for anRange in panRanges
			anSection = RangeToSection(anRange)
			n1 = anSections[1]
			n2 = anSections[2]
			This.ReplaceRangeByMany(n, nRange, paOtherListOfItems)
		next

		def ReplaceManyRangesByManyQ(panRanges, paOtherListOfItems)
			This.ReplaceManyRangesByMany(panRanges, paOtherListOfItems)
			return This

	def RangesReplacedByMany(panRanges, paOtherListOfItems)
		
		acResult = This.Copy().
				ReplaceManyRangesByManyQ(panRanges, paOtherListOfItems).
				Content()

		return acResult

	  #-----------------------------------------------------------#
	 #   REPLACING ALL ITEMS IN THE LIST WITH A GIVEN NEW ITEM   #
	#-----------------------------------------------------------#

	def ReplaceAllItemsWith(pOtherItem)
		aResult = []
		for i = 1 to This.NumberOfItems()
			aResult + pOtherItem
		next

		This.Update( aResult )

		#< @FunctionFluentForm

		def ReplaceAllItemsWithQ(pOtherItem)
			This.ReplaceAllItemsWith(pOtherItem)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceAllWith(pOtherItem)
			This.ReplaceAllItemsWith(pOtherItem)

			def ReplaceAllWithQ(pOtherItem)
				This.ReplaceAll(pOtherItem)
				return This

		def ReplaceWith(pOtherItem)
			This.ReplaceAllItemsWith(pOtherItem)

			def ReplaceWithQ(pOtherItem)
				This.ReplaceWith(pOtherItem)
				return This

		#>

	def AllItemsReplacedWith(pOtherItem)
		aResult = This.Copy().ReplaceAllItemsWith(pOtherItem)
		return aResult

	  #----------------------------------------------#
	 #   REPLACING ITEMS UNDER A GIVEN CONDITION    #
	#----------------------------------------------#

	def ReplaceItemsW(pCondition, pOtherItem)

		anPositions = This.FindItemsW(pCondition)
		This.ReplaceItemsAtPositions(anPositions, pOtherItem)

		#< @FunctionFluentForm

		def ReplaceItemsWQ(pCondition, pOtherItem)
			This.ReplaceItemsW(pCondition, pOtherItem)
			return This

		#>

		#< @FunctionAlternativeForm

		def ReplaceW(pCondition, pOtherItem)
			This.ReplaceItemsW(pCondition, pOtherItem)

			def ReplaceWQ(pCondition, pOtherItem)
				This.ReplaceW(pCondition, pOtherItem)
				return This

		#>

	def ItemsReplacedW(pCondition, pOtherItem)
		aResult = This.Copy().ReplaceItemsW(pCondition, pOtherItem)
		return aResult

	  #----------------------------------#
	 #  REPLACING AN ITEM AT ANY LEVEL  #
	#----------------------------------#

	// Replaces an item at any nested level of the list by a new value
	def DeepReplaceCS(pItem, pByValue, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzList([
			"me",
			"other",
			[ "other", "me", [ "me" ], "other" ],
			"other"
		])
		
		o1.DeepReplace("me", :By = "you")
		? o1.Content()
		#--> [
		#	"you",
		#	"other",
		#	[ "other", "me", [ "you" ], "other" ],
		#	"other"
		#    ]
		
		*/

		if isList(pByValue) and Q(pByValue).IsByOrWithNamedParam()
			pByValue = pByValue[2]
		ok

		cValue = @@(pItem)
		cByValue = @@(pByValue)

		cCode = This.ToCodeQ().ReplaceCSQ( cValue, cByValue, pCaseSensitive ).Content()
		cCode = ' aResult = ' + cCode

		eval(cCode)
		This.Update( aResult )

		def DeepReplaceCSQ(pItem, pByValue, pCaseSensitive)
			This.DeepReplaceCS(pItem, pByValue, pCaseSensitive)
			return This

	#-- WITHOUT CASESENSITIVITY

	def DeepReplace(pItem, pByValue)
		This.DeepReplaceCS(pItem, pByValue, :CaseSensitive = TRUE)

		def DeepReplaceQ(pItem, pByValue)
			This.DeepReplace(pItem, pByValue)
			return This

	  #=========================================================#
	 #   REMOVING ALL OCCURRENCE OF A GIVEN ITEM IN THE LIST   #
	#=========================================================#

	def RemoveAllCS(pItem, pCaseSensitive)
		if CheckParams()
			if isList(pItem) and Q(pItem).IsOfNamedParam()
				pItem = pItem[2]
			ok
		ok

		anPositions = This.FindAllCS(pItem, pCaseSensitive)
		nLenPos = len(anPositions)

		for i = nLenPos to 1 step -1
			This.RemoveItemAtPosition(anPositions[i])
		next

		#< @FunctionFluentForm

		def RemoveAllCSQ(pItem, pCaseSensitive)
			This.RemoveAllCS(pItem, pCaseSensitive)
			return This
	
		#>

		#< @FunctionAlternativeForms

		def RemoveAllOccurrencesCS(pItem, pCaseSensitive)
			This.RemoveAllCS(pItem, pCaseSensitive)

			def RemoveAllOccurrencesCSQ(pItem, pCaseSensitive)
				This.RemoveAllOccurrencesCS(pItem, pCaseSensitive)
				return This

		def RemoveCS(pItem, pCaseSensitive)
			This.RemoveAllCS(pItem, pCaseSensitive)

			def RemoveCSQ(pItem, pCaseSensitive)
				This.RemoveCS(pItem, pCaseSensitive)
				return This

		def RemoveItemCS(pItem, pCaseSensitive)
			This.RemoveAllCS(pItem, pCaseSensitive)

			def RemoveItemCSQ(pItem, pCaseSensitive)
				This.RemoveItemCS(pItem, pCaseSensitive)
				return This

		#>

	def AllOccurrencesOfThisItemRemovedCS(pItem, pCaseSensitive)
		aResult = This.Copy().RemoveAllOccurrencesCSQ(pItem, pCaseSensitive).Content()
		return aResult

		def AllOccurrencesRemovedCS(pItem, pCaseSensitive)
			return This.AllOccurrencesOfThisItemRemovedCS(pItem, pCaseSensitive)

		def ItemRemovedCS(pItem, pCaseSensitive)
			return This.AllOccurrencesOfThisItemRemovedCS(pItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RemoveAll(pItem)
		This.RemoveAllCS(pItem, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RemoveAllQ(pItem)
			This.RemoveAll(pItem)
			return This
	
		#>

		#< @FunctionAlternativeForms

		def RemoveAllOccurrences(pItem)
			This.RemoveAll(pItem)

			def RemoveAllOccurrencesQ(pItem)
				This.RemoveAllOccurrences(pItem)
				return This

		def Remove(pItem)
			if isList(pItem) and Q(pItem).IsEachNamedParam()
				pItem = pItem[2]
			ok

			This.RemoveAll(pItem)

			def RemoveQ(pItem)
				This.Remove(pItem)
				return This

		def RemoveItem(pItem)
			This.RemoveAll(pItem)

			def RemoveItemQ(pItem)
				This.RemoveItem(pItem)
				return This

	def AllOccurrencesOfThisItemRemoved(pItem)
		aResult = This.Copy().RemoveAllOccurrencesQ(pItem).Content()
		return aResult

		def AllOccurrencesRemoved(pItem)
			return This.AllOccurrencesOfThisItemRemoved(pItem)

		def ItemRemoved(pItem)
			return This.AllOccurrencesOfThisItemRemoved(pItem)

	  #-------------------------------------------------------#
	 #   REMOVING GIVEN OCCURRENCES OF AN ITEM IN THE LIST   # TODO: Add CASESENSITIVITY
	#-------------------------------------------------------#

	def RemoveOccurrences(panOccurrences, pItem)
		for n in panOccurrences
			This.RemoveNthOccurrence(n, pItem)
		next

		#< @FunctionFluentForm

		def RemoveOccurrencesQ(panOccurrences, pItem)
			This.RemoveOccurrences(panOccurrences, pItem)
			return This

		#>

		#< @FunctionAlternativeForm

		def RemoveManyOccurrences(paOccurrences, pItem)
			This.RemoveOccurrences(panOccurrences, pItem)

			def RemoveManyOccurrencesQ(paOccurrences, pItem)
				This.RemoveManyOccurrences(paOccurrences, pItem)
				return This

		def RemoveTheseOccurrences(panOccurrences, pItem)
			This.RemoveOccurrences(panOccurrences, pItem)

			def RemoveTheseOccurrencesQ(panOccurrences, pItem)
				This.RemoveTheseOccurrences(panOccurrences, pItem)
				return This

		#>

	def OccurrencesRemoved(panOccurrences, pItem)
		aResult = This.Copy.RemoveOccurrencesQ(panOccurrences, pItem).Content()
		return aResult

		def TheseOccurrencesRemoved(panOccurrences, pItem)
			return This.OccurrencesRemoved(panOccurrences, pItem)

		def TheseOccurrencesOfThisItemRemoved(panOccurrences, pItem)
			return This.OccurrencesRemoved(panOccurrences, pItem)

		def ManyOccurrencesOfThisItemRemoved(panOccurrences, pItem)
			return This.OccurrencesRemoved(panOccurrences, pItem)

		def ManyOccurrencesRemoved(panOccurrences, pItem)
			return This.OccurrencesRemoved(panOccurrences, pItem)

	  #------------------------------------------#
	 #   REMOVING MANY ITEMS AT THE SAME TIME   #
	#------------------------------------------#

	def RemoveManyCS(paItems, pCaseSensitive)
		if CheckParams()
			if NOT isList(paItems)
				StzRaise("Incorrect param type! paItems must be a list.")
			ok
		ok

		nLen = len(paItems)

		for i = 1 to nLen
			This.RemoveAllCS(paItems[i], pCaseSensitive)
		next

		#< @FunctionFluentForm

		def RemoveManyCSQ(pacItems, pCaseSensitive)
			This.RemoveManyCS(pacItems, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForms

		def RemoveAllOfTheseCS(pacItems, pCaseSensitive)
			This.RemoveManyCS(pacItems, pCaseSensitive)

			def RemoveAllOfTheseCSQ(pacItems, pCaseSensitive)
				This.RemoveAllOfTheseCS(pacItems, pCaseSensitive)
				return This

		def RemoveTheseCS(pacItems, pCaseSensitive)
			This.RemoveManyCS(pacItems, pCaseSensitive)

			def RemoveTheseCSQ(pacItems, pCaseSensitive)
				This.RemoveTheseCS(pacItems, pCaseSensitive)
				return This

		def RemoveTheseItemsCS(pacItems, pCaseSensitive)
			This.RemoveManyCS(pacItems, pCaseSensitive)

			def RemoveTheseItemsCSQ(pacItems, pCaseSensitive)
				This.RemoveTheseItemsCS(pacItems, pCaseSensitive)
				return This

		#>

	def TheseItemsRemovedCS(pacItems, pCaseSensitive)

		aResult =  This.Copy().
				RemoveTheseItemsCSQ(pacItems, pCaseSensitive).
				Content()

		return aResult

		#< @FunctionAlternativeForms

		def AllOfTheseItemsRemovedCS(pacItems, pCaseSensitive)
			return This.TheseItemsRemovedCS(pacItems, pCaseSensitive)

		def ManyItemsRemovedCS(pacItems, pCaseSensitive)
			return This.TheseItemsRemovedCS(pacItems, pCaseSensitive)

		def ManyRemovedCS(pacItems, pCaseSensitive)
			return This.TheseItemsRemovedCS(pacItems, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def RemoveMany(pacItems)
		This.RemoveManyCS(pacItems, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def RemoveAllOfThese(pacItems)
			This.RemoveMany(pacItems)

			def RemoveAllOfTheseQ(pacItems)
				This.RemoveAllOfThese(pacItems)
				return This

		def RemoveThese(pacItems)
			This.RemoveMany(pacItems)

			def RemoveTheseQ(pacItems)
				This.RemoveThese(pacItems)
				return This

		def RemoveTheseItems(pacItems)
			This.RemoveMany(pacItems)

			def RemoveTheseItemsQ(pacItems)
				This.RemoveTheseItems(pacItems)
				return This

		#>

	def TheseItemsRemoved(pacItems)

		aResult =  This.Copy().
				RemoveTheseItemsQ(pacItems).
				Content()

		return aResult

		#< @FunctionAlternativeForms

		def AllOfTheseItemsRemoved(pacItems)
			return This.TheseItemsRemoved(pacItems)

		def ManyItemsRemoved(pacItems)
			return This.TheseItemsRemoved(pacItems)

		def ManyRemoved(pacItems)
			return This.TheseItemsRemoved(pacItems)

		#>

	  #--------------------------------------------#
	 #  REMOVING ITEMS OTHER THAN THOSE PROVIDED  #
	#--------------------------------------------#

	def RemoveItemsOtherThanCS(paItems, pCaseSensitive)
		anPos = This.FindItemsOtherThanCS(paItems, pCaseSensitive)
		This.RemoveItemsAtPositions(anPos)

		#< @FunctionAlternativeForms

		def RemoveItemsOtherThanTheseCS(paItems, pCaseSensitive)
			return This.RemoveItemsOtherThanCS(paItems, pCaseSensitive)

		#--

		def RemoveItemsExceptCS(paItems, pCaseSensitive)
			return This. RemoveItemsOtherThanCS(paItems, pCaseSensitive)

		def RemoveItemsExceptTheseCS(paItems, pCaseSensitive)
			return This.RemoveItemsOtherThanCS(paItems, pCaseSensitive)

		#--

		def RemoveAllExceptCS(paItems, pCaseSensitive)
			return This.RemoveItemsOtherThanCS(paItems, pCaseSensitive)

		def RemoveAllExceptTheseCS(paItems, pCaseSensitive)
			return This.RemoveItemsOtherThanCS(paItems, pCaseSensitive)

		def RemoveAllButCS(paItems, pCaseSensitive)
			return This.RemoveItemsOtherThanCS(paItems, pCaseSensitive)

		#>

	def ItemsOtherThanTheseRemovedCS(paItems, pCaseSensitive)
		aResult = Q( This.Copy().RemoveItemsOtherThanCS(paItems, pCaseSensitive) ).Content()
		return aResult

		def ItemsRemovedExceptCS(paItems, pCaseSensitive)
			return This.ItemsOtherThanTheseRemovedCS(paItems, pCaseSensitive)

		def AllRemovedButCS(paItems, pCaseSensitive)
			return This.ItemsOtherThanTheseRemovedCS(paItems, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RemoveItemsOtherThan(paItems)
		return This.RemoveItemsOtherThanCS(paItems, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def RemoveItemsOtherThanThese(paItems)
			return This.RemoveItemsOtherThan(paItems)

		#--

		def RemoveItemsExcept(paItems)
			return This.RemoveItemsOtherThan(paItems)

		def RemoveItemsExceptThese(paItems)
			return This.RemoveItemsOtherThan(paItems)

		#--

		def RemoveAllExcept(paItems)
			return This.RemoveItemsOtherThan(paItems)

		def RemoveAllExceptThese(paItems)
			return This. RemoveItemsOtherThan(paItems)

		def RemoveAllBut(paItems)
			return This.RemoveItemsOtherThan(paItems)

		#>

	def ItemsOtherThanTheseRemoved(paItems)
		aResult = Q( This.Copy().RemoveItemsOtherThan(paItems) ).Content()
		return aResult

		def ItemsRemovedExcept(paItems)
			return This.ItemsOtherThanTheseRemoved(paItems)

		def AllRemovedBut(paItems)
			return This.ItemsOtherThanTheseRemoved(paItems)

	  #-------------------------------------------------#
	 #   REMOVING THE NTH OCCURRENCE OF A GIVEN ITEM   #
	#-------------------------------------------------#

	def RemoveNthOccurrenceCS(n, pItem, pCaseSensitive)
		n = This.FindNthOccurrenceCS(n, pItem, pCaseSensitive)
		This.RemoveItemAtPosition( n )

		#< @FunctionFluentForm

		def RemoveNthOccurrenceCSQ(n, pItem, pCaseSensitive)
			This.RemoveNthOccurrenceCS(n, pItem, pCaseSensitive)
			return This
	
		#>

		#< @FunctionAlternativeForms

		def RemoveNthCS(n, pItem, pCaseSensitive)
			This.RemoveNthOccurrenceCS(n, pItem, pCaseSensitive)

			def RemoveNthCSQ(n, pItem, pCaseSensitive)
				This.RemoveNthCS(n, pItem, pCaseSensitive)
				return This

		def RemoveOccurrenceCS(n, pItem, pCaseSensitive)
			This.RemoveNthOccurrenceCS(n, pItem, pCaseSensitive)

			def RemoveOccurrenceCSQ(n, pItem, pCaseSensitive)
				This.RemoveOccurrenceCS(n, pItem, pCaseSensitive)
				return This

		#>

	def NthOccurrenceRemovedCS(n, pItem, pCaseSensitive)
		aResult = This.Copy().RemoveNthOccurrencesCSQ(n, pItem, pCaseSensitive).Content()
		return aResult

		def NthRemovedCS(n, pItem, pCaseSensitive)
			return This.NthOccurrenceRemovedCS(n, pItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RemoveNthOccurrence(n, pItem)
		This.RemoveNthOccurrenceCS(n, pItem, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RemoveNthOccurrenceQ(n, pItem)
			This.RemoveNthOccurrence(n, pItem)
			return This
	
		#>

		#< @FunctionAlternativeForms

		def RemoveNth(n, pItem)
			This.RemoveNthOccurrence(n, pItem)

			def RemoveNthQ(n, pItem)
				This.RemoveNth(n, pItem)
				return This

		def RemoveOccurrence(n, pItem)
			This.RemoveNth(n, pItem)

			def RemoveOccurrenceQ(n, pItem)
				This.RemoveOccurrence(n, pItem)
				return This
		#>

	def NthOccurrenceRemoved(n, pItem)
		aResult = This.Copy().RemoveNthOccurrencesQ(n, pItem).Content()
		return aResult

		def NthRemoved(n, pItem)
			return This.NthOccurrenceRemoved(n, pItem)

	  #----------------------------------------------#
	 #   REMOVING THE FIRST OCCURRENCE OF AN ITEM   #
	#----------------------------------------------#

	def RemoveFirstOccurrenceCS(pItem, pCaseSensitive)

		This.RemoveItemAtPosition( This.FindFirstOccurrenceCS(pItem, pCaseSensitive) )


		#< @FunctionFluentForm

		def RemoveFirstOccurrenceCSQ(pItem, pCaseSensitive)
			This.RemoveFirstOccurrenceCS(pItem, pCaseSensitive)
			return This
	
		#>

		#< @FunctionAlternativeForm

		def RemoveFirstCS(pItem, pCaseSensitive)
			This.RemoveFirstOccurrenceCS(pItem, pCaseSensitive)

			def RemoveFirstCSQ(pItem, pCaseSensitive)
				This.RemoveFirstCS(pItem, pCaseSensitive)
				return This

		#>

	def FirstOccurrenceRemovedCS(pItem, pCaseSensitive)
		aResult = This.Copy().RemoveFirstOccurrenceCSQ(pItem, pCaseSensitive).Content()
		return aResult

		def FirstRemovedCS(pItem, pCaseSensitive)
			return This.FirstOccurrenceRemovedCS(pItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RemoveFirstOccurrence(pItem)
		This.RemoveFirstOccurrenceCS(pItem, :CaseSensitive = TRUE)


		#< @FunctionFluentForm

		def RemoveFirstOccurrenceQ(pItem)
			This.RemoveFirstOccurrence(pItem)
			return This
	
		#>

		#< @FunctionAlternativeForm

		def RemoveFirst(pItem)
			This.RemoveFirstOccurrence(pItem)

			def RemoveFirstQ(pItem)
				This.RemoveFirst(pItem)
				return This

		#>

	def FirstOccurrenceRemoved(pItem)
		aResult = This.Copy().RemoveFirstOccurrenceQ(pItem).Content()
		return aResult

		def FirstRemoved(pItem)
			return This.FirstOccurrenceRemoved(pItem)

	  #--------------------------------------------------#
	 #   REMOVING THE LAST OCCURRENCE OF A GIVEN ITEM   #
	#--------------------------------------------------#

	def RemoveLastOccurrenceCS(pItem, pCaseSensitive)
		n = This.FindLastOccurrenceCS(pItem, pCaseSensitive)

		if n <= This.NumberOfItems()
			This.RemoveItemAtPosition( n )
		ok

		#< @FunctionFluentForm

		def RemoveLastOccurrenceCSQ(pItem, pCaseSensitive)
			This.RemoveLastOccurrenceCS(pItem, pCaseSensitive)
			return This
	
		#>

		#< @FunctionAlternativeForm

		def RemoveLastCS(pItem, pCaseSensitive)
			This.RemoveLastOccurrenceCS(pItem, pCaseSensitive)

			def RemoveLastCSQ(pItem, pCaseSensitive)
				This.RemoveLastCS(pItem, pCaseSensitive)
				return This

		#>

	def LastOccurrenceRemovedCS(pItem, pCaseSensitive)
		aResult = This.Copy().RemoveLastOccurrenceCSQ(pItem, pCaseSensitive).Content()
		return aResult

		def LastRemovedCS(pItem, pCaseSensitive)
			return This.LastOccurrenceRemovedCS(pItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RemoveLastOccurrence(pItem)
		n = This.FindLastOccurrence(pItem)

		if n <= This.NumberOfItems()
			This.RemoveItemAtPosition( n )
		ok

		#< @FunctionFluentForm

		def RemoveLastOccurrenceQ(pItem)
			This.RemoveLastOccurrence(pItem)
			return This
	
		#>

		#< @FunctionAlternativeForm

		def RemoveLast(pItem)
			This.RemoveLastOccurrence(pItem)

			def RemoveLastQ(pItem)
				This.RemoveLast(pItem)
				return This

		#>

	def LastOccurrenceRemoved(pItem)
		aResult = This.Copy().RemoveLastOccurrenceQ(pItem).Content()
		return aResult

		def LastRemoved(pItem)
			return This.LastOccurrenceRemoved(pItem)

	   #----------------------------------------------#
	  #   REMOVING NEXT NTH OCCURRENCE OF AN ITEM    #
	 #   STARTING AT A GIVEN POSITION IN THE LIST   #
	#----------------------------------------------#

	def RemoveNextNthOccurrenceCS(n, pItem, pnStartingAt, pCaseSensitive)
		if isList(pItem) and StzListQ(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pnStartingAt) and Q(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if Q(pnStartingAt).IsOneOfTheseCS([
				:First, :FirstPosition, :FirstItem, :FirstItem ], :CS = FALSE)

				pnStartingAt = 1
			
			but Q(pnStartingAt).IsOneOfTheseCS([
				:Last, :LastPosition, :LastItem, :LastItem ], :CS = FALSE)

				pnStartingAt = This.NumberOfItems()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			StzRaise("Incorrect param! pnStartingAt must be a number.")
		ok

		oSection   = This.SectionQ(pnStartingAt, :LastItem)
		anPos = oSection.FindAllCS(pItem, pCaseSensitive)

		if len(anPos) > 0
			anPos = StzListOfNumbersQ(anPos).AddToEachQ(pnStartingAt - 1).Content()
			nPos = anPos[n]
	
			This.RemoveItemAtPosition(nPos)
		ok

		#< @FuntionFluentForm

		def RemoveNextNthOccurrenceCSQ(n, pItem, pnStartingAt, pCaseSensitive)
			This.RemoveNextNthOccurrenceCS(n, pItem, pnStartingAt, pCaseSensitive)
			return This

		#<

		#< @FunctionAlternativeForm

		def RemoveNthNextOccurrenceCS(n, pItem, pnStartingAt, pCaseSensitive)
			This.RemoveNextNthOccurrenceCS(n, pItem, pnStartingAt, pCaseSensitive)

			def RemoveNthNextOccurrenceCSQ(n, pItem, pnStartingAt, pCaseSensitive)
				This.RemoveNthNextOccurrenceCS(n, pItem, pnStartingAt, pCaseSensitive)
				return This

		#>

	def NthNextOccurrenceRemovedCS(n, pItem, pnStartingAt, pCaseSensitive)

		aResult  = This.Copy().
				RemoveNthNextOccurrenceCSQ(n, pItem, pnStartingAt, pCaseSensitive).
				Content()

		return aResult

		def NextNthOccurrenceRemovedCS(n, pItem, pnStartingAt, pCaseSensitive)
			return This.NthNextOccurrenceRemovedCS(n, pItem, pnStartingAt, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RemoveNextNthOccurrence(n, pItem, pnStartingAt)
		This.RemoveNextNthOccurrenceCS(n, pItem, pnStartingAt, :CaseSensitive = TRUE)

		#< @FuntionFluentForm

		def RemoveNextNthOccurrenceQ(n, pItem, pnStartingAt)
			This.RemoveNextNthOccurrence(n, pItem, pnStartingAt)
			return This

		#<

		#< @FunctionAlternativeForm

		def RemoveNthNextOccurrence(n, pItem, pnStartingAt)
			This.RemoveNextNthOccurrence(n, pItem, pnStartingAt)

			def RemoveNthNextOccurrenceQ(n, pItem, pnStartingAt)
				This.RemoveNthNextOccurrence(n, pItem, pnStartingAt)
				return This

		#>

	def NthNextOccurrenceRemoved(n, pItem, pnStartingAt)

		aResult  = This.Copy().
				RemoveNthNextOccurrenceQ(n, pItem, pnStartingAt).
				Content()

		return aResult

		def NextNthOccurrenceRemoved(n, pItem, pnStartingAt)
			return This.NthNextOccurrenceRemoved(n, pItem, pnStartingAt)

	   #-----------------------------------------------#
	  #   REMOVING NEXT OCCURRENCE OF AN ITEM         #
	 #   STARTING AT A GIVEN POSITION IN THE LIST    #
	#-----------------------------------------------#

	def RemoveNextOccurrenceCS(pItem, pnStartingAt, pCaseSensitive)
		This.RemoveNextNthOccurrenceCS(1, pItem, pnStartingAt, pCaseSensitive)

		def RemoveNextOccurrenceCSQ(pItem, pnStartingAt, pCaseSensitive)
			This.RemoveNextOccurrenceCS(pItem, pnStartingAt, pCaseSensitiy)
			return This

		def RemoveNextCS(pItem, pnStartingAt, pCaseSensitive)
			This.RemoveNextOccurrenceCS(pItem, pnStartingAt, pCaseSensitive)

			def RemoveNextCSQ(pItem, pnStartingAt, pCaseSensitive)
				This.RemoveNextCS(pItem, pnStartingAt, pCaseSensitive)
				return This

	def NextOccurrenceRemovedCS(pItem, pnStartingAt, pCaseSensitive)
		aResult =  This.Copy().
				RemoveNextOccurrenceCSQ(pItem, pnStartingAt, pCaseSensitive).
				Content()
		return aResult

		def NextRemovedCS(pItem, pnStartingAt, pCaseSensitive)
			return This.NextOccurrenceRemovedCS(pItem, pnStartingAt, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RemoveNextOccurrence(pItem, pnStartingAt)
		This.RemoveNextNthOccurrence(1, pItem, pnStartingAt)

		def RemoveNextOccurrenceQ(pItem, pnStartingAt)
			This.RemoveNextOccurrence(pItem, pnStartingAt)
			return This

		def RemoveNext(pItem, pnStartingAt)
			This.RemoveNextOccurrence(pItem, pnStartingAt)

			def RemoveNextQ(pItem, pnStartingAt)
				This.RemoveNext(pItem, pnStartingAt)
				return This

	def NextOccurrenceRemoved(pItem, pnStartingAt)
		aRersult =  This.Copy().
				RemoveNextOccurrenceQ(pItem, pnStartingAt).
				Content()
		return aRersult

		def NextRemoved(pItem, pnStartingAt)
			return This.NextOccurrenceRemoved(pItem, pnStartingAt)

	   #----------------------------------------------------#
	  #   REMOVING MANY NEXT NTH OCCURRENCES OF AN ITEM    #
	 #   STARTING AT A GIVEN POSITION IN THE LIST         #
	#----------------------------------------------------#

	def RemoveNextNthOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)
		/* Example

		StzListQ([ "A" , "B", "A", "C", "A", "D", "A" ]) {
			RemoveNexNthOccurrences([2, 3], :of = "A", :StartingAt = 3)
			? Content() # !--> [ "A" , "B", "A", "C", "D" ]
		}		

		*/

		if NOT (isList(panList) and StzListQ(panList).IsListOfNumbers() and
		        StzListQ(panList).NumberOfItemsW("StzNumberQ(@item).IsBetween(1, " + This.NumberOfItems() + ")") = len(panList) )

			StzRaise("Incorrect param! panList must be a list of numbers between 1 and This.NumberOfItems().")
		ok

		if isList(pItem) and StzListQ(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if Q(pnStartingAt).IsOneOfTheseCS([
				:First, :FirstPosition, :FirstItem, :FirstItem ], :CS = FALSE)

				pnStartingAt = 1
			
			but Q(pnStartingAt).IsOneOfTheseCS([
				:Last, :LastPosition, :LastItem, :LastItem ], :CS = FALSE)

				pnStartingAt = This.NumberOfItems()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			StzRaise("Incorrect param! pnStartingAt must be a number.")
		ok
			
		oSection = This.SectionQ(pnStartingAt, :LastItem)

		anPositions  = 	oSection.
				FindAllCSQR(pItem, pCaseSensitive, :stzListOfNumbers).
				AddToEachQ(pnStartingAt-1).
				Content()

		anPositionsToBeRemoved = []
		nLen = len(panList)
		nLenPos = len(anPositions)

		for i = 1 to nLen
			if i <= nLenPos
				anPositionsToBeRemoved +  anPositions[panList[i]]
			ok
		next

		This.RemoveItemsAtThesePositionsCS(anPositionsToBeRemoved, pCaseSensitive)

		#< @FunctionFluentForm

		def RemoveNextNthOccurrencesCSQ(panList, pItem, pnStartingAt, pCaseSensitive)
			This.RemoveNextNthOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForm

		def RemoveNthNextOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)
			This.RemoveNextNthOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)

			def RemoveNthNextOccurrencesCSQ(panList, pItem, pnStartingAt, pCaseSensitive)
				This.RemoveNthNextOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)
				return This

		def RemoveNextOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)
			This.RemoveNextNthOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)

			def RemoveNextOccurrencesCSQ(panList, pItem, pnStartingAt, pCaseSensitive)
				This.RemoveNthNextOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)
				return This
		#>

	def NextNthOccurrencesRemovedCS(panList, pItem, pnStartingAt, pCaseSensitive)

		aResult =  This.
			   RemoveNextNthOccurrencesCSQ(panList, pItem, pnStartingAt, pCaseSensitive).
			   Content()

		return aResult

		def NthNextOccurrencesRemovedCS(panList, pItem, pnStartingAt, pCaseSensitive)
			return This.NextNthOccurrencesRemovedCS(panList, pItem, pnStartingAt, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RemoveNextNthOccurrences(panList, pItem, pnStartingAt)
		This.RemoveNextNthOccurrencesCS(panList, pItem, pnStartingAt, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RemoveNextNthOccurrencesQ(panList, pItem, pnStartingAt)
			This.RemoveNextNthOccurrences(panList, pItem, pnStartingAt)
			return This

		#>

		#< @FunctionAlternativeForm

		def RemoveNthNextOccurrences(panList, pItem, pnStartingAt)
			This.RemoveNextNthOccurrences(panList, pItem, pnStartingAt)

			def RemoveNthNextOccurrencesQ(panList, pItem, pnStartingAt)
				This.RemoveNthNextOccurrences(panList, pItem, pnStartingAt)
				return This

		def RemoveNextOccurrences(panList, pItem, pnStartingAt)
			This.RemoveNextNthOccurrences(panList, pItem, pnStartingAt)

			def RemoveNextOccurrencesQ(panList, pItem, pnStartingAt)
				This.RemoveNthNextOccurrences(panList, pItem, pnStartingAt)
				return This
		#>

	def NextNthOccurrencesRemoved(panList, pItem, pnStartingAt)

		aResult =  This.
			   RemoveNextNthOccurrencesQ(panList, pItem, pnStartingAt).
			   Content()

		return aResult

		def NthNextOccurrencesRemoved(panList, pItem, pnStartingAt)
			return This.NextNthOccurrencesRemoved(panList, pItem, pnStartingAt)

	   #--------------------------------------------------#
	  #   REMOVING PREVIOUS NTH OCCURRENCE OF AN ITEM    #
	 #   STARTING AT A GIVEN POSITION IN THE LIST       #
	#--------------------------------------------------#

	def RemovePreviousNthOccurrenceCS(n, pItem, pnStartingAt, pCaseSensitive)
		if isList(pItem) and StzListQ(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if Q(pnStartingAt).IsOneOfTheseCS([
				:First, :FirstPosition, :FirstItem, :FirstItem ], :CS = FALSE)

				pnStartingAt = 1
			
			but Q(pnStartingAt).IsOneOfTheseCS([
				:Last, :LastPosition, :LastItem, :LastItem ], :CS = FALSE)

				pnStartingAt = This.NumberOfItems()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			StzRaise("Incorrect param! pnStartingAt must be a number.")
		ok

		oSection   = This.SectionQ(1, pnStartingAt)
		aPositions = oSection.FindAllCS(pItem, pCaseSensitive)

		nPosition = aPositions[ len(aPositions) - n + 1 ]

		This.RemoveItemAtPosition(nPosition)

		def RemovePreviousNthOccurrenceCSQ(n, pItem, pnStartingAt, pCaseSensitive)
			This.RemovePreviousNthOccurrenceCS(n, pItem, pnStartingAt, pCaseSensitive)
			return This

		def RemoveNthPreviousOccurrenceCS(n, pItem, pnStartingAt, pCaseSensitive)
			This.RemovePreviousNthOccurrenceCS(n, pItem, pnStartingAt, pCaseSensitive)

			def RemoveNthPreviousOccurrenceCSQ(n, pItem, pnStartingAt, pCaseSensitive)
				This.RemoveNthPreviousOccurrenceCS(n, pItem, pnStartingAt, pCaseSensitive)
				return This

	def NthPreviousOccurrenceRemovedCS(n, pItem, pnStartingAt, pCaseSensitive)

		aResult =  This.Copy().
				RemoveNthPreviousOccurrenceCSQ(n, pItem, pnStartingAt, pCaseSensitive).
				Content()

		return This

		def PreviousNthOccurrenceRemovedCS(n, pItem, pnStartingAt, pCaseSensitive)
			return This.NthPreviousOccurrenceRemovedCS(n, pItem, pnStartingAt, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RemovePreviousNthOccurrence(n, pItem, pnStartingAt)
		This.RemovePreviousNthOccurrenceCS(n, pItem, pnStartingAt, :CaseSensitive = TRUE)

		def RemovePreviousNthOccurrenceQ(n, pItem, pnStartingAt)
			This.RemovePreviousNthOccurrence(n, pItem, pnStartingAt)
			return This

		def RemoveNthPreviousOccurrence(n, pItem, pnStartingAt)
			This.RemovePreviousNthOccurrence(n, pItem, pnStartingAt)

			def RemoveNthPreviousOccurrenceQ(n, pItem, pnStartingAt)
				This.RemoveNthPreviousOccurrence(n, pItem, pnStartingAt)
				return This

	def NthPreviousOccurrenceRemoved(n, pItem, pnStartingAt)

		aResult =  This.Copy().
				RemoveNthPreviousOccurrenceQ(n, pItem, pnStartingAt).
				Content()

		return This

		def PreviousNthOccurrenceRemoved(n, pItem, pnStartingAt)
			return This.NthPreviousOccurrenceRemoved(n, pItem, pnStartingAt)

	   #----------------------------------------------#
	  #   REMOVING PREVIOUS OCCURRENCE OF AN ITEM    #
	 #   STARTING AT A GIVEN POSITION IN THE LIST   #
	#----------------------------------------------#

	def RemovePreviousOccurrenceCS(pItem, pnStartingAt, pCaseSensitive)
		This.RemovePreviousNthOccurrenceCS(1, pItem, pnStartingAt, pCaseSensitive)

		def RemovePreviousOccurrenceCSQ(pItem, pnStartingAt, pCaseSensitive)
			This.RemovePreviousOccurrenceCS(pItem, pnStartingAt, pCaseSensitive)
			return This

		def RemovePreviousCS(pItem, pnStartingAt, pCaseSensitive)
			This.RemovePreviousOccurrenceCS(pItem, pnStartingAt, pCaseSensitive)

	def PreviousOccurrenceRemovedCS(pItem, pnStartingAt, pCaseSensitive)
		aResult =  This.Copy().
				RemovePreviousOccurrenceCSQ(pItem, pnStartingAt, pCaseSensitive).
				Content()
		return This

		def PreviousRemovedCS(pItem, pnStartingAt, pCaseSensitive)
			return This.PreviousOccurrenceRemovedCS(pItem, pnStartingAt, pCaseSensitive)

	# WITHOUT CASESENSITIVITY

	def RemovePreviousOccurrence(pItem, pnStartingAt)
		This.RemovePreviousOccurrenceCS(pItem, pnStartingAt, :CaseSensitive = TRUE)

		def RemovePreviousOccurrenceQ(pItem, pnStartingAt)
			This.RemovePreviousOccurrence(pItem, pnStartingAt)
			return This

		def RemovePrevious(pItem, pnStartingAt)
			This.RemovePreviousOccurrence(pItem, pnStartingAt)

	def PreviousOccurrenceRemoved(pItem, pnStartingAt)
		aResult =  This.Copy().
				RemovePreviousOccurrenceQ(pItem, pnStartingAt).
				Content()
		return This

		def PreviousRemoved(pItem, pnStartingAt)
			return This.PreviousOccurrenceRemoved(pItem, pnStartingAt)

	   #--------------------------------------------------------#
	  #   REMOVING MANY PREVIOUS NTH OCCURRENCES OF AN ITEM    #
	 #   STARTING AT A GIVEN POSITION IN THE LIST             #
	#--------------------------------------------------------#

	def RemovePreviousNthOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)
		/* Example

		StzListQ([ "A" , "B", "A", "C", "A", "D", "A" ]) {
			RemovePreviousNthOccurrences([2, 3], :of = "A", :StartingAt = 5)
			? Content() #--> [ "A" , "B", "C", "D", "A" ]
		}		

		*/

		if NOT (isList(panList) and StzListQ(panList).IsListOfNumbers() and
		        StzListQ(panList).NumberOfItemsW("StzNumberQ(@item).IsBetween(1, " + This.NumberOfItems() + ")") = len(panList) )

			StzRaise("Incorrect param! panList must be a list of numbers between 1 and This.NumberOfItems().")
		ok

		if isList(pItem) and StzListQ(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if Q(pnStartingAt).IsOneOfTheseCS([
				:First, :FirstPosition, :FirstItem, :FirstItem ], :CS = FALSE)

				pnStartingAt = 1
			
			but Q(pnStartingAt).IsOneOfTheseCS([
				:Last, :LastPosition, :LastItem, :LastItem ], :CS = FALSE)

				pnStartingAt = This.NumberOfItems()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			StzRaise("Incorrect param! pnStartingAt must be a number.")
		ok
			
		oSection = This.SectionQ(1, pnStartingAt)

		anPositions = oSection.FindAllCSQ(pItem, pCaseSensitive).ItemsReversed()

		anPositionsToBeRemoved = []
		nLen = len(panList)
		nLenPositions = len(anPositions)

		for i = 1 to nLen
			if i <= nLenPso
				anPositionsToBeRemoved + anPositions[panList[i]]
			ok
		next

		This.RemoveItemsAtThesePositionsCS(anPositionsToBeRemoved, pCaseSensitive)

		#< @FunctionFluentForm

		def RemovePreviousNthOccurrencesCSQ(panList, pItem, pnStartingAt, pCaseSensitive)
			This.RemovePreviousNthOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForm

		def RemovePreviousOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)
			This.RemovePreviousNthOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)

			def RemovePreviousOccurrencesCSQ(panList, pItem, pnStartingAt, pCaseSensitive)
				This.RemovePreviousOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)
				return This

		def RemoveNthPreviousOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)
			This.RemovePreviousNthOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)

			def RemoveNthPreviousOccurrencesCSQ(panList, pItem, pnStartingAt, pCaseSensitive)
				This.RemoveNthPreviousOccurrencesCS(panList, pItem, pnStartingAt, pCaseSensitive)
				return This
		#>

	def PreviousNthOccurrencesRemovedCS(panList, pItem, pnStartingAt, pCaseSensitive)

		aResult = This.
			  RemovePreviousNthOccurrencesCSQ(panList, pItem, pnStartingAt, pCaseSensitive).
			  Content()

		return aResult

		def NthPreviousOccurrencesRemovedCS(panList, pItem, pnStartingAt, pCaseSensitive)
			return This.PreviousNthOccurrencesRemovedCS(panList, pItem, pnStartingAt, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RemovePreviousNthOccurrences(panList, pItem, pnStartingAt)
		This.RemovePreviousNthOccurrencesCS(panList, pItem, pnStartingAt, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RemovePreviousNthOccurrencesQ(panList, pItem, pnStartingAt)
			This.RemovePreviousNthOccurrences(panList, pItem, pnStartingAt)
			return This

		#>

		#< @FunctionAlternativeForm

		def RemovePreviousOccurrences(panList, pItem, pnStartingAt)
			This.RemovePreviousNthOccurrences(panList, pItem, pnStartingAt)

			def RemovePreviousOccurrencesQ(panList, pItem, pnStartingAt)
				This.RemovePreviousOccurrences(panList, pItem, pnStartingAt)
				return This

		#--

		def RemoveNthPreviousOccurrences(panList, pItem, pnStartingAt)
			This.RemovePreviousNthOccurrences(panList, pItem, pnStartingAt)

			def RemoveNthPreviousOccurrencesQ(panList, pItem, pnStartingAt)
				This.RemoveNthPreviousOccurrences(panList, pItem, pnStartingAt)
				return This
		#>

	def PreviousNthOccurrencesRemoved(panList, pItem, pnStartingAt)

		aResult = This.
			  RemovePreviousNthOccurrencesQ(panList, pItem, pnStartingAt).
			  Content()

		return aResult

		def NthPreviousOccurrencesRemoved(panList, pItem, pnStartingAt)
			return This.PreviousNthOccurrencesRemoved(panList, pItem, pnStartingAt)

	  #---------------------------------------------------#
	 #   REMOVING AN ITEM BY SPECIFYING ITS POSITION    #
	#---------------------------------------------------#

	def RemoveItemAtPosition(n)

		# Checking param correctness

		if isString(n)
			if Q(n).IsOneOfThese([
				:First, :FirstPosition,
			      	:FirstItem, :FirstItem ])
				  
				n = 1

			but Q(n).IsOneOfThese([
				:Last, :LastPosition,
			     	:LastItem, :LastItem ])

				n = This.NumberOfItems()
			ok
		ok

		if NOT (isNumber(n) and n != 0 )
			StzRaise("Incorrect param! n must be a number different from zero.")
		ok

		# Doing the job

		if n <= This.NumberOfItems()
			aTempList = This.Content()
			ring_del( aTempList, n )
			This.Update(aTempList)

		ok

		#< @FunctionFluentForm

		def RemoveItemAtPositionQ(n)
			This.RemoveItemAtPosition(n)
			return This

		#>

		#< @FunctionAlternativeForms

		def RemoveAt(n)
			This.RemoveItemAtPosition(n)

			def RemoveAtQ(n)
				This.RemoveAt(n)
				return This

		def RemoveAtPosition(n)
			This.RemoveItemAtPosition(n)

			def RemoveAtPositionQ(n)
				This.RemoveAtPosition(n)
				return This

		def RemoveItemAt(n)
			This.RemoveItemAtPosition(n)

			def RemoveItemAtQ(n)
				This.RemoveItemAt(n)
				return This

		#--

		def RemoveNthItem(n)
			This.RemoveItemAtPosition(n)

			def RemoveNthItemQ(n)
				This.RemoveNthItem(n)
				return This

		#>

	def ItemAtPositionNRemoved(n)
		aResult = This.Copy().RemoveItemAtPositionQ(n).Content()
		return This

		def NthItemRemoved(n)
			return This.ItemAtPositionNRemoved(n)

	  #--------------------------------------#
	 #    REMOVING FIRST ITEM IN THE LIST   #
	#--------------------------------------#

	def RemoveFirstItem()
		This.RemoveItemAtPosition(1)

		#< @FunctionFluentForm

		def RemoveFirstItemQ()
			This.RemoveFirstItem()
			return This

		#>

	def FirstItemRemoved()
		aResult = This.Copy().RemoveFirstItemQ().Content()
		return aResult

	  #-------------------------------------#
	 #    REMOVING LAST ITEM IN THE LIST   #
	#-------------------------------------#

	def RemoveLastItem()
		This.RemoveItemAtPosition( This.NumberOfItems() )

		#< @FunctionFluentForm

		def RemoveLastItemQ()
			This.RemoveLastItem()
			return This

		#>

	def LastItemRemoved()
		aResult = This.Copy().RemoveLastItemQ().Content()
		return aResult

	  #----------------------------------#
	 #   REMOVING FIRST AND LAST ITEMS  #
	#----------------------------------#

	def RemoveFirstAndLastItems()
		This.RemoveFirstItem()
		This.RemoveLastItem()

		#< @FunctionFluentForm

		def RemoveFirstAndLastItemsQ()
			This.RemoveFirstAndLastItems()
			return This

		#>

		#< @FunctionAlternativeForms

		def RemoveLastAndFirstItems()
			This.RemoveFirstAndLastItems()

			def RemoveLastAndFirstItemsQ()
				This.RemoveLastAndFirstItems()
				return This

		def RemoveFirstAndLast()
			This.RemoveFirstAndLastItems()

			def RemoveFirstAndLastQ()
				This.RemoveFirstAndLast()

		def RemoveLastAndFirst()
			This.RemoveFirstAndLastItems()

			def RemoveLastAndFirstQ()
				This.RemoveFirstAndLast()

		#--

		def RemoveFirstItemAndLastItem()
			This.RemoveFirstAndLastItems()

			def RemoveFirstItemAndLastItemQ()
				This.RemoveFirstItemAndLastItem()
				return This

		def RemoveLastItemAndFirstItem()
			This.RemoveFirstAndLastItems()

			def RemoveLastItemAndFirstItemQ()
				This.RemoveLastItemAndFirstItem()
				return This

		#>

	def FirstAndLastItemsRemoved()
		aResult = This.Copy().RemoveFirstAndLastItemsQ().Content()
		return aResult

		def LastAndFirstItemsRemoved()
			return This.FirstAndLastItemsRemoved()

		def FirstAndLastRemoved()
			return This.FirstAndLastItemsRemoved()

		def LastAndFirstRemoved()
			return This.FirstAndLastItemsRemoved()

		#--

		def FirstItemAndLastItemRemoved()
			return This.FirstAndLastItemsRemoved()

		def LastItemAndFirstItemRemoved()
			return This.FirstAndLastItemsRemoved()

	  #--------------------------------------#
	 #  REMOVING A GIVEN NTH ITEM (IF ANY)  #
	#--------------------------------------#

	def RemoveThisNthItemCS(n, pItem, pCaseSensitive)
		NthItem = This.NthItem(n)
		bItemExists = FALSE

		if isString( pItem )
			if Q(NthItem).IsEqualToCS(pItem, pCaseSensitive)
				bItemExists = TRUE
			ok

		else
			if Q(NthItem).IsEqualTo(pItem)
				bItemExists = TRUE
			ok
		ok

		if bItemExists
			This.RemoveNthItem(n)
		ok

		def RemoveThisNthItemCSQ(n, pItem, pCaseSensitive)
			This.RemoveThisNthItemCS(n, pItem, pCaseSensitive)
			return This

	def ThisNthItemRemovedCS(n, pItem, pCaseSensitive)
		return This.RemoveThisNthItemCSQ(n, pItem, pCaseSensitive).Content()

	#-- WITHOUT CASESENSITIVITY

	def RemoveThisNthItem(n, pItem)
		This.RemoveThisNthItemCS(n, pItem, :CaseSensitive = TRUE)
			
		def RemoveThisNthItemQ(n, pItem)
			This.RemoveThisNthItemCS(n, pItem)
			return This

	def ThisNthItemRemoved(n, pItem)
		return This.RemoveThisNthItemQ(n, pItem).Content()

	  #------------------------------------------------------#
	 #  REMOVING THE GIVEN FIRST ITEM (IA ANY) IN THE LIST  #
	#------------------------------------------------------#

	def RemoveThisFirstItemCS(pItem, pCaseSensitive)
		This.RemoveThisNthItemCS(1, pItem, pCaseSensitive)

		def RemoveThisFirstItemCSQ(pItem, pCaseSensitive)
			This.RemoveThisFirstItemCS(pItem, pCaseSensitive)
			return This

	def ThisFirstItemRemovedCS(pItem, pCaseSensitive)
		return This.Copy().RemoveThisFirstItemCSQ(pItem, pCaseSensitive).Content()

	#-- WITHOUT CASESENSITIVITY

	def RemoveThisFirstItem(pItem)
		This.RemoveThisNthItemCS(1, pItem, :CaseSensitive = TRUE)

		def RemoveThisFirstItemQ(pItem)
			This.RemoveThisFirstItem(pItem)
			return This

	def ThisFirstItemRemoved(pItem)
		return This.Copy().RemoveThisFirstItemQ(pItem, pCaseSensitive).Content()

	  #-----------------------------------------------------#
	 #  REMOVING THE GIVEN LAST ITEM (IA ANY) IN THE LIST  #
	#-----------------------------------------------------#

	def RemoveThisLastItemCS(pItem, pCaseSensitive)
		This.RemoveThisNthItemCS(This.NumberOfItems(), pItem, pCaseSensitive)

		def RemoveThisLastItemCSQ(pItem, pCaseSensitive)
			This.RemoveThisLastItemCS(pItem, pCaseSensitive)
			return This

	def ThisLastItemRemovedCS(pItem, pCaseSensitive)
		return This.Copy().RemoveThisLastItemCSQ(pItem, pCaseSensitive).Content()

	#-- WITHOUT CASESENSITIVITY

	def RemoveThisLastItem(pItem)
		This.RemoveThisNthItemCS(1, pItem, :CaseSensitive = TRUE)

		def RemoveThisLastItemQ(pItem)
			This.RemoveThisLastItem(pItem)
			return This

	def ThisLastItemRemoved(pItem)
		return This.Copy().RemoveThisLastItemQ(pItem, pCaseSensitive).Content()

	  #=====================================================#
	 #  REMOVING MANY ITEMS BY SPECIFYING THEIR POSITIONS  #
	#=====================================================#

	def RemoveItemsAtPositions(panPos)
		if NOT isList(panPos)
			StzRaise("Incorrect pram! panPos must be a list.")
		ok

		nLen = len(panPos)
		if nLen = 0
			return
		ok

		anPosSorted = StzListQ(panPos).SortedInDescending()
		
		for i = 1 to nLen
			This.RemoveItemAtPosition(anPosSorted[i])

		next

		#< @FunctionFluentForm

		def RemoveItemsAtPositionsQ(panPositions)
			This.RemoveItemsAtPositions(panPositions)
			return This

		#>

		#< @FunctionAlternativeForms

		def RemoveManyAt(panPositions)
			This.RemoveItemsAtPositions(panPositions)

			def RemoveManyAtQ(panPositions)
				This.RemoveManyAt(panPositions)
				return This

		def RemoveManyAtPositions(panPositions)
			This.RemoveItemsAtPositions(panPositions)

			def RemoveManyAtPositionsQ(panPositions)
				This.RemoveManyAtPositions(panPositions)
				return This

		def RemoveManyItemsAt(panPositions)
			This.RemoveItemsAtPositions(panPositions)

			def RemoveManyItemsAtQ(panPositions)
				This.RemoveManyItemsAt(panPositions)
				return This

		def RemoveManyItemsAtPositions(panPositions)
			This.RemoveItemsAtPositions(panPositions)

			def RemoveManyItemsAtPositionsQ(panPositions)
				This.RemoveManyItemsAtPositions(panPositions)
				return This

		def RemoveManyAtThesePositions(panPositions)
			This.RemoveItemsAtPositions(panPositions)

			def RemoveManyAtThesePositionsQ(panPositions)
				This.RemoveManyAtThesePositions(panPositions)
				return This

		def RemoveManyItemsAtThesePositions(panPositions)
			This.RemoveItemsAtPositions(panPositions)

			def RemoveManyItemsAtThesePositionsQ(panPositions)
				This.RemoveManyItemsAtThesePositions(panPositions)
				return This

		#--

		def RemoveItemsAtThesePositions(panPositions)
			This.RemoveItemsAtPositions(panPositions)

			def RemoveItemsAtThesePositionsQ(panPositions)
				This.RemoveItemsAtThesePositions(panPositions)
				return This

		def RemoveAtPositions(panPositions)
			This.RemoveItemsAtPositions(panPositions)

			def RemoveAtPositionsQ(panPositions)
				This.RemoveAtPositions(panPositions)
				return This

		#>
		
	def ItemsAtThesePositionsRemoved(panPositions)
		aResult = This.Copy().RemoveItemsAtThesePositionsQ(panPositions).Content()
		return aResult

	  #-------------------------------#
	 #   REMOVING A RANGE OF ITEMS   #
	#-------------------------------#

	def RemoveRange(pnStart, pnRange)
	
		# Checking the correctness of the pnStart param

		if isList(pnStart) and Q(pnStart).IsFromNamedParam()
			pnStart = pnStart[2]
		ok

		if isString(pnStart)
			if Q(pnStart).IsOneOfThese([
					:First, :FirstPosition,
				      	:FirstItem, :FirstItem ])
				  
				pnStart = 1

			but Q(pnStart).IsOneOfThese([
					:Last, :LastPosition,
				      	:LastItem, :LastItem ])

				n = This.NumberOfItems()
			ok
		ok

		if NOT isNumber(pnStart)
			StzRaise("Incorrect param! n must be a number.")
		ok

		# Checking the correctness of the pnRange param

		if isList(pnRange) and
		   isItem(pnRange[1]) and

		   ( Q(pnRange[1]).IsOneOfTheseCS([ :UpToN, :UpToNItems, :UpToNItems ]) )

		   	pnRange = pnRange[2]
		ok
	
		if NOT isNumber(pnRange)
			StzRaise("Incorrect param type! pnRange must be a number.")
		ok

		# Doing the job

		This.RemoveSection( pnStart, (pnStart + pnRange - 1) )

		#< @FunctionFluentForm

		def RemoveRangeQ(pnStart, pnRange)
			This.RemoveRange(pnStart, pnRange)
			return This
		#>

	def RangeRemoved(pnStart, pnRange)
		aResult = This.Copy().RemoveRangeQ(pnStart, pnRange)
		return aResult

	  #-----------------------------------#
	 #   REMOVING MANY RANGES OF ITEMS   #
	#-----------------------------------#

	def RemoveManyRanges(panRanges)

		anSections = []
		for anRange in panRanges
			anSections + RangeToSection(anRange)
		next

		This.RemoveManySections(anSections)

		def RemoveManyRangesQ(paRanges)
			This.RemoveManyRanges(paRanges)
			return This

	def ManyRangesRemoved(paRanges)
		aResult = This.Copy().RemoveManyRangesQ(paRanges).Content()
		return aResult

	  #---------------------------------#
	 #   REMOVING A SECTION OF ITEMS   #
	#---------------------------------#

	def RemoveSection(n1, n2)

		# Checking params correctness

		if CheckParams() = TRUE
			if isList(n1) and
				( Q(n1).IsFromNamedParam() or Q(n1).IsFromNamedParam()  or
				  Q(n1).IsFromPositionNamedParam() )
	
				n1 = n1[2]
			ok
	
			if isList(n2) and ( Q(n2).IsToNamedParam() or Q(n2).IsToPositionNamedParam() )
				n2 = n2[2]
			ok
	
			if isString(n1) and
				( Q(n1).IsOneOfThese([
					:First, :FirstPosition,
					:FirstItem, :FirstItem ]) )
	
				n1 = 1
			ok
	
			if isString(n2) and
				( Q(n2).IsOneOfThese([
					:Last, :LastPosition,
					:LastItem, :LastItem ]) )
	 
				n2 = This.NumberOfItems()
			ok
	
			if NOT ( isNumber(n1) and isNumber(n2) )
				StzRaise("Incorrect param type! n1 and n2 must be numbers.")
			ok

			if n1 = 0 or n2 = 0
				StzRaise("Incorrect param value! n1 and n2 must be different of zero.")
			ok

		ok

		# Doing the job

		nLen = This.NumberOfItems()

		anPart1 = []
		if n1 > 1
			anPart1 = 1 : (n1 - 1)
		ok

		if n2 > nLen
			n2 = nLen
		ok

		anPart2 = []
		if n2 = nLen
			anPart2 = [ ]
		else
			anPart2 = (n2 + 1) : nLen
		ok

		nLenPart2 = len(anPart2)

		anPos = anPart1
		for i = 1 to nLenPart2
			anPos + anPart2[i]
		next

		This.UpdateWith( This.ItemsAtPositions(anPos) )

		#< @FunctionFluentForm

		def RemoveSectionQ(n1, n2)
			This.RemoveSection(n1, n2)
			return This

		#>

	def SectionRemoved(n1, n2)
		aResult = This.Copy().RemoveSectionQ(n1, n2)
		return aResult

	  #-------------------------------------#
	 #   REMOVING MANY SECTIONS OF ITEMS   #
	#-------------------------------------#

	def RemoveManySections(paSections)

		if isList(paSections)
			oSections = new stzList(paSections)
			anPos = oSections.FindAll([])
			oSections.RemoveItemsAtPositions(anPos)
			paSections = oSections.Content()
			
		ok

		if NOT ( isList(paSections) and Q(paSections).IsListOfPairsOfNumbers() )

			stzRaise([
				:Where = "stzList > RemoveManySections(paSections)",
				:What  = "Can't remove many sections from the string.",
				:Why   = "The value is you provided (paSections) is not a list of pairs of numbers."
			])

		ok

		nLen = len(paSections)
		if nLen = 0
			return
		ok

		aSorted = QR(paSections, :stzListOfPairs).Sorted()

		for i = nLen to 1 step -1
			This.RemoveSection(aSorted[i][1], aSorted[i][2])
		next

		def RemoveManySectionsQ(paSections)
			This.RemoveManySections(paSections)
			return This

		def RemoveSections(paSections)
			This.RemoveManySections(paSections)

	def ManySectionsRemoved(paSections)
		aResult = This.Copy().RemoveManySectionsQ(paSections).Content()
		return aResult

		def SectionsRemoved(paSections)

	  #----------------------------------------#
	 #    SWAPPING TWO SECTIONS OF THE LIST   # 
	#----------------------------------------#

	def SwapSections( panSection1, panSection2 )
		if isList(panSection2) and Q(panSection2).IsWithOrAndNamedParams()
			panSection2 = panSection2[2]
		ok

		if NOT BothArePairsOfNumbers(panSection1, panSection2)
			StzRaise("Incorrect param type! panSection1 and panSection2 must be both pairs of number.")
		ok

		aSorted = QR([ panSection1, panSection2 ], :stzListOfPairs).Sorted()

		anFirstSection = []
		anLastSection  = []

		if Q(aSorted[1]).IsEqualTo(panSection1)
			anFirstSection = panSection1
			anLastSection  = panSection2

		else
			anFirstSection = panSection2
			anLastSection  = panSection1
		ok

		aResult = ListsMerge([
			This.Section(anLastSection[1], anLastSection[2]),
			This.Section(anFirstSection[2] + 1, anLastSection[1] - 1),
			This.Section(anFirstSection[1], anFirstSection[2])
		])

		This.UpdateWith(aResult)


		def SwapSectionsQ(panSection1, panSection2)
			This.SwapSections(panSection1, panSection2)
			return This

	def SectionsSwapped(panSection1, panSection2)
		cResult = This.Copy().SwapSectionsQ(panSection1, panSection2)
		return cResult

	  #------------------------------------#
	 #   REMOVING ALL ITEMS IN THE LIST   #
	#------------------------------------#
	
	def RemoveAllItems()
		@aContent = []

		#< @FunctionFluentForm

		def RemoveAllItemsQ()
			This.RemoveAllItems()
			return This

		#>

		#< @FunctionAlternativeForm

		def Clear()
			This.RemoveAllItems()

			def ClearQ()
				This.Clear()
				return This

		#>

	def AllItemsRemoved()
		return []

	  #--------------------------------------------#
	 #   REMOVING ITEMS UNDER A GIVEN CONDITION   #
	#--------------------------------------------#

	def RemoveW(pCondition)
		/*
		Example:

		o1 = new stzList([ "1", "a", "2", "b", "3", "c" ])
		o1.RemoveAllItemsW(:Where = '{ StzCharQ(@item).IsANumber() }')
		? o1.Content()

		#--> Gives: [ "a", "b", "c" ]
		*/

		# Checking the provided param for the pCondition

		anPos = This.FindW(pCondition)

		This.RemoveItemsAtThesePositions(anPos)

		#< @FunctionFluentForm

		def RemoveWQ(pCondition)
			This.RemoveW(pCondition)
			return This

		#>

		#< @FunctionAlternativeForm

		def RemoveItemsW(pCondition)
			This.RemoveW(pCondition)

			def RemoveItemsWQ(pCondition)
				This.RemoveItemsW(pCondition)
				return This

		#>

	def ItemsRemovedW(pCondition)
		aResult = This.Copy().RemoveItemsWQ(pCondition).Content()
		return aResult

	  #====================================#
	 #  EXTRACTING AN ITEM FROM THE LIST  #
	#====================================#

	def ExtractCS(pItem, pCaseSensitive)
		if NOT This.ContainsCS(pItem, pCaseSensitive)
			StzRaise("Can't extract the item! It does not exist in the list.")
		ok

		This.RemoveCS(pItem, pCaseSensitive)
		return pItem

		def PopCS(pItem, pCaseSensitive)
			return This.ExtractCS(pItem, pCaseSensitive)

	def ItemExtractedCS(pItem, pCaseSensitive)
		return This.ExtractCS(pItem, pCaseSensitive)

		def ItemPoppedCS(pItem, pCaseSensitive)
			return This.ItemExtractedCS(pItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def Extract(pItem)
		return This.ExtractCS(pItem, :CaseSensitive = TRUE)

		def Pop(pItem)
			return This.Extract(pItem)

	def ItemExtracted(pItem)
		return This.Extract(pItem)

		def ItemPopped(pItem)
			return This.ItemExtracted(pItem)

	  #---------------------------------------#
	 #  EXTRACTING MANY ITEMS FROM THE LIST  #
	#---------------------------------------#

	def ExtractManyCS(paItems, pCaseSensitive)
		if NOT This.ContainsManyCS(paItems, pCaseSensitive)
			StzRaise("Can't extract the items! Items in paItems do not exist in the list.")
		ok

		This.RemoveManyCS(paItems, pCaseSensitive)
		return paItems

		def PopManyCS(paItems, pCaseSensitive)
			return This.ExtractManyCS(paItems, pCaseSensitive)

	def ManyItemsExtractedCS(paItems, pCaseSensitive)
		return This.ExtractManyCS(paItems, pCaseSensitive)

		def ManyItemsPoppedCS(paItems, pCaseSensitive)
			return This.ExtractManyCS(paItems, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ExtractMany(paItems)
		return This.ExtractManyCS(paItems, :pCaseSensitive = TRUE)

		def PopMany(paItems)
			return This.ExtractMany(paItems)

	def ManyItemsExtracted(paItems)
		return This.ExtractMany(paItems)

		def ManyItemsPopped(paItems)
			return This.ExtractMany(paItems)

	  #------------------------------------------#
	 #  EXTRACTING ALL THE ITEMS FROM THE LIST  #
	#------------------------------------------#

	def ExtractAll()
		aResult = This.Content()
		This.Clear()
		return aResult

		#< @FunctionAlternativeForms

		def ExtractList()
			return This.ExtractAll()

		def ExtractAllList()
			return This.ExtractAll()

		#--

		def PopAll()
			return This.ExtractAll()

		def PopList()
			return This.ExtractAll()

		def PopAllList()
			return This.ExtractAll()

		#>

	def AllItemsExtracted()
		return This.ExtractAll()

		#< @FunctionAlternativeForms

		def ListExtracted()
			return This.ExtractAll()

		def AllListExtracted()
			return This.ExtractAll()

		#--

		def AllItemsPopped()
			return This.ExtractAll()

		def ListPopped()
			return This.ExtractAll()

		def AllListPopped()
			return This.ExtractAll()
		#>

	  #---------------------------#
	 #  EXTRACTING THE NTH ITEM  #
	#---------------------------#

	def ExtractAt(n)
		if isString(n) and ( n = :Last or n = :LastItem )
			n = This.NumberOfItems()
		ok

		if NOT isNumber(n) and Q(n).IsBetween(1, This.NumberOfItems())
			StzRaise("Can't extract! n outside of range.")
		ok

		TempItem = This.ItemAt(n)

		This.RemoveAt(n)

		return TempItem

		#< @FunctionAlternativeForms

		def ExtractNthItem(n)
			return This.ExtractAt(n)

		def ExtractItemAtPosition(n)
			return This.ExtractAt(n)

		def ExtractItemAt(n)
			return This.ExtractAt(n)

		#--

		def PopAt(n)
			return This.ExtractAt(n)

		def PopNthItem(n)
			return This.ExtractAt(n)

		def PopItemAtPosition(n)
			return This.ExtractAt(n)

		def PopItemAt(n)
			return This.ExtractAt(n)

		#>

	def NthItemExtracted(n)
		return This.ExtractAt(n)

		def NthItemPopped(n)
			return This.ExtractAt(n)

		def ExtractedAt(n)
			return This.ExtractAt(n)

		def PoppedAt(n)
			return This.ExtractAt(n)

	  #-----------------------------#
	 #  EXTRACTING THE FIRST ITEM  #
	#-----------------------------#

	def ExtractFirstItem()
		return This.ExtractAt(1)
 
		def PopFirstItem()
			return This.ExtractFirstItem()

	def FirstItemExtracted()
		return This.ExtractFirstItem()

		def FirstItemPopped()
			return This.ExtractFirstItem()

	  #----------------------------#
	 #  EXTRACTING THE LAST ITEM  #
	#----------------------------#

	def ExtractLastItem()
		return This.ExtractAt(This.NumberOfItems())
		# TODO: the line above was:
		# return This.ExtractAt(:Last)
		# but since CheckParams() is used in ExtractAt(),
		# the special value :Last will not be recognosed.
		# That's why I changed it to its actual value NumberOfItems()
		#--> Do the same all over the library!

		def PopLastItem()
			return This.ExtractLastItem()

	def LastItemExtracted()
		return This.ExtractLastItem()

		def LastItemPopped()
			return This.ExtractLastItem()

	  #--------------------------------------------#
	 #  EXTRACTING THE NTH OCCURRENCE OF AN ITEM  #
	#--------------------------------------------#

	def ExtractNthOccurrenceCS(n, pItem, pCaseSensitive)
		if This.FindNthOccurrenceCS(n, pItem, pCaseSensitive) > 0
			This.RemoveNthOccurrenceCS(n, pItem, pCaseSensitive)
			return pItem
		else
			StzRaise("Can't extract! The list does not contain n occurrences of pItem.")
		ok

		#< @FunctionAlternativeFroms

		def ExtractNthCS(n, pItem, pCaseSensitive)
			return This.ExtractNthOccurrenceCS(n, pItem, pCaseSensitive)

		def PopNthCS(n, pItem, pCaseSensitive)
			return This.ExtractNthOccurrenceCS(n, pItem, pCaseSensitive)

		def PopNthOccurrenceCS(n, pItem, pCaseSensitive)
			return This.ExtractNthOccurrenceCS(n, pItem, pCaseSensitive)

		#>

	def NthOccurrenceExtractedCS(n, pItem, pCaseSensitive)
		return This.ExtractNthOccurrenceCS(n, pItem, pCaseSensitive)

		def NthOccurrencePoppedCS(n, pItem, pCaseSensitive)
			return This.ExtractNthOccurrenceCS(n, pItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ExtractNthOccurrence(n, pItem)
		return This.ExtractNthOccurrenceCS(n, pItem, :CaseSensitive = TRUE)

		#< @FunctionAlternativeFroms

		def ExtractNth(n, pItem)
			return This.ExtractNthOccurrence(n, pItem)

		def PopNth(n, pItem)
			return This.ExtractNthOccurrence(n, pItem)

		def PopNthOccurrence(n, pItem)
			return This.ExtractNthOccurrence(n, pItem)

		#>

	def NthOccurrenceExtracted(n, pItem)
		return This.ExtractNthOccurrence(n, pItem)

		def NthOccurrencePopped(n, pItem)
			return This.ExtractNthOccurrence(n, pItem)

	  #----------------------------------------------#
	 #  EXTRACTING THE FIRST OCCURRENCE OF AN ITEM  #
	#----------------------------------------------#

	def ExtractFirstCS(pItem, pCaseSensitive)
		return This.ExtractNthOccurrenceCS(1, pItem, pCaseSensitive)

		#< @FunctionAlternativeForms

		def PopFirstCS(pItem, pCaseSensitive)
			return This.ExtractFirstCS(pItem, pCaseSensitive)

		def ExtractFirstOccurrenceCS(pItem, pCaseSensitive)
			return This.ExtractFirstCS(pItem, pCaseSensitive)

		def PopFirstOccurrenceCS(pItem, pCaseSensitive)
			return This.ExtractFirstCS(pItem, pCaseSensitive)

		#>

	def FirstOccurrenceExtractedCS(pItem, pCaseSensitive)
		return This.ExtractFirstCS(pItem, pCaseSensitive)

		def FirstOccurrencePoppedCS(pItem, pCaseSensitive)
			return This.ExtractFirstCS(pItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ExtractFirst(pItem)
		return This.ExtractFirstCS(pItem, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def PopFirst(pItem)
			return This.ExtractFirst(pItem)

		def ExtractFirstOccurrence(pItem)
			return This.ExtractFirst(pItem)

		def PopFirstOccurrence(pItem)
			return This.ExtractFirst(pItem)

		#>

	def FirstOccurrenceExtracted(pItem)
		return This.ExtractFirst(pItem)

		def FirstOccurrencePopped(pItem)
			return This.ExtractFirst(pItem)

	  #---------------------------------------------#
	 #  EXTRACTING THE LAST OCCURRENCE OF AN ITEM  #
	#---------------------------------------------#

	def ExtractLastCS(pItem, pCaseSensitive)
		nLast = This.NumberOfOcurrencesCS(pItem, pCaseSensitive)
		return This.ExtractNthOccurrenceCS(nLast, pItem, pCaseSensitive)

		#< @FunctionAlternativeForms

		def PopLastCS(pItem, pCaseSensitive)
			return This.ExtractLastCS(pItem, pCaseSensitive)

		def ExtractLastOccurrenceCS(pItem, pCaseSensitive)
			return This.ExtractLastCS(pItem, pCaseSensitive)

		def PopLastOccurrenceCS(pItem, pCaseSensitive)
			return This.ExtractLastCS(pItem, pCaseSensitive)

		#>

	def LastOccurrenceExtractedCS(pItem, pCaseSensitive)
		return This.ExtractLastCS(pItem, pCaseSensitive)

		def LastOccurrencePoppedCS(pItem, pCaseSensitive)
			return This.ExtractLastCS(pItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ExtractLast(pItem)
		return This.ExtractLastCS(pItem, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def PopLast(pItem)
			return This.ExtractLast(pItem)

		def ExtractLastOccurrence(pItem)
			return This.ExtractLast(pItem)

		def PopLastOccurrence(pItem)
			return This.ExtractLast(pItem)

		#>

	def LastOccurrenceExtracted(pItem)
		return This.ExtractLast(pItem)

		def LastOccurrencePopped(pItem)
			return This.ExtractLast(pItem)

	  #------------------------------------------------#
	 #  EXTRACTING ITEMS VERIFYING A GIVEN CONDITION  #
	#------------------------------------------------#

	def ExtractW(pcCondition)
		aResult = This.ItemsW(pcCondition)
		if len(aResult) = 0
			StzRaise("Can't extract! The condition returns no values at all.")
		ok

		This.RemoveW(pcCondition)
		return aResult

		def PopW(pcCondition)
			return This.ExtractW(pcCondition)

	def ItemsExtractedW(pcCondition)
		return This.ExtractW(pcCondition)

		def ItemsPoppedW(pcCondition)
			return This.ItemsExtractedW(pcCondition)

	  #--------------------------------------#
	 #  EXTRACTING A SECTION FROM THE LIST  #
	#--------------------------------------#

	def ExtractSection(n1, n2)
		if NOT Q([n1, n2]).BothAreNumbers() and
		   Q(n1).IsBetween(1, This.NumberOfItems()) and
		   Q(n2).IsBetween(1, This.NumberOfItems())

			StzRaise("Can't extract! The section is outside the list.")
		ok

		aResult = This.Section(n1, n2)
		This.RemoveSection(n1, n2)
		return aResult

		#< @FunctionAlternativeForm

		def PopSection(n1, n2)
			return This.ExtractSection(n1, n2)

		#>

	def SectionExtracted(n1, n2)
		return This.ExtractSection(n1, n2)

		#< @FunctionAlternativeForm

		def SectionPopped(n1, n2)
			return This.SectionExtracted(n1, n2)

		#>

	  #------------------------------------#
	 #  EXTRACTING A RANGE FROM THE LIST  #
	#------------------------------------#

	def ExtractRange(nStart, nRange)
		return This.ExtractSection(nStart, nStart + nRange - 1)

		def PopRange(nStart, nRange)
			return This.ExtractRange(nStart, nRange)

	def RangeExtracted(nStart, nRange)
		return This.ExtractRange(nStart, nRange)

		def RangePopped(nStart, nRange)
			return This.RangeExtracted(nStart, nRange)

	  #-----------------------------------------------------#
	 #  EXTRACTING NEXT ITEM STARTING AT A GIVEN POSITION  #
	#-----------------------------------------------------#

	def ExtractNextCS(pItem, pnStartingAt, pCaseSensitive)
		if This.FindNext(pItem, pnStartingAt, pCaseSensitive) = 0
			StzRaise("Can't extract! pItem does not exist at the specified position.")
		ok

		This.RemoveNextCS(pItem, pnStartingAt, pCaseSensitive)
		return pItem

		#< @FunctionAlternativeForms

		def ExtractNextOccurrenceCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractNextCS(pItem, pnStartingAt, pCaseSensitive)

		def PopNextCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractNextCS(pItem, pnStartingAt, pCaseSensitive)

		def PopNextOccurrenceCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractNextCS(pItem, pnStartingAt, pCaseSensitive)

		#--

		def ExtractNextSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractNextCS(pItem, pnStartingAt, pCaseSensitive)

		def ExtractNextOccurrenceSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractNextCS(pItem, pnStartingAt, pCaseSensitive)

		def PopNextSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractNextCS(pItem, pnStartingAt, pCaseSensitive)

		def PopNextOccurrenceSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractNextCS(pItem, pnStartingAt, pCaseSensitive)

		#>

	def NextOccurrenceExtractedCS(pItem, pnStartingAt, pCaseSensitive)
		return This.ExtractNextCS(pItem, pnStartingAt, pCaseSensitive)

		#< @FunctionAlternativeForms

		def NextOccurrenceExtractedSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractNextCS(pItem, pnStartingAt, pCaseSensitive)
	
		def NextOccurrencePoppedCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractNextCS(pItem, pnStartingAt, pCaseSensitive)
	
		def NextOccurrencePoppedSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractNextCS(pItem, pnStartingAt, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def ExtractNext(item, pnStartingAt)
		return This.ExtractNext(item, pnStartingAt, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ExtractNextOccurrence(pItem, pnStartingAt)
			return This.ExtractNext(pItem, pnStartingAt)

		def PopNext(pItem, pnStartingAt)
			return This.ExtractNext(pItem, pnStartingAt)

		def PopNextOccurrence(pItem, pnStartingAt)
			return This.ExtractNext(pItem, pnStartingAt)

		#--

		def ExtractNextS(pItem, pnStartingAt)
			return This.ExtractNext(pItem, pnStartingAt)

		def ExtractNextOccurrenceS(pItem, pnStartingAt)
			return This.ExtractNext(pItem, pnStartingAt)

		def PopNextS(pItem, pnStartingAt)
			return This.ExtractNext(pItem, pnStartingAt)

		def PopNextOccurrenceS(pItem, pnStartingAt)
			return This.ExtractNext(pItem, pnStartingAt)

		#>

	def NextOccurrenceExtracted(pItem, pnStartingAt)
		return This.ExtractNext(pItem, pnStartingAt)

		#< @FunctionAlternativeForms

		def NextOccurrenceExtractedS(pItem, pnStartingAt)
			return This.ExtractNext(pItem, pnStartingAt)
	
		def NextOccurrencePopped(pItem, pnStartingAt)
			return This.ExtractNext(pItem, pnStartingAt)
	
		def NextOccurrencePoppedS(pItem, pnStartingAt)
			return This.ExtractNext(pItem, pnStartingAt)

		#>

	  #---------------------------------------------------------#
	 #  EXTRACTING PREVIOUS ITEM STARTING AT A GIVEN POSITION  #
	#---------------------------------------------------------#

	def ExtractPreviousCS(item, pnStartingAt, pCaseSensitive)
		if This.FindPreviousCS(item, pnStartingAt, pCaseSensitive) = 0
			StzRaise("Can't extract! pItem does not exist at the specified position.")
		ok

		This.RemovePreviousCS(item, pnStartingAt, pCaseSensitive)
		return item

		#< @FunctionAlternativeForms

		def ExtractPreviousOccurrenceCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractPreviousCS(pItem, pnStartingAt, pCaseSensitive)

		def PopPreviousCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractPreviousCS(pItem, pnStartingAt, pCaseSensitive)

		def PopPreviousOccurrenceCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractPreviousCS(pItem, pnStartingAt, pCaseSensitive)

		#--

		def ExtractPreviousSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractPreviousCS(pItem, pnStartingAt, pCaseSensitive)

		def ExtractPreviousOccurrenceSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractPreviousCS(pItem, pnStartingAt, pCaseSensitive)

		def PopPreviousSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractPreviousCS(pItem, pnStartingAt, pCaseSensitive)

		def PopPreviousOccurrenceSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractPreviousCS(pItem, pnStartingAt, pCaseSensitive)

		#>

	def PreviousOccurrenceExtractedCS(pItem, pnStartingAt, pCaseSensitive)
		return This.ExtractPreviousCS(pItem, pnStartingAt, pCaseSensitive)

		#< @FunctionAlternativeForms

		def PreviousOccurrenceExtractedSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractPreviousCS(pItem, pnStartingAt, pCaseSensitive)
	
		def PreviousOccurrencePoppedCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractPreviousCS(pItem, pnStartingAt, pCaseSensitive)
	
		def PreviousOccurrencePoppedSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.ExtractPreviousCS(pItem, pnStartingAt, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def ExtractPrevious(item, pnStartingAt)
		return This.ExtractPreviousCS(item, pnStartingAt, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ExtractPreviousOccurrence(pItem, pnStartingAt)
			return This.ExtractPrevious(pItem, pnStartingAt)

		def PopPrevious(pItem, pnStartingAt)
			return This.ExtractPrevious(pItem, pnStartingAt)

		def PopPreviousOccurrence(pItem, pnStartingAt)
			return This.ExtractPrevious(pItem, pnStartingAt)

		#--

		def ExtractPreviousS(pItem, pnStartingAt)
			return This.ExtractPrevious(pItem, pnStartingAt)

		def ExtractPreviousOccurrenceS(pItem, pnStartingAt)
			return This.ExtractPrevious(pItem, pnStartingAt)

		def PopPreviousS(pItem, pnStartingAt)
			return This.ExtractPrevious(pItem, pnStartingAt)

		def PopPreviousOccurrenceS(pItem, pnStartingAt)
			return This.ExtractPrevious(pItem, pnStartingAt)

		#>

	def PreviousOccurrenceExtracted(pItem, pnStartingAt)
		return This.ExtractPrevious(pItem, pnStartingAt)

		#< @FunctionAlternativeForms

		def PreviousOccurrenceExtractedS(pItem, pnStartingAt)
			return This.ExtractPrevious(pItem, pnStartingAt)
	
		def PreviousOccurrencePopped(pItem, pnStartingAt)
			return This.ExtractPrevious(pItem, pnStartingAt)
	
		def PreviousOccurrencePoppedS(pItem, pnStartingAt)
			return This.ExtractPrevious(pItem, pnStartingAt)

		#>

	  #===================================================================================#
	 #  CHECKING IF THE 2 ITEMS OF THE LIST ARE BOUNDS OF A SUBSTRING IN A GIVEN STRING  #
	#===================================================================================#

	def AreBoundsOfCS(pcSubStr, pIn, pCaseSensitive)
		# Supports only strings in pIn
		# TODO: lists will be also supported

		/* EXAMPLE 1

		o1 = new stzList([ "<<", ">>" ])
		? o1.AreBoundsOf("word", :In = "<<word>> and __word__")
		#--> TRUE

		EXAMPLE 2

		o1 = new stzList([ [ "<<", ">>" ], [ "__", "__" ] ])
		? o1.AreBoundsOf("word", :In = "<<word>> and __word__")
		#--> TRUE

		*/

		# Checking the params

		if CheckParams() = TRUE

			if NOT isString(pcSubStr)
				StzRaise("Incorrect param type! pcSubStr must be a string.")
			ok
	
			if NOT ( This.IsPair() or This.IsListOfPairs() )
				StzRaise("Can't check bounds! List must be a pair or a list of pairs.")
			ok
	
			if isList(pIn) and Q(pIn).IsInNamedParam()
				pIn = pIn[2]
			ok
	
			if NOT isString(pIn)
				StzRaise("Incorrect param type! pIn must be a string.")
			ok

		ok

		# Doing the job

		nResult = StzStringQ(pIn).SubStringIsBoundedByCS(pIn, This.List(), pCaseSensitive)
		return nResult

	#-- WITHOUT CASESENSITIVITY

	def AreBoundsOf(pItem, pIn)
		return This.AreBoundsOfCS(pItem, pIn, :CaseSensitive = TRUE)

	  #----------------------------------------------------------#
	 #  CHECKING IF THE LIST IS BOUNDED BY THE GIVEN TWO ITEMS  #
	#----------------------------------------------------------#

	def IsBoundedBy(paBounds)
		if isList(paBounds) and Q(paBounds).IsPair()
			pItem1 = paBounds[1]
			pItem2 = paBounds[2]

		else
			pItem1 = paBounds
			pItem2 = paBounds
		ok
	
		if This.FirstItem() = pItem1 and This.LastItem() = pItem2
			return TRUE
		else
			return FALSE
		ok

	  #--------------------------------------------#
	 #  GETTING BOUNDS OF THE LIST UP TO N ITEMS  #
	#--------------------------------------------#

	def BoundsUpToNItems(n)
		return [ This.NFirstItems(n), This.NLastItems(n) ] # TODO add them

		#< @FunctionFluentForm
	
		def BoundsUpToNItemsQ(n)
			return new stzList( This.BoundsUpToNItems(n) )

		#>

	  #-------------------------#
	 #     REMOVING BOUNDS     #
	#-------------------------#

	def RemoveTheseBoundsCS(pBound1, pBound2, pCaseSensitive)
		if This.IsBoundedByCS([ pBound1, pBound2], pCaseSensitive)
			This.RemoveFirstItem()
			This.RemoveLastItem()
		ok

		def RemoveTheseBoundsCSQ(pBound1, pBound2, pCaseSensitive)
			This.RemoveTheseBoundsCS(pBound1, pBound2, pCaseSensitive)
			return This

	def TheseBoundsRemovedCS(pBound1, pBound2, pCaseSensitive)

		aResult = This.Copy().RemoveTheseBoundsCSQ(pBound1, pBound2, pCaseSensitive).Content()
		return aResult

		/* WARNING: Subtle bug in Ring (Show to Mahmoud)

		In the function above, if we write the expression that returns
		the result directly after the keyword 'return', like this:

		return This.Copy().RemoveTheseBoundsQ(pItem1, pItem2).Content()

		Then nothing is returned, altough the result should be a list!

		I don't know why this happens. But I found that the solution is
		to avoid writing any expression after return. Instead, let's always
		compute the result in a variable, and then return it (see code above).

		--> TODO: Check the occurrence this pattern all over the library!
		*/
		
	#-- WIHTOUT CASESENSITIVITY

	def RemoveTheseBounds(pBound1, pBound2)
		This.RemoveTheseBoundsCS(pBound1, pBound2, :CaseSensitive = TRUE)

		def RemoveTheseBoundsQ(pBound1, pBound2)
			This.RemoveTheseBounds(pBound1, pBound2)
			return This

	def TheseBoundsRemoved(pBound1, pBound2)

		aResult = This.Copy().RemoveTheseBoundsQ(pBound1, pBound2).Content()
		return aResult

	  #------------------------------#
	 #     REMOVING MANY BOUNDS     #
	#------------------------------#

	def RemoveManyBoundsCS(paPairsOfBounds, pCaseSensitive)
		nLen = len(paPairsOfBounds)
		for i = 1 to nLen
			This.RemoveTheseBoundsCS(paPairsOfBounds[i][1], paPairsOfBounds[i][2], pCaseSensitive)
		next

		def RemoveManyBoundsCSQ(paPairsOfBounds, pCaseSensitive)
			This.RemoveManyBoundsCS(paPairsOfBounds, pCaseSensitive)
			return This

	def ManyBoundsRemovedCS(paPairsOfBounds, pCaseSensitive)
		aResult = This.Copy().RemoveManyBoundsCSQ(paPairsOfBounds, pCaseSensitive).Content()
		return aResult

	#-- WITHOUT CASESENSITIVITY

	def RemoveManyBounds(paPairsOfBounds)
		This.RemoveManyBoundsCS(paPairsOfBounds, :CaseSensitive = TRUE)

		def RemoveManyBoundsQ(paPairsOfBounds)
			This.RemoveManyBounds(paPairsOfBounds)
			return This

	def ManyBoundsRemoved(paPairsOfBounds)
		aResult = This.Copy().RemoveManyBoundsQ(paPairsOfBounds).Content()
		return aResult

	  #----------------------------------#
	 #   REMOVING ZEROS FROM THE LIST   #
	#----------------------------------#

	def RemoveZeros()
		This.RemoveItem(0)

		def RemoveZerosQ()
			This.RemoveZeros()
			return This

	def ZerosRemoved()
		aResult = This.Copy().RemoveZerosQ().Content()
		return aResult

	  #-------------------------------------#
	 #    CHECKINK LIST CHARACTERISTICS    #
	#-------------------------------------#

	def IsUnaryList()
		if This.NumberOfItems() = 1
			return TRUE
		else
			return FALSE
		ok

	def IsEmpty()
		if This.NumberOfItems() = 0
			return TRUE
		else
			return FALSE
		ok

	def IsDeepList()	// Contains at least an inner list
		If This.Depth() > 1
			return TRUE
		else
			return FALSE
		ok

		def IsADeepList()
			return This.ISDeepList()

		def IsDeep()
			return This.ISDeepList()

	def IsHybridList()	// Contains items of different types
		if NOT This.ContainsOnlyNumbers() or
		   NOT This.ContainsOnlyStrings() or
		   NOT This.ContainsOnlyLists() or
		   NOT This.ContainsOnlyObjects()
			return TRUE
		else
			return FALSE
		ok

		def IsAHybridList()
			return This.IsHybridList()

	def IsPureList()	// Contains items of the same type
		if This.ContainsOnlyNumbers() or
		   This.ContainsOnlyStrings() or
		   This.ContainsOnlyLists() or
		   This.ContainsOnlyObjects()
			return TRUE
		else
			return FALSE
		ok

		def IsAPureList()
			return This.IsPureList()

	def IsOddList()
		oTempNumber = new stzNumber( This.NumberOfItems() )
		if oTempNumber.IsOdd()
			return TRUE
		else
			return FALSE
		ok

		def IsAnOddList()
			return This.IsOddList()

	def IsEvenList()
		if NOT This.IsOddList()
			return TRUE
		else
			return FALSE
		ok

		def IsAnEvenList()
			return This.IsEvenList()

	def IsListOfGrids()
		aContent = This.Content()
		nLen = len(aContent)

		bResult = TRUE

		for i = 1 to nLen
			if NOT Q(aContent[i]).IsGrid()
				bResult = FALSE
				exit
			ok
		next

		return bResult

	// TODO: Maybe we should design a stzListOfBits class...
	def IsListOfBits()
		if This.NumberOfItems() = 0
			return FALSE
		ok

		if This.IsListOfNumbers()
			for n in This.List()
				if NOT IsBit(n)
					return FALSE
				ok
			end
		ok

		return TRUE

		def IsAListOfBits()
			return This.IsListOfBits()

	def IsListOfZerosAndOnes()
		if This.NumberOfItems() = 0
			return FALSE
		ok

		return This.IsListOfBits()

		def IsAListOfZerosAndOnes()
			return This.IsListOfZerosAndOnes()

	def IsGrid()
		aContent = This.Content()
		nLen = len(aContent)

		if nLen < 2
			return FALSE
		ok

		if NOT This.AllItemsAreLists()
			return FALSE
		ok

		nLen1 = len(aContent[1])
		bResult = TRUE

		for i = 2 to nLen
			if len(aContent[i]) != nLen1
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def IsAGrid()
			return This.IsGrid

	def IsHashList()
		/*
		A hash list is a grid of 2 vlines.

		The items of the 1st vline are all strings.
		And they are all unique (form a Set).

		When stzGrid class is fully tested we can use this code:	
		
		oTempGrid = new stzGrid( This.List() )
		bResult = FALSE

		if oTempGrid.NumberOfVLines() = 2

			aFirstVLine = oTempGrid.VLine(1)

			if ListIsSet(aFirstVLine) and ListItemsAreAllStrings(aFirstVLine)
				bResult = TRUE
			ok
		ok
		return bResult
		*/

		# All items are list of 2 items, where the 1st beeing string
		# TODO: The strings in the 1st column (keys of the hashlist) must be unique

		bResult = TRUE
		aTempKeys = []

		nLen = This.NumberOfItems()
		aContent = This.Content()

		for i = 1 to nLen

			if NOT ( isList(aContent[i]) and len(aContent[i]) = 2 and
				 isString(aContent[i][1]) )

				bResult = FALSE
				exit
			else
				if ring_find(aTempKeys, aContent[i][1]) > 0
					bResult = FALSE
					exit
				ok

				aTempKeys + aContent[i][1]
			ok
		next

		return bResult

		def IsAHashList()
			return This.IsHashList()

		def IsNotHashList()
			return NOT This.IsHashList()

		def IsNotAHashList()
			return This.IsHashList()
	
	def AllItemsAreHashLists()
		if This.NumberOfItems() = 0
			return FALSE
		ok

		bResult = TRUE
		for item in This.List()
			if NOT isList(item)
				bResult = FALSE
				exit
			ok

			if NOT StzListQ(item).IsHashList()
				bResult = FALSE
				exit
			ok
		next
		return bResult

		#< @FunctionAlternativeForms

		def ContainsOnlyHashLists()
			return This.AllItemsAreHashLists()
	
		def IsListOfHashLists()
			return This.AllItemsAreHashLists()

		#>

	def IsHashListOrListOfStrings()
		if This.IsListOfStrings() or This.IsHashList()
			return TRUE
		else
			return FALSE
		ok

		def IsListOfStringsOrHashList()
			return This.IsHashListOrListOfStrings()

	def ItemsAreListsOfSameSize()
		if This.NumberOfItems() = 0
			return FALSE
		ok

		bResult = FALSE

		if This.AllItemsAreLists()
			bSame = TRUE
			for i = 2 to This.NumberOfItems()
				if len(Item(i)) != len(Item(i-1))
					bSame = FALSE
				ok
			next
			if bSame
				bResult = TRUE
			ok
		ok

		return bResult

		def AllItemsAreListsOfSameSize()
			return This.ItemsAreListsOfSameSize()

	def ItemsAreSets()
		if This.NumberOfItems() = 0
			return FALSE
		ok

		bResult = TRUE

		for item in This.List()
			if NOT ListIsSet(item)
				bResult = FALSE
				exit
			ok
		end

		return bResult

		def AllItemsAreSets()
			return This.ItemsAreSets()

	def IsListOfStrings()
		if This.NumberOfItems() = 0
			return FALSE
		ok

		bResult = TRUE
		aTempList = This.List()
		nLen = len(aTempList)

		for i = 1 to nLen
			if NOT isString(aTempList[i])
				bResult = FALSE
				exit
			ok
		next

		return bResult

		#< @FunctionAlternativeForm

		def IsAListOfStrings()
			return This.IsListOfStrings()

		#>

		#< @FunctionMisspelledForm

		def IsListOfSrtrings()
			return This.IsListOfStrings()

		#>

	def IsListOfChars()
		if This.NumberOfItems() = 0
			return FALSE
		ok

		bResult = TRUE
		aContent = This.Content()
		nLen = len(aContent)

		for i = 1 to nLen

			item = aContent[i]
			if NOT ( (isString(item) or isNumber(item))  and Q(item).IsAChar())

				bResult = FALSE
				exit
			ok
		next

		return bResult

		def IsAListOfChars()
			return This.IsListOfChars()

	def IsListOfLetters()
		if This.NumberOfItems() = 0
			return FALSE
		ok

		bResult = TRUE

		for item in This.List()
			if NOT ( isString(item) and
				 StzStringQ(item).IsLetter() )

				bResult = FALSE
				exit
			ok
		next

		return bResult

		def IsAListOfLetters()
			return This.IsListOfLetters()

	def IsListOfNumbers()
		if This.NumberOfItems() = 0
			return FALSE
		ok

		return This.AllItemsAreNumbers()

		def IsAListOfNumbers()
			return This.IsListOfNumbers()

	def IsListOfNumbersInStrings()
		bResult = TRUE

		for item in This.List()
			if NOT ( isString(item) and Q(item).IsNumberInString() )
				bResult = FALSE
				exit
			ok
		next

		return bResult

	def IsListOfLists()
		if This.NumberOfItems() = 0
			return FALSE
		ok

		return This.AllItemsAreLists()

		def IsAListOfLists()
			return This.IsListOfLists()

	def IsListOfSets()
		if This.NumberOfItems() = 0
			return FALSE
		ok

		return This.AllItemsAreSets()

		def IsAListOfSets()
			return This.IsAListOfSets()

	def IsListOfNumbersOrStrings()
		if This.IsListOfNumbers() or
		   This.IsListOfStrings() or
		   This.ISListOfNumbersAndStrings()

			return TRUE
		else
			return FALSE
		ok

		def IsListOfStringsOrNumbers()
			return This.IsListOfNumbersOrStrings()

		def IsAListOfNumbersOrStrings()
			return This.IsListOfNumbersOrStrings()

		def IsAListOfStringsOrNumbers()
			return This.IsListOfNumbersOrStrings()

	def IsListOfNumbersAndStrings()
		bResult = TRUE
		for item in This.List()
			if NOT (isString(item) or isNumber(item))
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def IsListOfStringsAndNumbers()
			return This.IsListOfNumbersAndStrings()

		def IsAListOfNumbersAndStrings()
			return This.IsListOfNumbersAndStrings()

		def IsAListOfStringsAndNumbers()
			return This.IsListOfNumbersAndStrings()

	def IsListOfEitherNumbersOrStrings()
		if This.IsListOfNumbers() or This.IsListOfStrings()
			return TRUE
		else
			return FALSE
		ok

		def IsListOfEitherStringsOrNumbers()
			return This.IsListOfEitherNumbersOrStrings()

		def IsAListOfEitherNumbersOrStrings()
			return This.IsListOfEitherNumbersOrStrings()

		def IsAListOfEitherStringsOrNumbers()
			return This.IsListOfEitherNumbersOrStrings()

	def IsListOfNumbersAndPairsOfNumbers()
		bResult = TRUE

		for item in This.List()
			if NOT 	( isNumber(item) or
					( isList(item) and Q(item).IsPairOfNumbers() )
				)
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def IsAListOfNumbersAndPairsOfNumbers()
			return This.IsListOfNumbersAndPairsOfNumbers()

	def IsPair()
		return This.NumberOfItems() = 2

		def IsPairQ()
			if This.IsPair()
				return This
			else
				return StzFalseObjectQ()
			ok

		def IsAPair()
			return This.IsPair()

			def IsAPairQ()
				return This.IsPairQ()

	def IsPairOfStrings()
		return This.IsPair() and This.IsListOfStrings()

		def IsAPairOfStrings()
			return This.IsPairOfStrings()

	def IsListOfPairsOfStrings()
		/*
		Coud be solved nicely like this:

			if This.IsListOfPairs() and
			   Check('Q(@EachItem).IsPairOfStrings()' ) = TRUE
	
				return TRUE
			else
				return FALSE
			ok

		But the following solution is more performant...
		*/

		bResult = TRUE

		for item in This.List()
			if NOT ( isList(item) and Q(item).IsPairOfStrings() )
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def IsAListOfPairsOfStrings()
			return This.IsListOfPairsOfStrings()

	def IsPairOfNumbers()
		return This.IsPair() and This.IsListOfNumbers()

		def IsAPairOfNumbers()
			return This.IsPairOfNumbers()

		def IsSection()
			return This.IsPairOfNumbers()

		def IsASection()
			return This.IsPairOfNumbers()

	def IsListOfPairsOfNumbers()

		bResult = TRUE

		for item in This.List()
			if NOT ( isList(item) and Q(item).IsPairOfNumbers() )
				bResult = FALSE
				exit
			ok
		next

		return bResult

		#< @FunctionAlternativeForms

		def IsAListOfPairsOfNumbers()
			return This.IsListOfPairsOfNumbers()

		def IsListOfSections()
			return This.IsListOfPairsOfNumbers()

		def IsAListOfSections()
			return This.IsListOfPairsOfNumbers()

		#>

	def IsPairOfSections()
		aContent = This.Content()
		nLen = len(aContent)

		if isList(aContent[1]) and
		   isList(aContent[2]) and
		   Q(aContent[1]).IsPairOfNumbers() and
		   Q(aContent[2]).IsPairOfNumbers()

			return TRUE

		else
			return FALSE
		ok

	def IsListOfPairsOfSections()
		aContent = This.Content()
		nLen = len(aContent)

		bResult = TRUE

		for i = 1 to nLen
			if NOT (isList(aContent[i]) and Q(aContent[i]).IsPairOfSections())
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def IsAListOfPairsOfSections()
			return This.IsListOfPairsOfSections

	def IsPairOfLists()
		return This.IsPair() and This.IsListOfLists()

		def IsAPairOfLists()
			return This.IsPairOfLists()

	def IsListOfPairsOfLists()

		bResult = TRUE

		for item in This.List()
			if NOT ( isList(item) and Q(item).IsPairOfLists() )
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def IsAListOfPairsOfLists()
			return This.IsListOfPairsOfLists()

	def IsPairOfObjects()
		return This.IsPair() and This.IsListOfObjects()

		def IsAPairOfObjects()
			return This.IsPairOfObjects()

	def IsListOfPairsOfObjects()

		bResult = TRUE

		for item in This.List()
			if NOT ( isList(item) and Q(item).IsPairOfObjects() )
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def IsAListOfPairsOfObjects()
			return This.IsListOfPairsOfObjects()

	def IsPairAndKeyIsString()
		return This.IsPair() and isString(This[1])

		def IsAPairAndKeyIsString()
			return IsPairAndKeyIsString()

		def IsPairAndKeyIsAString()
			return This.IsPairAndKeyIsString()

		def IsAPairAndKeyIsAString()
			return This.IsPairAndKeyIsString()

	def IsListOfObjects()
		bResult = TRUE
		for item in This.List()
			if NOT isObject(item)
				bREsult = FALSE
				exit
			ok
		next

		return bResult

		def IsAListOfObjects()
			return This.IsListOfObjects()

	def IsPairStzObjects()
		return This.IsPair() and This.IsListOfStzObjects()

		def IsAPairStzObjects()
			return This.IsPairStzObjects()

	def IsListOfStzObjects()
		bResult = TRUE
		for item in This.List()
			if NOT @IsStzObjet(item)
				bREsult = FALSE
				exit
			ok
		next

		return bResult

		def IsAListOfStzObjects()
			return This.IsListOfStzObjects()

	def IsPairOfStzNumbers()
		return This.IsPair() and This.IsListOfStzNumbers()

		def IsAPairOfStzNumbers()
			return This.IsPairOfStzNumbers()

	def IsListOfStzNumbers()
		bResult = TRUE
		for item in This.List()
			if NOT @IsStzNumber(item)
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def IsAListOfStzNumbers()
			return This.IsListOfStzNumbers()

	def IsPairOfStzStrings()
		return This.IsPair() and This.IsListOfStzStrings()

	def IsListOfStzStrings()
		bResult = TRUE
		for item in This.List()
			if NOT @IsStzString(item)
				bREsult = FALSE
				exit
			ok
		next

		return bResult

		def IsAListOfStzStrings()
			return This.IsListOfStzStrings()

	def IsPairOfStzLists()
		return This.IsPair() and This.IsListOfStzLists()

		def IsAPairOfStzLists()
			return This.IsPairOfStzLists()

	def IsListOfStzLists()
		bResult = TRUE
		for item in This.List()
			if NOT @IsStzList(item)
				bREsult = FALSE
				exit
			ok
		next

		return bResult

		def IsAListOfStzLists()
			return This.IsListOfStzLists()

	#--

	def IsNamedObject()
		if This.IsPairOfStringAndObject()
			return TRUE
		else
			return FALSE
		ok

	def IsListOfNamedObjects()
		bResult = TRUE

		aContent = This.Content()
		nLen = len(aContent)

		for i = 1 to nLen
			if NOT ( isList(aContent[i]) and Q(aContent[i]).IsNamedObject() )
				bResult = FALSE
				exit
			ok
		next

		return bResult

	#--

	def IsPairOfNumberAndString()
		if This.NumberOfItems() = 2 and isNumber(This.Item(1)) and isString(This.Item(2))
			return TRUE
		else
			return FALSE
		ok

		def IsAPairOfNumberAndString()
			return This.IsPairOfNumberAndString()

		def IsPairOfANumberAndAString()
			return This.IsPairOfNumberAndString()

		def IsAPairOfANumberAndAString()
			return This.IsPairOfNumberAndString()

	def IsPairOfStringAndNumber()
		if This.NumberOfItems() = 2 and isString(This.Item(1)) and isNumber(This.Item(2))
			return TRUE
		else
			return FALSE
		ok

		def IsAPairOfStringAndNumber()
			return This.IsPairOfStringAndNumber()

		def IsPairOfAStringAndANumber()
			return This.IsPairOfStringAndNumber()

		def IsAPairOfAStringAndANumber()
			return This.IsPairOfStringAndNumber()

	def IsPairOfNumberAndList()
		if This.NumberOfItems() = 2 and isNumber(This.Item(1)) and isList(This.Item(2))
			return TRUE
		else
			return FALSE
		ok

		def IsAPairOfNumberAndList()
			return This.IsPairOfNumberAndList()

		def IsPairOfANumberAndAList()
			return This.IsPairOfNumberAndList()

		def IsAPairOfANumberAndAList()
			return This.IsPairOfNumberAndList()

	def IsPairOfListAndNumber()
		if This.NumberOfItems() = 2 and isList(This.Item(1)) and isNumber(This.Item(2))
			return TRUE
		else
			return FALSE
		ok

		def IsAPairOfListAndNumber()
			return This.IsPairOfListAndNumber()

		def IsPairOfAListAndANumber()
			return This.IsPairOfListAndNumber()

		def IsAPairOfAListAndANumber()
			return This.IsPairOfListAndNumber()

	def IsPairOfNumberAndObject()
		if This.NumberOfItems() = 2 and isNumber(This.Item(1)) and isObject(This.Item(2))
			return TRUE
		else
			return FALSE
		ok

		def IsAPairOfNumberAndObject()
			return This.IsPairOfNumberAndObject()

		def IsPairOfANumberAndAnObject()
			return This.IsPairOfNumberAndObject()

		def IsAPairOfANumberAndAnObject()
			return This.IsPairOfNumberAndObject()

	def IsPairOfObjectAndNumber()
		if This.NumberOfItems() = 2 and isObject(This.Item(1)) and isNumber(This.Item(2))
			return TRUE
		else
			return FALSE
		ok

		def IsAPairOfObjectAndNumber()
			return This.IsPairOfObjectAndNumber()

		def IsPairOfAnObjectAndANumber()
			return This.IsPairOfObjectAndNumber()

		def IsAPairOfAnObjectAndANumber()
			return This.IsPairOfObjectAndNumber()

	def IsPairOfStringAndList()
		if This.NumberOfItems() = 2 and isString(This.Item(1)) and isList(This.Item(2))
			return TRUE
		else
			return FALSE
		ok

		def IsAPairOfStringAndList()
			return This.IsPairOfStringAndList()

		def IsPairOfAStringAndAList()
			return This.IsPairOfStringAndList()

		def IsAPairOfAStringAndAList()
			return This.IsPairOfStringAndList()

	def IsPairOfListAndString()
		if This.NumberOfItems() = 2 and isList(This.Item(1)) and isString(This.Item(2))
			return TRUE
		else
			return FALSE
		ok

		def IsAPairOfListAndString()
			return This.IsPairOfListAndString()

		def IsPairOfAListAndAString()
			return This.IsPairOfListAndString()

		def IsAPairOfAListAndAString()
			return This.IsPairOfListAndString()

	def IsPairOfStringAndObject()
		if This.NumberOfItems() = 2 and isString(This.Item(1)) and isObject(This.Item(2))
			return TRUE
		else
			return FALSE
		ok

		def IsAPairOfStringAndObject()
			return This.IsPairOfStringAndObject()

		def IsPairOfAStringAndAnObject()
			return This.IsPairOfStringAndObject()

		def IsAPairOfAStringAndAnObject()
			return This.IsPairOfStringAndObject()

	def IsPairOfObjectAndString()
		if This.NumberOfItems() = 2 and isObject(This.Item(1)) and isString(This.Item(2))
			return TRUE
		else
			return FALSE
		ok

		def IsAPairOfObjectAndString()
			return This.IsAPairOfObjectAndString()

		def IsPairOfAnObjectAndAString()
			return This.IsAPairOfObjectAndString()

		def IsAPairOfAnObjectAndAString()
			return This.IsAPairOfObjectAndString()

	def IsPairOfListAndObject()
		if This.NumberOfItems() = 2 and isList(This.Item(1)) and isObject(This.Item(2))
			return TRUE
		else
			return FALSE
		ok

		def IsAPairOfListAndObject()
			return This.IsPairOfListAndObject()

		def IsPairOfAListAndAnObject()
			return This.IsPairOfListAndObject()

		def IsAPairOfAListAndAnObject()
			return This.IsPairOfListAndObject()

	#--

	def IsPairOfStzObjects()
		return This.IsPair() and This.IsListOfStzObjects()

		def IsAPairOfStzObjects()
			return This.IsPairOfStzObjects()

	def IsPairOfChars()
		return This.IsPair() and This.IsListOf(:Chars)

		def IsAPairOfChars()
			return This.IsPairOfChars()

	def IsPairOf(pcType)
		return This.IsPair() and This.IsListOf(pcType)

		def IsAPairOf(pcType)
			return This.IsPairOf(pcType)

	def IsListOf(pcType)
		/* EXAMPLES

			Q([ 1, 2, 3 ]).IsListOf(:Number)	#--> TRUE

			pcType should be a string containing the name of:
				- a string containing one of the 4 Ring types (given by RingTypes() )
				- a Softanza type ( given by StzTypes() )

			For the sake of expressiveness, pcType can be in plural form:

			Q([ 1, 2, 3 ]).IsListOf(:Numbers)

		*/

		pcType = Q(pcType).InfereType()

		cCode1 = 'bOk = item.IsA' + pcType + '()'
		cCode2 = 'bOk = ( ring_type(item) = "' + upper(pcType) + '" )'

		bResult = TRUE
		aList = This.List()
		nLen = len(aList)

		for i = 1 to nLen
			item = aList[i]

			if isObject(item) and Q( ring_classname(item) ).IsStzClassName()
				eval(cCode1)

			else
				eval(cCode2)
			ok

			if NOT bOk
				bResult = FALSE
				exit
			ok
		next

		return bResult


		def IsAListOf(pcType)
			return This.IsListOf(pcType)
		
	def IsListOfPairs()
		/* NOTE

		Could be solved nicely like this:

		bResult = This.Check( :That = 'isList(@item) and Q(@item).IsPair()' )
		return bResult

		But the following solution is more performant:
		*/

		bResult = TRUE
		nLen = This.NumberOfItems()
		aContent = This.Content()

		for i = 1 to nLen
			
			if NOT ( isList(aContent[i]) and len(aContent[i]) = 2 )
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def IsAListOfPairs()
			return This.IsListOfPairs()

	def IsTree()
		if NOT This.IsEmpty()
			return TRUE

		else
			return FALSE
		ok

		def IsATree()
			return This.IsTree()

	def IsStzTree()
		if This.StzClassName() = "stztree"
			return TRUE
		else
			return FALSE
		ok

		def IsAStzTree()
			return This.IsStzTree()

	def IsTable() # TODO: Review this solution
		try
			new stzTable(This.List())
			return TRUE
		catch
			return FALSE
		done

	def IsPivotTable() # TODO
		/* ... */
		StzRaise("Inexistant feature in this release!")

		def IsAPivotTable()
			return This.IsPivotTable()

	def IsGraph() # TODO
		/* ... */
		StzRaise("Inexistant feature in this release!")

	  #----------------------------#
	 #   SAME TYPE & SAME VALUE   #
	#----------------------------#

	def ItemsHaveSameType()
		return This.IsPureList()

	def ItemsHaveSameValue()
		aContent = This.Content()
		nLen = len(aContent)

		bResult = TRUE
		if This.ItemsHaveSameType()
			if This.ItemsAreAllNumbers() or This.ItemsAreAllStrings()
				for i = 2 to nLen		
					if aContent[i] != aContent[i-1]
						bResult = FALSE
						exit
					ok
				next

			but This.ItemsAreAllLists()
				for i = 2 to nLen
					oTempList = new stzList(aContent[i])
					if oTempList.IsEqualTo(aContent[i-1])
						bResult = FALSE
						exit
					ok
				next

			but ItemsAreAllObjects()
				StzRaise("Can't compare between objects!")
			
			else
				StzRaise("Unsupported type!")
			ok
		else
			bResult = FALSE
		ok

		return bResult

	  #----------------------#
	 #     LIST CONTENT     #
	#----------------------#

	/* NOTE

	All the functions in this section could be implemented easily
	using Condition-Coding. So for example, ContainsOnlyNumbers()
	can be solved like this:

		This.Check( :That = 'type(@item) = "NUMBER"' )

	Despite of this, we provide them here, because they are implemented
	in brute Ring code, and not in run-time evaluated code like in Check(),
	which is better for performance (especially when these functions are
	used in large lists and in deep for-loops.

	*/

	def ContainsOnlyNumbers()

		bResult = TRUE
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen

			if NOT isNumber(aContent[i])
				bResult = FALSE
				exit
			ok

		next

		return bResult

		def ItemsAreAllNumbers()
			return This.ContainsOnlyNumbers()

		def AllItemsAreNumbers()
			return This.ContainsOnlyNumbers()

		def IsMadeOfNumbers()
			return This.ContainsOnlyNumbers()

	def ContainsOnlyOddNumbers()
		
		bResult = TRUE
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen

			if NOT isNumber(aContent[i])
				bResult = FALSE
				exit
			ok

			if NOT OddOrEven(aContent[i]) = :Odd
				bResult = FALSE
				exit
			ok

		next
		return bResult

		def ItemsAreAllOddNumbers()
			return This.ContainsOnlyOddNumbers()

		def AllItemsAreOddNumbers()
			return This.ContainsOnlyOddNumbers()

		def IsMadeOfOddNumbers()
			return This.ContainsOnlyOddNumbers()

	def ContainsOnlyEvenNumbers()

		bResult = TRUE
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen

			if NOT isNumber(aContent[i])
				bResult = FALSE
				exit
			ok

			if NOT OddOrEven(aContent[i]) = :Even
				bResult = FALSE
				exit
			ok

		next
		return bResult

		def ItemsAreAllEvenNumbers()
			return This.ContainsOnlyEvenNumbers()

		def AllItemsAreEvenNumbers()
			return This.ContainsOnlyEvenNumbers()

		def IsMadeOfEvenNumbers()
			return This.ContainsOnlyEvenNumbers()

	def ContainsOnlyDigits()

		bResult = TRUE
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen

			if NOT ( isNumber(aContent[i]) and aContent[i] >= 0 and aContent[i] < 10 )
				bResult = FALSE
				exit
			ok

		next
		return bResult

		def ItemsAreAllDigits()
			return This.ContainsOnlyDigits()

		def AllItemsAreDigits()
			return This.ContainsOnlyDigits()

		def IsMadeOfDigits()
			return This.ContainsOnlyDigits()

	def ContainsOnlyStrings()

		bResult = TRUE
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen

			if NOT isString(aContent[i])
				bResult = FALSE
				exit
			ok

		next
		return bResult


		def ItemsAreAllStrings()
			return This.ContainsOnlyStrings()

		def AllItemsAreStrings()
			return This.ContainsOnlyStrings()

		def IsMadeOfStrings()
			return This.ContainsOnlyStrings()

	  #-----------------------------------#
	 #  CHECKING IF ALL ITEMS ARE EQUAL  #
	#-----------------------------------#

	def ItemsAreAllEqualCS(pCaseSensitive)

		nLen = This.NumberOfItems()
		if nLen = 0
			return FALSE
		but nLen = 1
			return TRUE
		ok

		aContent = This.Content()

		oFirstItem = Q(aContent[1])


		bResult = TRUE
		for i = 2 to nLen

			if isNumber(aContent[i])
				if NOT aContent[i] = aContent[1]
					bResult = FALSE
					exit
				ok

			but isString(aContent[i]) or isList(aContent[i])
				if NOT oFirstItem.IsEqualtToCS(aContent[i])
					bResult = FALSE
					exit
				ok

			else // isObject(aContent[i])
				if NOT oFirstItem.IsEqualTo(aContent[i])
					bResult = FALSE
					exit
				ok
			ok
		next

		return bResult
		
		#< @FunctionAlternativeForms

		def ItemsAreEqualCS(pCaseSensitive)
			return This.ItemsAreAllEqualCS(pCaseSensitive)

		def AllItemsAreEqualCS(pCaseSensitive)
			return This.ItemsAreAllEqualCS(pCaseSensitive)

		def AreEqualCS(pCaseSensitive)
			return This.ItemsAreAllEqualCS(pCaseSensitive)

		#>

	#-- CASESENSITIVITY

	def ItemsAreAllEqual()
		return This.ItemsAreAllEqualCS(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ItemsAreEqual()
			return This.ItemsAreAllEqual()

		def AllItemsAreEqual()
			return This.ItemsAreAllEqual()

		def AreEqual(pCaseSensitive)
			return This.ItemsAreAllEqual()

		#>


	  #----------------------------------------------------#
	 #  CHECKING IF ALL ITEMS ARE EQUAL TO A GIVEN VALUE  #
	#----------------------------------------------------#

	def ItemsAreAllEqualTo(pValue)
		bResult = TRUE
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen
			
			if NOT Q(aContent[i]).IsEqualTo(pValue)
				bResult = FALSE
				exit
			ok

		next
		return bResult

		def AllItemsAreEqualTo(pValue)
			return This.AllItemsAreEqualTo(pValue)

		def IsMadeOfItemsEqualTo(pValue)
			return This.AllItemsAreEqualTo(pValue)

	  #------------------------------------------#
	 #  CHECKING IF ALL ITEMS ARE NULL STRINGS  #
	#------------------------------------------#

	def ContainsOnlyNullStrings()

		bResult = TRUE

		aContent = This.Content()
		nLen = len(aContent)

		for i = 1 to nLen

			item = aContent[i]

			if NOT isString(item) or
			   ( isString(item) and item != "" )

				bResult = FALSE
				exit
			ok

		next

		return bResult

		#< @FunctionAlternativeForms

		def ContainsOnlyEmptyStrings()
			return This.ContainsOnlyNullStrings()

		def ItemsAreAllNullStrings()
			return This.ContainsOnlyNullStrings()

		def ItemsAreAllEmptyStrings()
			return This.ContainsOnlyNullStrings()

		def AllItemsAreNullStrings()
			return This.ContainsOnlyNullStrings()

		def AllItemsAreNull()
			return This.ContainsOnlyNullStrings()

		def AllItemsAreEmptyStrings()
			return This.ContainsOnlyNullStrings()

		def ItemsAreNull()
			return This.ContainsOnlyNullStrings()

		def ItemsAreNullStrings()
			return This.ContainsOnlyNullStrings()

		def IsMadeOfNullStrings()
			return This.ContainsOnlyNullStrings()

		def IsMadeOfEmptyStrings()
			return This.ContainsOnlyNullStrings()

		#>

	  #-----------------------------------#
	 #  CHECKING IF ALL ITEMS ARE LISTS  #
	#-----------------------------------#

	def ContainsOnlyLists()
		bResult = TRUE
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen

			if NOT isList(aContent[i])
				bResult = FALSE
				exit
			ok

		next
		return bResult

		def ItemsAreAllLists()
			return This.ContainsOnlyLists()

		def AllItemsAreLists()
			return This.ContainsOnlyLists()

		def IsMadeOfLists()
			return This.ContainsOnlyLists()

	  #-----------------------------------#
	 #  CHECKING IF ALL ITEMS ARE PAIRS  #
	#-----------------------------------#

	def AllItemsArePairs()
		bResult = TRUE
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen

			if (NOT isList(aContent[i]) and len(aContent[i]) = 2)
				bResult = FALSE
				exit
			ok

		next
		return bResult

	  #----------------------------------------------#
	 #  CHECKING IF ALL ITEMS ARE PAIRS OF NUMBERS  #
	#----------------------------------------------#

	def AllItemsArePairsOfNumbers()
		bResult = TRUE
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen

			if NOT (isList(aContent[i]) and len(aContent[i]) = 2 and
				isNumber(aContent[i][1]) and isNumber(aContent[i][2]))

				bResult = FALSE
				exit
			ok

		next
		return bResult

		def IsMadeOfPairsOfNumbers()
			return This.AllItemsArePairsOfNumbers()

	  #----------------------------------------------#
	 #  CHECKING IF ALL ITEMS ARE PAIRS OF STRINGS  #
	#----------------------------------------------#

	def AllItemsArePairsOfStrings()
		bResult = TRUE
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen

			if NOT (isList(aContent[i]) and len(aContent[i]) = 2 and
				isString(aContent[i][1]) and isString(aContent[i][2]))

				bResult = FALSE
				exit
			ok

		next
		return bResult

		def IsMadeOfPairsOfStrings()
			return This.AllItemsArePairsOfStrings()

	  #--------------------------------------------#
	 #  CHECKING IF ALL ITEMS ARE PAIRS OF LISTS  #
	#--------------------------------------------#

	def AllItemsArePairsOfLists()
		bResult = TRUE
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen
			
			if NOT (isList(aContent[i]) and len(aContent[i]) = 2 and
				isList(aContent[i][1]) and isList(aContent[i][2]))

				bResult = FALSE
				exit
			ok

		next
		return bResult

		def IsMadeOfPairsOfLists()
			return This.AllItemsArePairsOfLists()

	  #----------------------------------------------#
	 #  CHECKING IF ALL ITEMS ARE PAIRS OF OBJECTS  #
	#----------------------------------------------#

	def AllItemsArePairsOfObjects()
		aContent = This.Content()
		nLen = len(aContent)

		bResult = TRUE

		for i = 1 to nLen

			if NOT (isList(aContent[i]) and len(aContent[i]) = 2 and
				isObjects(aContent[i][1]) and isObject(aContent[i][2]))

				bResult = FALSE
				exit
			ok

		next
		return bResult

		def IsMadeOfPairsOfObjects()
			return This.AllItemsArePairsOfObjects()

	  #-----------------------------------------#
	 #  CHECKING IF ALL ITEMS ARE EMPTY LISTS  #
	#-----------------------------------------#

	def ContainsOnlyEmptyLists()
		bResult = TRUE
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen
			
			if NOT ( isList(aContent[i]) and len(aContent[i]) = 0 )
				bResult = FALSE
				exit
			ok

		next
		return bResult

		def ItemsAreAllEmptyLists()
			return This.ContainsOnlyEmptyLists()

		def AllItemsAreEmptyLists()
			return This.ContainsOnlyEmptyLists()

		def MadeOfEmptyLists()
			return This.ContainsOnlyEmptyLists()

	  #---------------------------------------------------------------#
	 #  CHECKING IF ALL ITEMS ARE LISTS HAVING SAME NUMBER OF ITEMS  #
	#---------------------------------------------------------------#

	def ContainsOnlyListsWithSameNumberOfItems()
		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return FALSE
		ok

		if NOT isList(aContent[1])
			return FALSE
		ok

		nLenFirst = len(aContent[1])
		if nLenFirst = 1
			return TRUE
		ok

		bResult = TRUE

		for i = 2 to nLen

			if NOT ( isList(aContent[i]) and len(aContent[i]) = nLen )
				bResult = FALSE
				exit
			ok

		next
		return bResult

		def ItemsAreAllListsWithSameNumberOfItems()
			return This.ContainsOnlyListsWithSameNumberOfItems()

		def AllItemsAreListsWithSameNumberOfItems()
			return This.ContainsOnlyListsWithSameNumberOfItems()

		def IsMadeOfListsWithSameNumberOfItems()
			return This.ContainsOnlyListsWithSameNumberOfItems()

	  #-------------------------------------#
	 #  CHECKING IF ALL ITEMS ARE OBJECTS  #
	#-------------------------------------#

	def ContainsOnlyObjects()
		bResult = TRUE
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen
			
			if NOT isObject(aContent[i])
				bResult = FALSE
				exit
			ok

		next
		return bResult

		def ItemsAreAllObjects()
			return This.ContainsOnlyObjects()

		def AllItemsAreObjects()
			return This.ContainsOnlyObjects()

		def IsMadeOfObjects()
			return This.ContainsOnlyObjects()

	  #-----------------------------------------------------------------#
	 #  CHECKING IF ALL ITEMS ARE STRINGS CONTAINING VALID RING CODES  #
	#-----------------------------------------------------------------#

	def ContainsOnlyValidRingCodes()
		bResult = TRUE

		if NOT This.IsListOfStrings()
			return FALSE
		ok

		nLen = This.NumberOfItems()
		aContent = This.Content()

		for i = 1 to nLen

			if NOT Q(aContent[i]).IsValidRingCode()
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def AllItemsAreValidRingCodes()
			return This.ContainsOnlyValidRingCodes()

		def ItemsAreAllValidRingCodes()
			return This.ContainsOnlyValidRingCodes()

		def IsMadeOfValidRingCodes()
			return This.ContainsOnlyValidRingCodes()

	  #---------------------------------------------------------------------#
	 #  CHECKING IF ALL ITEMS ARE STRINGS CONTAINING SOFTANZA CLASS NAMES  #
	#---------------------------------------------------------------------#

	def ContainsOnlyStzClassNames()
		bResult = TRUE

		if NOT This.IsListOfStrings()
			return FALSE
		ok

		nLen = This.NumberOfItems()
		aContent = This.Content()

		for i = 1 to nLen

			if NOT Q(aContent[i]).IsStzClassName()
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def AllItemsAreStzClassNames()
			return This.ContainsOnlyStzClassNames()

		def ItemsAreAllStzClassNames()
			return This.ContainsOnlyStzClassNames()

		def IsMadeOfStzClassNames()
			return This.ContainsOnlyStzClassNames()

	  #======================#
	 #   MANAGING WALKERS   # TODO
	#======================#

	def AddWalker(pcName, pnStart, pnEnd, panStepping)

		if NOT ( StzNumberQ(pnStart).IsBetween(1, This.NumberOfItems()) and
		         StzNumberQ(pnEnd).IsBetween(1, This.NumberOfItems()) )

			StzRaise("Start or end of walker outside list range!")
		ok

		bNewName = TRUE
		for aWalk in This.Walkers()
			if aWalk[1] = pcName
				bNewName = FALSE
				exit
			ok
		next

		if NOT bNewName
			StzRaise(stzListError(:CanNotAddWalkerAlreadyExistant))
		else
			oWalk = new stzWalker(pnStart, pnEnd, panStepping)
			@aWalkers + [ pcName, oWalk.Content() ]
		ok

	def Walkers()
		return @aWalkers

	def Walker(pcWalker)
		return This.Walkers()[pcWalker]

	def FindWalker(pcWalker) # TODO
		/* ... */
		StzRaise("Inexistant feature in this release!")

	def RemoveWalker(pcWalker)
		del( @aWalkers, This.FindWalker(pcWalker) )

	def RemoveTheseWalkers(pacNames) # TODO
		/* ... */
		StzRaise("Inexistant feature in this release!")

	def RemoveWalkers()
		@aWalkers = []

		def RemoveAllWalkers()
			This.RemoveWalkers()

	def CombineTheseWalkers(pacNames) # TODO
		/* ... */
		StzRaise("Inexistant feature in this release!")

		def ComposeTheseWalkers(pacNames)
			return This.CombineTheseWalkers(pacNames)

	def CombineWalkers()
		/* ... */
		StzRaise("Inexistant feature in this release!")

		def CombineAllWalkers()
			This.CombineWalkers()

		def ComposeWalkers()
			This.CombineWalkers()

		def ComposeAllWalkers()
			This.CombineWalkers()

	def CombinedWalkers() # TODO
		/* ... */
		StzRaise("Inexistant feature in this release!")

		def ComposedWalkers()
			return This.CombinedWalkers()

	  #=================#
	 #  WALKING WHERE  #
	#=================#

	def WalkWhere(pcCondition)
		return This.WalkWhereXT(pcCondition, :Forward, :Return = :WalkedPositions)

		def WalkW(pcCondition)
			if isList(pcCondition) and Q(pcCondition).IsWhereNamedParam()
				pcCondition = pcCondition[2]
			ok

			return This.WalkWhere(pcCondition)

	def WalkWhereXT(pcCondition, pcDirection, pReturn)
		/*
		o1 = new stzList([ 1, "A", 3, "B", "_", 6 ])

		? WalkWhere("isNumber(@item)")
		#--> [1, 3, 6]
		*/

		# Checking params

		if NOT isString(pcCondition)
			StzRaise("Incorrect param type! pcCondition must be a string.")
		ok

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		if pReturn = :Default
			pReturn = :WalkedPositions
		ok

		if isList(pcDirection) and Q(pcDirection).IsOneOfTheseNamedParams([ :Direction, :Going ])
			pcDirection = pcDirection[2]
		ok

		if NOT ( isString(pcDirection) and
			 Q(pcDirection).IsOneOfThese([ :Forward, :Backward, :Default ]) )

			StzRaise("Incorrect param type! pcDirection must be one of these strings [ :Forward, :Backward, :Default ].")
		ok

		if pcDirection = :Default
			pcDirection = :Forward
		ok

		# Doing the job

		anPositions = []

		cCode = 'bOk = (' + StzCCodeQ(pcCondition).Transpiled() + ' )'

		anPositions = []
		nLen = This.NumberOfItems()

		nStart = 1
		nEnd   = nLen
		nStep  = 1

		if pcDirection = :Backward
			nStart = nLen
			nEnd   = 1
			nStep  = -1
		ok

		for @i = nStart to nEnd step nStep
			
			eval(cCode)

			if bOk
				anPositions + @i
			ok
	
		next

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end

		def WalkWXT(pcCondition, pReturn)
			if isList(pcCondition) and Q(pcCondition).IsWhereNamedParam()
				pcCondition = pcCondition[2]
			ok

			return This.WalkWhereXT(pcCondition, pReturn)

	  #============================================#
	 #  WALKING UNTIL (AND WALKING UNTIL BEFORE)  #
	#============================================#

	def WalkUntil(pcCondition)
		return This.WalkUntilXT(pcCondition, :Forward, :WalkedPositions)

	def WalkUntilBefore(pcCondition)
		return This.WalkUntil( :Before = pcCondition )

	def WalkUntilXT(pcCondition, pcDirection, pReturn)
		/*
		[ "A", "B", 12, "C", "D", "E", 4, "F", 25, "G", "H" ]

		WalkUntil("@item = 'D'", :Return = :WalkedPositions  )  #--> 1:5
		WalkUntil("@item = 'D'", :Return = :LastPosition )  #--> 5

		WalkUntil("@item = 'D'", :Return = :WalkedItems )
		#--> [ "A", "B", 12, "C", "D" ]

		WalkUntil("@item = 'D'", :Return = :LastItem ) #--> "D"


		WalkUntil("isNumber(@item)") #--> 1:3
		WalkUntil("isNumber(@item) and @item > 20") #--> 1:9
		*/

		bWalkBefore = FALSE

		# Checking the params

		if isList(pcCondition) and Q(pcCondition).IsBeforeNamedParam()
			bWalkBefore = TRUE
			pcCondition = pcCondition[2]
		ok

		if NOT isString(pcCondition)
			StzRaise("Incorrect param type! pcCondition must be a string.")
		ok

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		if pReturn = :Default
			pReturn = :WalkedPositions
		ok

		if isList(pcDirection) and Q(pcDirection).IsOneOfTheseNamedParams([ :Direction, :Going ])
			pcDirection = pcDirection[2]
		ok

		if NOT ( isString(pcDirection) and
			 Q(pcDirection).IsOneOfThese([ :Forward, :Backward, :Default ]) )

			StzRaise("Incorrect param type! pcDirection must be one of these strings [ :Forward, :Backward, :Default ].")
		ok

		if pcDirection = :Default
			pcDirection = :Forward
		ok
		# Doing the job

		cCode = 'bOk = ( ' +  StzCCodeQ(pcCondition).Transpiled() + ' )'

		bFound = FALSE
		aList = This.Content()
		nLen = This.NumberOfItems()

		anPositions = []

		nStart = 1
		nEnd   = nLen
		nStep  = 1

		if pcDirection = :Backward
			nStart = nLen
			nEnd   = 1
			nStep  = -1
		ok

		for @i = nStart to nEnd step nStep
			eval(cCode)

			if bOk
				if bWalkBefore = FALSE
					anPositions + @i
				ok

				exit
			ok

			anPositions + @i
			
		next

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end

	def WalkUntilBeforeXT(pcCondition, pReturn)
		return This.WalkUntilXT( :Before = pcCondition, pReturn)

	  #=================#
	 #  WALKING WHILE  #
	#=================#

	def WalkWhile(pcCondition)
		return This.WalkWhileXT(pcCondition, :Forward, :WalkedPositions)

	def WalkWhileXT(pcCondition, pcDirection, pReturn)
		/*
		o1 = new stzList([ "A", "B", "_", "*", 12, "C", "D", 4 ])

		? WalkWhile("Q(@item).IsNotNumber()")
		#--> 1:4
		*/

		# Checking params

		if NOT isString(pcCondition)
			StzRaise("Incorrect param type! pcCondition must be a string.")
		ok

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		if pReturn = :Default
			pReturn = :WalkedPositions
		ok

		if isList(pcDirection) and Q(pcDirection).IsOneOfTheseNamedParams([ :Direction, :Going ])
			pcDirection = pcDirection[2]
		ok

		if NOT ( isString(pcDirection) and
			 Q(pcDirection).IsOneOfThese([ :Forward, :Backward, :Default ]) )

			StzRaise("Incorrect param type! pcDirection must be one of these strings [ :Forward, :Backward, :Default ].")
		ok

		if pcDirection = :Default
			pcDirection = :Forward
		ok

		# Doing the job

		cCode = 'bOk = (' + StzCCodeQ(pcCondition).Transpiled() + ' )'

		anPositions = []
		nLen = This.NumberOfItems()

		nStart = 1
		nEnd   = nLen
		nStep  = 1

		if pcDirection = :Backward
			nStart = nLen
			nEnd   = 1
			nStep  = -1
		ok

		for @i = nStart to nEnd step nStep
			
			eval(cCode)

			if NOT bOk
				exit
			ok

			anPositions + @i
		next

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end

	  #================#
	 #  WALKING WHEN  #
	#================#

	def WalkWhen(pcCondition)
		return This.WalkWhenXT(pcCondition, :Forward, :WalkedPositions)

	def WalkWhenXT(pcCondition, pcDirection, pReturn)

		# Checking params

		if NOT isString(pcCondition)
			StzRaise("Incorrect param type! pcCondition must be a string.")
		ok

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		if pReturn = :Default
			pReturn = :WalkedPositions
		ok

		if isList(pcDirection) and Q(pcDirection).IsOneOfTheseNamedParams([ :Direction, :Going ])
			pcDirection = pcDirection[2]
		ok

		if NOT ( isString(pcDirection) and
			 Q(pcDirection).IsOneOfThese([ :Forward, :Backward, :Default ]) )

			StzRaise("Incorrect param type! pcDirection must be one of these strings [ :Forward, :Backward, :Default ].")
		ok

		if pcDirection = :Default
			pcDirection = :Forward
		ok

		# Doing the job

		cCode = 'bOk = (' + StzCCodeQ(pcCondition).Transpiled() + ' )'

		anPositions = []
		nLen = This.NumberOfItems()

		nStart = 1
		nEnd   = nLen
		nStep  = 1

		if pcDirection = :Backward
			nStart = nLen
			nEnd   = 1
			nStep  = -1
		ok

		for @i = nStart to nEnd step nStep
			
			eval(cCode)

			if bOk
				anPositions = @i : nEnd
				exit
			ok

			
		next

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end

	  #===================#
	 #  WALKING BETWEEN  #
	#===================#

	def WalkBetween(n1, n2)
		return This.WalkBetweenIB(n1, n2, :WalkedPositions)

	def WalkBetweenIB(n1, n2, pReturn)

		# Checking params

		if isList(n1) and Q(n1).IsOneOfTheseNamedParams([ :Position, :Positions ])
			n1 = n1[2]
		ok

		if isList(n2) and Q(n2).IsOneOfTheseNamedParams([ :Position, :AndPosition, :And ])
			n2 = n2[2]
		ok

		if NOT Q([ n1, n2 ]).BothAreNumbers()
			StzRaise("Incorrect param type! n1 and n2 must be numbers.")
		ok

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		if pReturn = :Default
			pReturn = :WalkedPositions
		ok

		# Doing the job

		anPositions = []
		nLen = This.NumberOfItems()

		anPositions = n1 : n2

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end

	  #===================================#
	 #  WALKING THE LIST FORTH AND BACK  #
	#===================================#

	def WalkForthAndBack()
		return This.WalkForthAndBackXT(:Return = :WalkedPositions)

	def WalkForthAndBackXT(pReturn)

		# Checking pReturn param

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		# Doing the job

		anPositions = 1 : This.NumberOfItems()

		for i = This.NumberOfItems()-1 to 1 step -1
			anPositions + i
		next
		
		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end

	  #-----------------------------------#
	 #  WALKING THE LIST BACK AND FORTH  #
	#-----------------------------------#

	def WalkBackAndForth()
		return This.WalkBackAndForthXT(:Return = :WalkedPositions)

	def WalkBackAndForthXT(pReturn)

		# Checking pReturn param

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		# Doing the job

		anPositions = This.NumberOfItems() : 1

		for i = 2 to This.NumberOfItems()
			anPositions + i
		next

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end

	  #===============================================#
	 #  WALKING THE LIST EACH TIME N ITEMS FORWARD   #
	#===============================================#

	def WalkNItemsForward(n)
		return This.WalkNItemsForwardXT(n, :Return = :WalkedPositions)

		#< @FunctionAlternativeForms

		def WalkNStepsForward(n)
			return This.WalkNItemsForward(n)

		def WalkForward(n)
			return This.WalkNItemsForward(n)

		def WalkNForward(n)
			return This.WalkNItemsForward(n)

		#--

		def WalkEachTimeNSItemsForward(n)
			return This.WalkNItemsForward(n)

		def WalkEachTimeNStepsForward(n)
			return This.WalkNItemsForward(n)

		#>

	def WalkNItemsForwardXT(n, pReturn)

		# Checking params

		if NOT isNumber(n)
			StzRaise("Incorrect param! n must be a number.")
		ok

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		# Doing the job

		anPositions = []

		for i = 1 to This.NumberOfItems() step n
			anPositions + i
		next

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end

		#< @FunctionAlterntives

		def WalkNStepsForwardXT(n, pReturn)
			return This.WalkNItemsForwardXT(n, pReturn)

		def WalkForwardXT(n, pReturn)
			return This.WalkNItemsForwardXT(n, pReturn)

		def WalkNForwardXT(n, pReturn)
			return This.WalkNItemsForwardXT(n, pReturn)

		#--

		def WalkEachTimeNSItemsForwardXT(n, pReturn)
			return This.WalkNItemsForwardXT(n, pReturn)

		def WalkEachTimeNStepsForwardXT(n, pReturn)
			return This.WalkNItemsForwardXT(n, pReturn)

		#>

	  #-----------------------------------------------#
	 #  WALKING THE LIST EACH TIME N ITEMS BACKWARD  #
	#-----------------------------------------------#

	def WalkNItemsBackward(n)
		return This.WalkNItemsBackwardXT(n, :Return = :WalkedPositions)

		#< @FunctionAlternativeForms

		def WalkNStepsBackward(n)
			return This.WalkNItemsBackward(n)

		def WalkNBackward(n)
			return This.WalkNItemsBackward(n)

		def WalkBackward(n)
			return This.WalkNItemsBackward(n)

		#--

		def WalkEachTimeNItemsBackward(n)
			return This.WalkNItemsBackward(n)

		def WalkEachTimeNStepsBackward(n)
			return This.WalkNItemsBackward(n)

		#>

	def WalkNItemsBackwardXT(n, pReturn)

		# Checking params

		if NOT isNumber(n)
			StzRaise("Incorrect param! n must be a number.")
		ok

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		# Doing the job

		anPositions = []

		for i = This.NumberOfItems() to 1 step -n
			anPositions + i
		next

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end

		#< @FunctionAlternativeForms

		def WalkNStepsBackwardXT(n, pReturn)
			return This.WalkNItemsBackwardXT(n, pReturn)

		def WalkNBackwardXT(n, pReturn)
			return This.WalkNItemsBackwardXT(n, pReturn)

		def WalkBackwardXT(n, pReturn)
			return This.WalkNItemsBackwardXT(n, pReturn)

		#--

		def WalkEachTimeNItemsBackwardXT(n, pReturn)
			return This.WalkNItemsBackwardXT(n, pReturn)

		def WalkEachTimeNStepsBackwardXT(n, pReturn)
			return This.WalkNItemsBackwardXT(n, pReturn)

		#>

	  #===========================================================#
	 #  WALKING THE LIST EACH TIME N MORE ITEMS FORWARD   #
	#===========================================================#

	def WalkNProgressiveItemsForward(n)
		return This.WalkNProgressiveItemsForwardXT(n, :Return = :WalkedPositions)

		#< @FunctionAlternativeForms

		def WalkEachTimeNProgressiveItemsForward(n)
			return This.WalkNProgressiveItemsForward(n)

		def WalkProgressiveNItemsForward(n)
			return This.WalkNProgressiveItemsForward(n)

		#--

		def WalkNProgressiveStepsForward(n)
			return This.WalkNProgressiveItemsForward(n)

		def WalkEachTimeNProgressiveStepsForward(n)
			return This.WalkNProgressiveItemsForward(n)


		def WalkProgressiveNStepsForward(n)
			return This.WalkNProgressiveItemsForward(n)

		#--

		def WalkNMoreItemsForward(n)
			return This.WalkNProgressiveItemsForward(n)

		def WalkEachTimeNMoreItemsForward(n)
			return This.WalkNProgressiveItemsForward(n)


		def WalkNMoreStepsForward(n)
			return This.WalkNProgressiveItemsForward(n)

		def WalkEachTimeNMoreStepsForward(n)
			return This.WalkNProgressiveItemsForward(n)


		def WalkMoreNItemsForward(n)
			return This.WalkNProgressiveItemsForward(n)


		def WalkMoreStepsForward(n)
			return This.WalkNProgressiveItemsForward(n)

		def WalkEachTimeMoreStepsForward(n)
			return This.WalkNProgressiveItemsForward(n)

		def WalkNMoreForward(n)
			return This.WalkNProgressiveItemsForward(n)

		#--

		def WalkMoreForward(n)
			return This.WalkNProgressiveItemsForward(n)

		#==

		def WalkNCumulativeItemsForward(n)
			return This.WalkNProgressiveItemsForward(n)

		def WalkEachTimeNCumulativeItemsForward(n)
			return This.WalkNProgressiveItemsForward(n)


		def WalkCumulativeNItemsForward(n)
			return This.WalkNCumulativeItemsForward(n)

		#--

		def WalkNCumulativeStepsForward(n)
			return This.WalkNCumulativeItemsForward(n)

		def WalkEachTimeNCumulativeStepsForward(n)
			return This.WalkNProgressiveItemsForward(n)


		def WalkCumulativeNStepsForward(n)
			return This.WalkNCumulativeItemsForward(n)

		#>

	def WalkNProgressiveItemsForwardXT(n, pReturn)

		# Checking params

		if NOT isNumber(n)
			StzRaise("Incorrect param! n must be a number.")
		ok

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		# Doing the job

		anPositions = []

		if n < 0

			StzRaise("Can't proceed. n must be positive!")
		but n = 0
			anPositions = [1]

		else
			anPositions = [1]
			nstep = 1
			i = 0
			
			while nStep <= This.NumberOfItems()
				i++
				nStep += (n * i)
				if nStep <= This.NumberOfItems()
					anPositions + nStep
				ok
			end

		ok

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end

		#< @FunctionAlternativeForms

		def WalkEachTimeNProgressiveItemsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)

		def WalkProgressiveNItemsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)

		#--

		def WalkNProgressiveStepsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)

		def WalkEachTimeNProgressiveStepsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)


		def WalkProgressiveNStepsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)

		#--

		def WalkNMoreItemsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)

		def WalkEachTimeNMoreItemsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)


		def WalkNMoreStepsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)

		def WalkEachTimeNMoreStepsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)


		def WalkMoreNItemsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)


		def WalkMoreStepsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)

		def WalkEachTimeMoreStepsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)

		def WalkNMoreForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)

		#--

		def WalkMoreForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)

		#==

		def WalkNCumulativeItemsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)

		def WalkEachTimeNCumulativeItemsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)


		def WalkCumulativeNItemsForwardXT(n, pReturn)
			return This.WalkNCumulativeItemsForwardXT(n, pReturn)

		#--

		def WalkNCumulativeStepsForwardXT(n, pReturn)
			return This.WalkNCumulativeItemsForwardXT(n, pReturn)

		def WalkEachTimeNCumulativeStepsForwardXT(n, pReturn)
			return This.WalkNProgressiveItemsForwardXT(n, pReturn)


		def WalkCumulativeNStepsForwardXT(n, pReturn)
			return This.WalkNCumulativeItemsForwardXT(n, pReturn)

		#>

	  #------------------------------------------------------------#
	 #  WALKING THE LIST EATCH TIME N PROGRESSIVE ITEMS BACKWARD  #
	#------------------------------------------------------------#

	def WalkNProgressiveItemsBackward(n)
		return This.WalkNProgressiveItemsBackwardXT(n, :Return = :WalkedPositions)

		#< @FunctionAlternativeForms

		def WalkEachTimeNProgressiveItemsBackward(n)
			return This.WalkNProgressiveItemsBackward(n)

		def WalkProgressiveNItemsBackward(n)
			return This.WalkNProgressiveItemsBackward(n)

		#--

		def WalkNProgressiveStepsBackward(n)
			return This.WalkNProgressiveItemsBackward(n)

		def WalkEachTimeNProgressiveStepsBackward(n)
			return This.WalkNProgressiveItemsBackward(n)


		def WalkProgressiveNStepsBackward(n)
			return This.WalkNProgressiveItemsBackward(n)

		#--

		def WalkNMoreItemsBackward(n)
			return This.WalkNProgressiveItemsBackward(n)

		def WalkEachTimeNMoreItemsBackward(n)
			return This.WalkNProgressiveItemsBackward(n)


		def WalkNMoreStepsBackward(n)
			return This.WalkNProgressiveItemsBackward(n)

		def WalkEachTimeNMoreStepsBackward(n)
			return This.WalkNProgressiveItemsBackward(n)


		def WalkMoreNItemsBackward(n)
			return This.WalkNProgressiveItemsBackward(n)

		def WalkMoreStepsBackward(n)
			return This.WalkNProgressiveItemsBackward(n)

		def WalkNMoreBackward(n)
			return This.WalkNProgressiveItemsBackward(n)

		#--

		def WalkMoreBackward(n)
			return This.WalkNProgressiveItemsBackward(n)

		#==

		def WalkNCumulativeItemsBackward(n)
			return This.WalkNProgressiveItemsBackward(n)

		def WalkEachTimeNCumulativeItemsBackward(n)
			return This.WalkNProgressiveItemsBackward(n)


		def WalkCumulativeNItemsBackward(n)
			return This.WalkNCumulativeItemsBackward(n)

		#--

		def WalkNCumulativeStepsBackward(n)
			return This.WalkNCumulativeItemsBackward(n)

		def WalkEachTimeNCumulativeStepsBackward(n)
			return This.WalkNCumulativeItemsBackward(n)


		def WalkCumulativeNStepsBackward(n)
			return This.WalkNCumulativeItemsBackward(n)

		#>

	def WalkNProgressiveItemsBackwardXT(n, pReturn)

		# Checking params

		if NOT isNumber(n)
			StzRaise("Incorrect param! n must be a number.")
		ok

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		# Doing the job

		anPositions = []

		if n < 0
			StzRaise("Can't proceed. n must be positive!")

		but n = 0
			anPositions = [ This.NumberOfItems() ]

		else
			anPositions = [ This.NumberOfItems() ]
			nStep = This.NumberOfItems()
			i = 0
			
			while nStep > 0
				i++
				nStep -= (n * i)
				if nStep > 0
					anPositions + nStep
				ok
			end
	
		ok

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end

		#< @FunctionAlternativeForms

		def WalkEachTimeNProgressiveItemsBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)

		def WalkProgressiveNItemsBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)

		#--

		def WalkNProgressiveStepsBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)

		def WalkEachTimeNProgressiveStepsBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)


		def WalkProgressiveNStepsBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)

		#--

		def WalkNMoreItemsBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)

		def WalkEachTimeNMoreItemsBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)


		def WalkNMoreStepsBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)

		def WalkEachTimeNMoreStepsBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)


		def WalkMoreNItemsBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)

		def WalkMoreStepsBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)

		def WalkNMoreBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)

		#--

		def WalkMoreBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)

		#==

		def WalkNCumulativeItemsBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)

		def WalkEachTimeNCumulativeItemsBackwardXT(n, pReturn)
			return This.WalkNProgressiveItemsBackwardXT(n, pReturn)


		def WalkCumulativeNItemsBackwardXT(n, pReturn)
			return This.WalkNCumulativeItemsBackwardXT(n, pReturn)

		#--

		def WalkNCumulativeStepsBackwardXT(n, pReturn)
			return This.WalkNCumulativeItemsBackwardXT(n, pReturn)

		def WalkEachTimeNCumulativeStepsBackwardXT(n, pReturn)
			return This.WalkNCumulativeItemsBackwardXT(n, pReturn)


		def WalkCumulativeNStepsBackwardXT(n, pReturn)
			return This.WalkNCumulativeItemsBackwardXT(n, pReturn)

		#>

	  #================================================#
	 #  WALKING N ITEMS FORWARD AND N ITEMS BACKWARD  #
	#================================================#

	def WalkNItemsForwardNItemsBackward(pnForward, pnBackward)
		return This.WalkNItemsForwardNItemsBackwardXT(pnForward, pnBackward, :Return = :WalkedPositions)

		#< @FunctionAlternativeForm

		def WalkEachTimeNItemsForwardNItemsBackward(pnForward, pnBackward)
			return This.WalkNItemsForwardNItemsBackward(pnForward, pnBackward)


		def WalkNStepsForwardNStepsBackward(pnForward, pnBackward)
			return This.WalkNITemsForwardNItemsBackward(pnForward, pnBackward)

		def WalkEachTimeNStepsForwardNStepsBackward(pnForward, pnBackward)
			return This.WalkNITemsForwardNItemsBackward(pnForward, pnBackward)


		def WalkNForwardNBackward(pnForward, pnBackward)
			return This.WalkNITemsForwardNItemsBackward(pnForward, pnBackward)

		def WalkForwardBackward(pnForward, pnBackward)
			return This.WalkNITemsForwardNItemsBackward(pnForward, pnBackward)

		#>

	def WalkNItemsForwardNItemsBackwardXT(pnForward, pnBackward, pReturn)

		# Checking params

		if NOT Q([pnForward, pnBackward]).BothAreNumbers()
			StzRaise("Incorrect param type! Both pnForward and pnBackward must be numbers.")
		ok

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		if pReturn = :Default
			pReturn = :WalkedPositions
		ok

		# Doing the job

		aList = This.List()
		nLen = len(aList)

		if pnForward = pnBackward
			return []
		ok

		if pnBackward > pnForward
			nStart = pnBackward - pnForward + 1
		else
			nStart = 1
		ok

		i = nStart
		anPositions = [ i ]

		while Q(i + pnForward).IsBetween(1, nLen) and
		      Q(i + pnForward - pnBackward).IsBetween(1, nLen)

			i = i + pnForward
			anPositions + i

			i = i - pnBackward
			anPositions + i

		end

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end
	
		#< @FunctionAlternativeForm

		def WalkEachTimeNItemsForwardNItemsBackwardXT(pnForward, pnBackward, pReturn)
			return This.WalkNItemsForwardNItemsBackwardXT(pnForward, pnBackward, pReturn)


		def WalkNStepsForwardNStepsBackwardXT(pnForward, pnBackward, pReturn)
			return This.WalkNITemsForwardNItemsBackwardXT(pnForward, pnBackward, pReturn)

		def WalkEachTimeNStepsForwardNStepsBackwardXT(pnForward, pnBackward, pReturn)
			return This.WalkNITemsForwardNItemsBackwardXT(pnForward, pnBackward, pReturn)

		def WalkNForwardNBackwardXT(pnForward, pnBackward, pReturn)
			return This.WalkNITemsForwardNItemsBackwardXT(pnForward, pnBackward, pReturn)

		def WalkForwardBackwardXT(pnForward, pnBackward, pReturn)
			return This.WalkNITemsForwardNItemsBackwardXT(pnForward, pnBackward, pReturn)

		#>

	  #------------------------------------------------#
	 #  WALKING N ITEMS FORWARD AND N ITEMS BACKWARD  #
	#------------------------------------------------#

	def WalkNItemsBackwardNItemsForward(pnBackward, pnForward)
		return This.WalkNItemsBackwardNItemsForwardXT(pnBackward, pnForward, :Return = :WalkedPositions)

		#< @FunctionAlternativeForm

		def WalkEachTimeNItemsBackwardNItemsForward(pnForward, pnBackward)
			return This.WalkNItemsBackwardNItemsForward(pnForward, pnBackward)


		def WalkNStepsBackwardNStepsForward(pnForward, pnBackward)
			return This.WalkNItemsBackwardNItemsForward(pnForward, pnBackward)

		def WalkEachTimeNStepsBackwardNStepsForward(pnForward, pnBackward)
			return This.WalkNItemsBackwardNItemsForward(pnForward, pnBackward)


		def WalkNBackwardNForward(pnForward, pnBackward)
			return This.WalkNITemsBackwardNItemsForward(pnForward, pnBackward)

		def WalkBackwardForward(pnForward, pnBackward)
			return This.WalkNItemsBackwardNItemsForward(pnForward, pnBackward)

		#>

	def WalkNItemsBackwardNItemsForwardXT(pnBackward, pnForward, pReturn)

		# Checking params

		if NOT Q([pnBackward, pnForward]).BothAreNumbers()
			StzRaise("Incorrect param type! Both pnForward and pnBackward must be numbers.")
		ok

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		if pReturn = :Default
			pReturn = :WalkedPositions
		ok

		# Doing the job

		aList = This.List()
		nLen = len(aList)

		if pnForward = pnBackward
			return []
		ok

		if pnForward > pnBackward
			nStart = nLen - pnBackward
		else
			nStart = nLen
		ok

		i = nStart
		anPositions = [ nStart ]

		while Q(i - pnBackward).IsBetween(1, nLen) and
		      Q(i - pnBackward + pnForward ).IsBetween(1, nLen)

			i = i - pnBackward
			anPositions + i

			i = i + pnForward
			anPositions + i

		end

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end

		#< @FunctionAlternativeForm

		def WalkEachTimeNItemsBackwardNItemsForwardXT(pnBackward, pnForward, pReturn)
			return This.WalkNItemsBackwardNItemsForwardXT(pnBackward, pnForward, pReturn)


		def WalkNStepsBackwardNStepsForwardXT(pnBackward, pnForward, pReturn)
			return This.WalkNItemsBackwardNItemsForwardXT(pnBackward, pnForward, pReturn)

		def WalkEachTimeNStepsBackwardNStepsForwardXT(pnBackward, pnForward, pReturn)
			return This.WalkNItemsBackwardNItemsForwardXT(pnBackward, pnForward, pReturn)


		def WalkNBackwardNForwardXT(pnBackward, pnForward, pReturn)
			return This.WalkNITemsBackwardNItemsForwardXT(pnBackward, pnForward, pReturn)

		def WalkBackwardForwardXT(pnBackward, pnForward, pReturn)
			return This.WalkNItemsBackwardNItemsForwardXT(pnBackward, pnForward, pReturn)

		#>

	  #===================================================#
	 #  WALKING N STEPS FROM START AND N STEPS FROM END  #
	#===================================================#

	def WalkNItemsFromStartNItemsFromEnd(nFromStart, nFromEnd)
		return This.WalkNItemsFromStartNItemsFromEndXT(nFromStart, nFromEnd, :Return = :WalkedPositions)

		#< @FunctionAlternativeForm

		def WalkEachTimeNItemsFromStartNItemsFromEnd(pnFromStart, pnFromEnd)
			return This.WalkNItemsFromStartNItemsFromEnd(pnFromStart, pnFromEnd)


		def WalkNStepsFromStartNStepsFromEnd(pnFromStart, pnFromEnd)
			return This.WalkNITemsFromStartNItemsFromEnd(pnFromStart, pnFromEnd)

		def WalkEachTimeNStepsFromStartNStepsFromEnd(pnFromStart, pnFromEnd)
			return This.WalkNITemsFromStartNItemsFromEnd(pnFromStart, pnFromEnd)


		def WalkNFromStartNFromEnd(pnFromStart, pnFromEnd)
			return This.WalkNITemsFromStartNItemsFromEnd(pnFromStart, pnFromEnd)

		def WalkFromStartFromEnd(pnFromStart, pnFromEnd)
			return This.WalkNITemsFromStartNItemsFromEnd(pnFromStart, pnFromEnd)

		def WalkNStartNEnd(pnFromStart, pnFromEnd)
			return This.WalkNITemsFromStartNItemsFromEnd(pnFromStart, pnFromEnd)

		def WalkStartEnd(pnFromStart, pnFromEnd)
			return This.WalkNITemsFromStartNItemsFromEnd(pnFromStart, pnFromEnd)

		#>

	def WalkNItemsFromStartNItemsFromEndXT(pnFromStart, pnFromEnd, pReturn)

		# Checking params

		if NOT Q([pnFromStart, pnFromEnd]).BothAreNumbers()
			StzRaise("Incorrect param type! Both pnFromStart and pnFromEnd must be numbers.")
		ok

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		if pReturn = :Default
			pReturn = :WalkedPositions
		ok

		# Doing the job

		aList = This.List()
		nLen = len(aList)

		anPositions = [ 1 ]

		for i = 1 to nLen
			nPosFromStart = i + pnFromStart
			nPosFromEnd   = nLen - i - pnFromEnd + 1

			if nPosFromEnd >= nPosFromStart
				anPositions + nPosFromStart
				if nPosFromEnd != nPosFromStart
					anPositions + nPosFromEnd
				ok
			ok
		next

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end
	
		#< @FunctionAlternativeForm

		def WalkEachTimeNItemsFromStartNItemsFromEndXT(pnFromStart, pnFromEnd, pReturn)
			return This.WalkNItemsFromStartNItemsFromEndXT(pnFromStart, pnFromEnd, pReturn)


		def WalkNStepsFromStartNStepsFromEndXT(pnFromStart, pnFromEnd, pReturn)
			return This.WalkNITemsFromStartNItemsFromEndXT(pnFromStart, pnFromEnd, pReturn)

		def WalkEachTimeNStepsFromStartNStepsFromEndXT(pnFromStart, pnFromEnd, pReturn)
			return This.WalkNITemsFromStartNItemsFromEndXT(pnFromStart, pnFromEnd, pReturn)

		def WalkNFromStartNFromEndXT(pnFromStart, pnFromEnd, pReturn)
			return This.WalkNITemsFromStartNItemsFromEndXT(pnFromStart, pnFromEnd, pReturn)

		def WalkFromStartFromEndXT(pnFromStart, pnFromEnd, pReturn)
			return This.WalkNITemsFromStartNItemsFromEndXT(pnFromStart, pnFromEnd, pReturn)

		def WalkNStartNEndXT(pnFromStart, pnFromEnd, pReturn)
			return This.WalkNITemsFromStartNItemsFromEndXT(pnFromStart, pnFromEnd, pReturn)

		def WalkStartEndXT(pnFromStart, pnFromEnd, pReturn)
			return This.WalkNITemsFromStartNItemsFromEndXT(pnFromStart, pnFromEnd, pReturn)

		#>

	  #---------------------------------------------------#
	 #  WALKING N ITEMS FROM END AND N ITEMS FROM START  #
	#---------------------------------------------------#

	def WalkNItemsFromEndNItemsFromStart(pnFromEnd, pnFromStart)
		return This.WalkNItemsFromEndNItemsFromStartXT(pnFromEnd, pnFromStart, :Return = :WalkedPositions)

		#< @FunctionAlternativeForm

		def WalkEachTimeNItemsFromEndNItemsFromStart(pnFromStart, pnFromEnd)
			return This.WalkNItemsFromEndNItemsFromStart(pnFromStart, pnFromEnd)


		def WalkNStepsFromEndNStepsFromStart(pnFromStart, pnFromEnd)
			return This.WalkNItemsFromEndNItemsFromStart(pnFromStart, pnFromEnd)

		def WalkEachTimeNStepsFromEndNStepsFromStart(pnFromStart, pnFromEnd)
			return This.WalkNItemsFromEndNItemsFromStart(pnFromStart, pnFromEnd)


		def WalkNFromEndNFromStart(pnFromStart, pnFromEnd)
			return This.WalkNITemsFromEndNItemsFromStart(pnFromStart, pnFromEnd)

		def WalkFromEndFromStart(pnFromStart, pnFromEnd)
			return This.WalkNItemsFromEndNItemsFromStart(pnFromStart, pnFromEnd)

		def WalkNEndNStart(pnFromStart, pnFromEnd)
			return This.WalkNItemsFromEndNItemsFromStart(pnFromStart, pnFromEnd)

		def WalkEndStart(pnFromStart, pnFromEnd)
			return This.WalkNItemsFromEndNItemsFromStart(pnFromStart, pnFromEnd)

		#>

	def WalkNItemsFromEndNItemsFromStartXT(pnFromEnd, pnFromStart, pReturn)

		# Checking params

		if NOT Q(pnFromEnd, pnFromStart).BothAreNumbers()
			StzRaise("Incorrect param type! Both pnFromStart and pnFromEnd must be numbers.")
		ok

		if isList(pReturn) and
		   Q(pReturn).IsOneOfTheseNamedParams([ :Return, :AndReturn ])

			pReturn = pReturn[2]
		ok

		if NOT ( isString(pReturn) and

			 Q(pReturn).IsOneOfThese([
				:WalkedPositions, :WalkedItems,
				:LastPosition, :LastWalkedPosition,
				:LastItem, :LastWalkedItem,
				:Default
			]) )

			StzRaise("Incorrect param! pReturn must be a string. Allowed values are " +
				 ":WalkedPositions, :WalkedItems, :LastWalkedPosition, :LastWalkedItem, and :Default." )
		ok

		if pReturn = :Default
			pReturn = :WalkedPositions
		ok

		# Doing the job

		aList = This.List()
		nLen = len(aList)

		anPositions = [ 7 ]

		for i = nLen to 1 step -1

			nPosFromEnd   = i - pnFromEnd
			nPosFromStart = nLen - i + 1

			if nPosFromEnd >= nPosFromStart
				anPositions + nPosFromEnd
				
				if nPosFromStart != nPosFromEnd
					anPositions + nPosFromStart
				ok
			ok
		next

		if pReturn = :WalkedItems
			return This.ItemsAt(anPositions)

		but pReturn = :WalkedPositions
			return anPositions

		but pReturn = :LastItem or pReturn = :LastWalkedItem
			return This.ItemAt(len(anPositions))

		but pReturn = :LastPosition or pReturn = :LastWalkedPosition
			return anPositions[len(anPositions)]

		else
			return anPositions
		end

		#< @FunctionAlternativeForm

		def WalkEachTimeNItemsFromEndNItemsFromStartXT(pnFromEnd, pnFromStart, pReturn)
			return This.WalkNItemsFromEndNItemsFromStartXT(pnFromEnd, pnFromStart, pReturn)


		def WalkNStepsFromEndNStepsFromStartXT(pnFromEnd, pnFromStart, pReturn)
			return This.WalkNItemsFromEndNItemsFromStartXT(pnFromEnd, pnFromStart, pReturn)

		def WalkEachTimeNStepsFromEndNStepsFromStartXT(pnFromEnd, pnFromStart, pReturn)
			return This.WalkNItemsFromEndNItemsFromStartXT(pnFromEnd, pnFromStart, pReturn)


		def WalkNFromEndNFromStartXT(pnFromEnd, pnFromStart, pReturn)
			return This.WalkNITemsFromEndNItemsFromStartXT(pnFromEnd, pnFromStart, pReturn)

		def WalkFromEndFromStartXT(pnFromEnd, pnFromStart, pReturn)
			return This.WalkNItemsFromEndNItemsFromStartXT(pnFromEnd, pnFromStart, pReturn)

		def WalkNEndNStartXT(pnFromEnd, pnFromStart, pReturn)
			return This.WalkNItemsFromEndNItemsFromStartXT(pnFromEnd, pnFromStart, pReturn)

		def WalkEndStartXT(pnFromEnd, pnFromStart, pReturn)
			return This.WalkNItemsFromEndNItemsFromStartXT(pnFromEnd, pnFromStart, pReturn)

		#>

	  #===========================================#
	 #   EXPANDING THE LIST OF PAIR OF NUMBERS   #
	#===========================================#

	/* Example
		o1 = new stzList([ 12, 7 ])
		? o1.ExpandedIfPairOfNumbers() #--> [ 12, 11, 10, 9, 8, 7 ]
	*/

	def ExpandIfPairOfNumbers() # TODO: Should be delegated to stzPairOfNumbers
		if This.IsPairOfNumbers()
			n1 = This[1]
			n2 = This[2]

			anResult = n1 : n2

			This.UpdateWith( anResult )
		ok

		def ExpandIfPairOfNumbersQ()
			This.ExpandIfPairOfNumbers()
			return This

	def ExpandedIfPairOfNumbers()
		bResult = This.Copy().ExpandIfPairOfNumbersQ().Content()
		return bResult

	  #========================================================#
	 #   CHECKING IF ALL THE ITEMS VERIFY A GIVEN CONDITION   #
	#========================================================#

	def CheckW(pcCondition)
		#< @MotherFunction = CheckOnPositionsW > @RingBased #>

		/* EXAMPLE

		o1 = new stzList([ "BING", "BINGO", "BINGOO", "BINGOOO", "BINGOOOO" ])
		? o1.CheckW( :That = '{ @NextItem = @item + "O" }' )	#--> TRUE

		*/

		bResult = This.CheckOnPositionsW(1:This.NumberOfItems(), pcCondition)
		return bResult

		#< @FunctionAlternativeForms

		def Check(pcCondition)
			return This.CheckW(pcCondition)

		def Verify(pcCondition)
			return This.CheckW(pcCondition)

		def EachItemVerifyW(pcCondition)
			return This.CheckW(pcCondition)

		def EachItemVerify(pcCondition)
			return This.CheckW(pcCondition)

		def AllItemsVerifyW(pcCondition)
			return This.CheckW(pcCondition)

		def AllItemsVerify(pcCondition)
			return This.CheckW(pcCondition)

		def ItemsVerify(pcCondition)
			return This.CheckW(pcCondition)

		def ItemsVerifyW(pcCondition)
			return This.CheckW(pcCondition)

		#>

	  #-------------------------------------------------------------------#
	 #   CHECKING IF ITEMS AT GIVEN POSITIONS VERIFY A GIVEN CONDITION   #
	#-------------------------------------------------------------------#

	def CheckOnW(panPositions, pcCondition)
		#< @MotherFunction = YES | @RingBased #>

		/* EXAMPLE

		o1 = new stzList([ "Word1", "كلمة 2", "Word3", "كلمة 4", "Word5", "كلمة 6" ])
		? o1.CheckOnW([1, 3, 5], :That = 'Q(@item).IsLeftToRight()' ) #--> TRUE

		*/
		if This.IsEmpty()
			return FALSE
		ok

		if NOT ( isList(panPositions) and Q(panPositions).IsListOfNumbers() )
			StzRaise("Invalid param type! panPositions must be a list of numbers.")
		ok

		if len(panPositions) = 0
			return FALSE
		ok

		if isList(pcCondition) and Q(pcCondition).IsThatOrWhereNamedParam()
			pcCondition = pcCondition[2]
		ok

		if NOT isString(pccondition)
			StzRaise("Incorrect param! pcCondition must be a string.")
		ok

		pcCode = Q(pcCondition).
			 TrimQ().
			 RemoveTheseBoundsQ("{", "}").
			 Content()

		cCode = "bOk = ( " + pcCode + " )"
		oCode = StzStringQ(cCode)
		
		nLenPositions = len(panPositions)
		bResult = TRUE

		for n = 1 to nLenPositions
			@i = panPositions[n]
			@item = This[ @i ]
			bEval = TRUE

			if @i = This.NumberOfItems() and
			   oCode.Copy().RemoveSpacesQ().ContainsCS("This[@i+1]", :CS=FALSE)

				bEval = FALSE

			but @i = 1 and
			    oCode.Copy().RemoveSpacesQ().ContainsCS("This[@i-1]", :CS=FALSE)

				bEval = FALSE
			ok

			if bEval

				eval(cCode)

				if bOk = FALSE
					bResult = FALSE
					exit
				ok
			ok

		next

		return bResult

		#< @FunctionAlternativeForms

		def CheckOn(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def CheckOnPositionsW(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def CheckOnThesePositionsW(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def CheckOnPositions(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)


		def VerifyOn(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def VerifyOnPositionsW(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def VerifyOnThesePositionsW(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def VerifyOnPositions(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		#>

	  #------------------------------------------------------------------------------#
	 #   CHECKING IF ITEMS AT GIVEN POSITIONS VERIFY A GIVEN CONDITION -- EXTENDED  #
	#------------------------------------------------------------------------------#

	def CheckOnWXT(panPositions, pcCondition)
		#< @MotherFunction = YES | @RingBased #>

		if This.IsEmpty()
			return FALSE
		ok

		if NOT ( isList(panPositions) and Q(panPositions).IsListOfNumbers() )
			StzRaise("Invalid param type! panPositions must be a list of numbers.")
		ok

		if len(panPositions) = 0
			return FALSE
		ok

		if isList(pcCondition) and Q(pcCondition).IsThatOrWhereNamedParam()
			pcCondition = pcCondition[2]
		ok

		if NOT isString(pccondition)
			StzRaise("Incorrect param! pcCondition must be a string.")
		ok

		oCCode = StzCCodeQ(pcCondition)
		cCode = 'bOk = ( ' + oCCode.Transpiled() + ' )'
		oCode = StzStringQ(cCode)
		
		nLenPositions = len(panPositions)
		bResult = TRUE

		for n = 1 to nLenPositions
			@i = panPositions[n]
			@item = This[ @i ]
			bEval = TRUE

			if @i = This.NumberOfItems() and
			   oCode.Copy().RemoveSpacesQ().ContainsCS("This[@i+1]", :CS=FALSE)

				bEval = FALSE

			but @i = 1 and
			    oCode.Copy().RemoveSpacesQ().ContainsCS("This[@i-1]", :CS=FALSE)

				bEval = FALSE
			ok

			if bEval

				eval(cCode)

				if bOk = FALSE
					bResult = FALSE
					exit
				ok
			ok

		next

		return bResult

		#< @FunctionAlternativeForms

		def CheckOnXT(panPositions, pcCondition)
			return This.CheckOnWXT(panPositions, pcCondition)

		def CheckOnPositionsWXT(panPositions, pcCondition)
			return This.CheckOnWXT(panPositions, pcCondition)

		def CheckOnThesePositionsWXT(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def CheckOnPositionsXT(panPositions, pcCondition)
			return This.CheckOnWXT(panPositions, pcCondition)


		def VerifyOnXT(panPositions, pcCondition)
			return This.CheckOnWXT(panPositions, pcCondition)

		def VerifyOnPositionsWXT(panPositions, pcCondition)
			return This.CheckOnWXT(panPositions, pcCondition)

		def VerifyOnThesePositionsWXT(panPositions, pcCondition)
			return This.CheckOnWXT(panPositions, pcCondition)

		def VerifyOnPositionsXT(panPositions, pcCondition)
			return This.CheckOnWXT(panPositions, pcCondition)

		#>

	  #------------------------------------------------------------------#
	 #   CHECKING IF ITEMS AT GIVEN SECTIONS VERIFY A GIVEN CONDITION   #
	#------------------------------------------------------------------#

	def CheckOnSectionsW(paSections, pcCondition)
		#< @MotherFunction = CheckOnPositionsW > @RingBased #>


		# Checking correctness of paSections param

		if NOT ( isList(paSections) and
			 Q(paSections).IsListOfPairsOfNumbers() )

			StzRaise("Incorrect param! paSections must be a list of pairs of numbers.")
		ok

		if len(paSections) = 0
			return FALSE
		ok

		# Getting all the positions from the provided sections
		# Example: [ [2,5], [7,9 ] --> [ 2, 3, 4, 5, 7, 8, 9 ]

		aSectionsExpanded = []
		for aPair in paSections
			aSectionsExpanded + StzListQ(aPair).ExpandedIfPairOfNumbers()
		next

		anPositionsMerged = ListsMerge( aSectionsExpanded )

		anPositions = StzListQ(anPositionsMerged).ToSet()

		bResult = This.CheckOnW(anPositions, pcCondition)
		return bResult

		#< @FunctionAlternativeForm

		def CheckOnSections(paSections, pcCondition)
			return This.CheckOnSectionsW(paSections, pcCondition)

		def CheckOnTheseSectionsW(paSections, pcCondition)
			return This.CheckOnSectionsW(paSections, pcCondition)

		def CheckOnTheseSections(paSections, pcCondition)
			return This.CheckOnSectionsW(paSections, pcCondition)

		def VerifyOnSections(paSections, pcCondition)
			return This.CheckOnSectionsW(paSections, pcCondition)

		def VerifyOnTheseSectionsW(paSections, pcCondition)
			return This.CheckOnSectionsW(paSections, pcCondition)

		def VerifyOnTheseSections(paSections, pcCondition)
			return This.CheckOnSectionsW(paSections, pcCondition)

		#>

	  #----------------------------------------------------------------------------#
	 #  CHECKING IF ITEMS AT GIVEN SECTIONS VERIFY A GIVEN CONDITION -- EXTENDED  #
	#----------------------------------------------------------------------------#

	def CheckOnSectionsWXT(paSections, pcCondition)
		#< @MotherFunction = CheckOnPositionsW > @RingBased #>


		# Checking correctness of paSections param

		if NOT ( isList(paSections) and
			 Q(paSections).IsListOfPairsOfNumbers() )

			StzRaise("Incorrect param! paSections must be a list of pairs of numbers.")
		ok

		if len(paSections) = 0
			return FALSE
		ok

		# Getting all the positions from the provided sections
		# Example: [ [2,5], [7,9 ] --> [ 2, 3, 4, 5, 7, 8, 9 ]

		aSectionsExpanded = []
		for aPair in paSections
			aSectionsExpanded + StzListQ(aPair).ExpandedIfPairOfNumbers()
		next

		anPositionsMerged = ListsMerge( aSectionsExpanded )

		anPositions = StzListQ(anPositionsMerged).ToSet()

		bResult = This.CheckOnWXT(anPositions, pcCondition)
		return bResult

		#< @FunctionAlternativeForm

		def CheckOnSectionsXT(paSections, pcCondition)
			return This.CheckOnSectionsWXT(paSections, pcCondition)

		def CheckOnTheseSectionsWXT(paSections, pcCondition)
			return This.CheckOnSectionsWXT(paSections, pcCondition)

		def CheckOnTheseSectionsXT(paSections, pcCondition)
			return This.CheckOnSectionsWXT(paSections, pcCondition)

		def VerifyOnSectionsXT(paSections, pcCondition)
			return This.CheckOnSectionsWXT(paSections, pcCondition)

		def VerifyOnTheseSectionsWXT(paSections, pcCondition)
			return This.CheckOnSectionsWXT(paSections, pcCondition)

		def VerifyOnTheseSectionsXT(paSections, pcCondition)
			return This.CheckOnSectionsWXT(paSections, pcCondition)

		#>

	  #=========================================#
	 #   YIELDING INFORMATION FROM EACH ITEM   #
	#=========================================#

	/* NOTE:

	This function is more performant then its extended version
	YieldXT(), that it relies on the user to provide it
	with a correct formed condition containing only @i, @item,
	and @list keywords.

	All other keywords should be expressed using the @i keyword.

	For example, @CurrentItem should be expressed using simply This[@i],
	@PreviousItem should be expressed using This[@-1] and so on...

	*/

	def Yield(pcCode)
		nLen = This.NumberOfItems()

		aSection = StzCCodeQ(pcCode).ExecutableSection()
		n1 = aSection[1]
		n2 = aSection[2]

		if isString(n2) and n2 = :Last
			n2 = nLen
		ok

		if n2 < 0
			n2 += nLen
		ok

		return This.YieldFrom( n1 : n2, pcCode )

		#< @FunctionFluentForm

		def YieldQ(pcCode)
			return This.YieldQR(pcCode, :stzList)
	
		def YieldQR(pcCode, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.Yield(pcCode) )
	
			on :stzListOfStrings
				return new stzListOfStrings( This.Yield(pcCode) )
				
			on :stzListOfNumbers
				return new stzListOfNumbers( This.Yield(pcCode) )

			on :stzHashList
				return new stzHashList( This.Yield(pcCode) )

			on :stzListOfLists
				return new stzListOfLists( This.Yield(pcCode) )
		
		other
				StzRaise("Unsupported return type!")
		off

		#>

		#< @FunctionAlternativeForms

		def YieldFromEachItem(pcCode)
			return This.Yield(pcCode)

			def YieldFromEachItemQ(pcCode)
				return This.YieldFromEachItemQR(pcCode, :stzList)
		
			def YieldFromEachItemQR(pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldFromEachItem(pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldFromEachItem(pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldFromEachItem(pcCode) )
	
				on :stzHashList
					return new stzHashList( This.YieldFromEachItem(pcCode) )
			
			other
					StzRaise("Unsupported return type!")
			off

		def Harvest(pcCode)
			return This.Yield(pcCode)

			def HervestQ(pcCode)
				return This.YieldFromEachItemQR(pcCode, :stzList)
		
			def HarvestQR(pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.Harvest(pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.Harvest(pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.Harvest(pcCode) )
	
				on :stzHashList
					return new stzHashList( This.Harvest(pcCode) )
			
			other
					StzRaise("Unsupported return type!")
			off

		def HarvestFromEachItem(pcCode)
			return This.Yield(pcCode)

			def HarvestFromEachItemQ(pcCode)
				return This.HarvestFromEachItemQR(pcCode, :stzList)
		
			def HarvestFromEachItemQR(pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromEachItem(pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFromEachItem(pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFromEachItem(pcCode) )
	
				on :stzHashList
					return new stzHashList( This.HarvestFromEachItem(pcCode) )
			
			other
					StzRaise("Unsupported return type!")
			off
		#>

		#< @FunctionMisspelledForm

		def Yiled(pcCode)
			return This.Yield(pcCode)

		#>

	  #----------------------------------------------------#
 	 #   YIELDING INFORMATION FROM EACH ITEM -- EXTENDED  #
	#----------------------------------------------------#

	/* NOTE

	This function is less performan then it's simplest form Yield(),
	because it takes time to analyze the conditional code provided,
	spacify it, and transpile it, so a keyword like @PrecedentItem
	for example, can be used (in the keyword, the function is transpiled
	to "This[@i-1]" automatically).

	If performance is critical to you, don't use it, but use the simple
	form Yield() instead (supporting only the This[@i...]-like keywords).

	*/

	def YieldXT(pcCode)

		return This.YieldFromXT( 1:This.NumberOfItems(), pcCode )

		#< @FunctionFluentForm

		def YieldXTQ(pcCode)
			return This.YieldXTQR(pcCode, :stzList)
	
		def YieldXTQR(pcCode, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.YieldXT(pcCode) )
	
			on :stzListOfStrings
				return new stzListOfStrings( This.YieldXT(pcCode) )
				
			on :stzListOfNumbers
				return new stzListOfNumbers( This.YieldXT(pcCode) )

			on :stzHashList
				return new stzHashList( This.YieldXT(pcCode) )

			on :stzListOfLists
				return new stzListOfLists( This.YieldXT(pcCode) )
		
		other
				StzRaise("Unsupported return type!")
		off

		#>

		#< @FunctionAlternativeForms

		def YieldFromEachItemXT(pcCode)
			return This.YieldXT(pcCode)

			def YieldFromEachItemXTQ(pcCode)
				return This.YieldFromEachItemXTQR(pcCode, :stzList)
		
			def YieldFromEachItemXTQR(pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldFromEachItemXT(pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldFromEachItemXT(pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldFromEachItemXT(pcCode) )
	
				on :stzHashList
					return new stzHashList( This.YieldFromEachItemXT(pcCode) )
			
			other
					StzRaise("Unsupported return type!")
			off

		def HarvestXT(pcCode)
			return This.YieldXT(pcCode)

			def HervestXTQ(pcCode)
				return This.YieldFromEachItemXTQR(pcCode, :stzList)
		
			def HarvestXTQR(pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestXT(pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestXT(pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestXT(pcCode) )
	
				on :stzHashList
					return new stzHashList( This.HarvestXT(pcCode) )
			
			other
					StzRaise("Unsupported return type!")
			off

		def HarvestFromEachItemXT(pcCode)
			return This.YieldXT(pcCode)

			def HarvestFromEachItemXTQ(pcCode)
				return This.HarvestFromEachItemXTQR(pcCode, :stzList)
		
			def HarvestFromEachItemXTQR(pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromEachItemXT(pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFromEachItemXT(pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFromEachItemXT(pcCode) )
	
				on :stzHashList
					return new stzHashList( This.HarvestFromEachItemXT(pcCode) )
			
			other
					StzRaise("Unsupported return type!")
			off
		#>

		#< @FunctionMisspelledForm

		def YiledXT(pcCode)
			return This.YieldXT(pcCode)

		#>

	  #========================================================#
	 #   YIELDING INFORMATION FROM ITEMS AT GIVEN POSITIONS   #
	#========================================================#

	/* NOTE:
		This function is more performant then its extended version
		YieldFromXT(), that it relies on the user to provide it
		with a correct formed condition containing only @i, @item,
		and @list keywords.

		All other keywords should be expressed using the @i keyword.

		For example, @CurrentItem should be expressed using simply This[@i],
		@PreviousItem should be expressed using This[@-1] and so on...
	*/

	def YieldFrom(panPositions, pcCode)

		#< @MotherFunction #>

		if NOT ( isList(panPositions) and Q(panPositions).IsListOfNumbers() )
			StzRaise("Incorrect param! paPositions must be a list of numbers.")
		ok

		if len(panPositions) = 0
			return []
		ok

		panPositions = ring_sort(panPositions)
		nLenPositions = len(panPositions)

		if NOT isString(pcCode)
			StzRaise("Invalid param type! Condition must be a string.")
		ok

		if StzStringQ(pcCode).WithoutSpaces() = 0
			aTemp = []
			
			for i = 1 to nLenPositions
				aTemp + NULL
			next

			return aTemp
		ok

		pcCode = Q(pcCode).
			 TrimQ().
			 RemoveTheseBoundsQ("{", "}").
			 ReplaceCSQ("@list", "This.Content()", :CS = FALSE).
			 Content()

		cCode = "aResult + ( " + pcCode + " )"
		oCode = StzStringQ(cCode)
		
		aResult = []
		nLenList = This.NumberOfItems()

		for i = 1 to nLenPositions
			@i = panPositions[i]
			@item = This[ @i ]

			bEval = TRUE

			oCodeWS = Q( oCode.WithoutSpaces() )
			bContainsIPlus1  = oCodeWS.ContainsCS( "This[@i+1]", :CS=FALSE )
			bContainsIMinus1 = oCodeWS.ContainsCS( "This[@i-1]", :CS=FALSE )

			if @i = nLenList and bContainsIPlus1
				bEval = FALSE

			but @i = 1 and bContainsIMinus1
				bEval = FALSE
			
			ok

			if bEval

				eval(cCode) # Populates aResult with the yielded information

			ok

		next

		return aResult


		#< @FunctionFluentForm

		def YieldFromQ(paPositions, pcCode)
			return This.YieldFromQR(paPositions, pcCode, :stzList)
	
		def YieldFromQR(paPositions, pcCode, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.YieldFrom(paPositions, pcCode) )
	
			on :stzListOfStrings
				return new stzListOfStrings( This.YieldFrom(paPositions, pcCode) )
				
			on :stzListOfNumbers
				return new stzListOfNumbers( This.YieldFrom(paPositions, pcCode) )
		
			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def YieldFromPositions(panPositions, pcCode)
			return This.YieldFrom(panPositions, pcCode)

			def YieldFromPositionsQ(paPositions, pcCode)
				return This.YieldFromPositionsQR(paPositions, pcCode, :stzList)
		
			def YieldFromPositionsQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldFromPositions(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldFromPositions(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldFromPositions(paPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off

		def YieldFromItemsAt(panPositions, pcCode)
			return This.YieldFrom(panPositions, pcCode)

			def YieldFromItemsAtQ(paPositions, pcCode)
				return This.YieldFromItemsAtQR(paPositions, pcCode, :stzList)
		
			def YieldFromItemsAtQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldFromItemsAt(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldFromItemsAt(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldFromItemsAt(paPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off

		def YieldFromItemsAtPositions(panPositions, pcCode)
			return This.YieldOn(panPositions, pcCode)

			def YieldFromItemsAtPositionsQ(paPositions, pcCode)
				return This.YieldFromItemsAtPositionsQR(paPositions, pcCode, :stzList)
		
			def YieldFromItemsAtPositionsQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldFromItemsAtPositions(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldFromItemsAtPositions(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldFromItemsAtPositions(paPositions, pcCode) )
	
				on :stzHashList
					return new stzHashList( This.YieldFromItemsAtPositions(paPositions, pcCode) )
			
			other
					StzRaise("Unsupported return type!")
			off

		def HarvestFrom(panPositions, pcCode)
			return This.HarvestFrom(panPositions, pcCode)

			def HarvestFromQ(paPositions, pcCode)
				return This.HarvestFromQR(paPositions, pcCode, :stzList)
		
			def HarvestFromQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFrom(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFrom(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFrom(paPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off

		def HarvestFromPositions(panPositions, pcCode)
			return This.HarvestFrom(panPositions, pcCode)

			def HarvestFromPositionsQ(paPositions, pcCode)
				return This.HarvestFromPositionsQR(paPositions, pcCode, :stzList)
		
			def HarvestFromPositionsQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromPositions(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFromPositions(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFromPositions(paPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off

		def HarvestFromItemsAt(panPositions, pcCode)
			return This.HarvestFrom(panPositions, pcCode)

			def HarvestFromItemsAtQ(paPositions, pcCode)
				return This.HarvestFromItemsAtQR(paPositions, pcCode, :stzList)
		
			def HarvestFromItemsAtQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromItemsAt(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFromItemsAt(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFromItemsAt(paPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off

		def HarvestFromItemsAtPositions(panPositions, pcCode)
			return This.HarvestOn(panPositions, pcCode)

			def HarvestFromItemsAtPositionsQ(paPositions, pcCode)
				return This.HarvestFromItemsAtPositionsQR(paPositions, pcCode, :stzList)
		
			def HarvestFromItemsAtPositionsQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromItemsAtPositions(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFromItemsAtPositions(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFromItemsAtPositions(paPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off
		#>

		#< @FunctionMisspelledForm

		def YiledFrom(paPostions, pcCode)
			return This.YieldFrom(paPositons, pcCode)

		#>

	  #---------------------------------------------------------#
	 #  YIELDING INFORMATION FROM GIVEN POSITIONS -- EXTENDED  #
	#---------------------------------------------------------#

	/* NOTE

	This function is less performan then it's simplest form YieldFrom(),
	because it takes time to analyze the conditional code provided, spacify it,
	transile it for :stzList, so a keyword like @PrecedentItem for example, can
	be used, and the function will transpile it to "This[@i-1]" automatically.

	If performance is critical, don't use it.

	*/

	def YieldFromXT(panPositions, pcCode)
		if NOT ( isList(panPositions) and Q(panPositions).IsListOfNumbers() )
			StzRaise("Incorrect param! paPositions must be a list of numbers.")
		ok

		if len(panPositions) = 0
			return []
		ok

		panPositions = ring_sort(panPositions)
		nLenPositions = len(panPositions)

		if NOT isString(pcCode)
			StzRaise("Invalid param type! Condition must be a string.")
		ok

		if StzStringQ(pcCode).WithoutSpaces() = 0
			aTemp = []
			
			for i = 1 to nLenPositions
				aTemp + NULL
			next

			return aTemp
		ok

		pcCode = StzCCodeQ(pcCode).Transpiled()

		cCode = "aResult + ( " + pcCode + " )"
		oCode = StzStringQ(cCode)
		
		aResult = []
		nLenList = This.NumberOfItems()

		for i = 1 to nLenPositions
			@i = panPositions[i]
			@item = This[ @i ]

			bEval = TRUE

			oCodeWS = Q( oCode.WithoutSpaces() )
			bContainsIPlus1  = oCodeWS.ContainsCS( "This[@i+1]", :CS=FALSE )
			bContainsIMinus1 = oCodeWS.ContainsCS( "This[@i-1]", :CS=FALSE )

			if @i = nLenList and bContainsIPlus1
				bEval = FALSE

			but @i = 1 and bContainsIMinus1
				bEval = FALSE
			
			ok

			if bEval

				eval(cCode) # Populates aResult with the yielded information

			ok

		next

		return aResult

		#< @FunctionFluentForm

		def YieldFromXTQ(paPositions, pcCode)
			return This.YieldFromXTQR(paPositions, pcCode, :stzList)
	
		def YieldFromXTQR(paPositions, pcCode, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.YieldFromXT(paPositions, pcCode) )
	
			on :stzListOfStrings
				return new stzListOfStrings( This.YieldFromXT(paPositions, pcCode) )
				
			on :stzListOfNumbers
				return new stzListOfNumbers( This.YieldFromXT(paPositions, pcCode) )
		
			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def YieldFromPositionsXT(panPositions, pcCode)
			return This.YieldFromXT(panPositions, pcCode)

			def YieldFromPositionsXTQ(paPositions, pcCode)
				return This.YieldFromPositionsXTQR(paPositions, pcCode, :stzList)
		
			def YieldFromPositionsXTQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldFromPositionsXT(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldFromPositionsXT(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldFromPositionsXT(paPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off

		def YieldFromItemsAtXT(panPositions, pcCode)
			return This.YieldFromXT(panPositions, pcCode)

			def YieldFromItemsAtXTQ(paPositions, pcCode)
				return This.YieldFromItemsAtXTQR(paPositions, pcCode, :stzList)
		
			def YieldFromItemsAtXTQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldFromItemsAtXT(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldFromItemsAtXT(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldFromItemsAtXT(paPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off

		def YieldFromItemsAtPositionsXT(panPositions, pcCode)
			return This.YieldOnXT(panPositions, pcCode)

			def YieldFromItemsAtPositionsXTQ(paPositions, pcCode)
				return This.YieldFromItemsAtPositionsXTQR(paPositions, pcCode, :stzList)
		
			def YieldFromItemsAtPositionsXTQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldFromItemsAtPositionsXT(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldFromItemsAtPositionsXT(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldFromItemsAtPositionsXT(paPositions, pcCode) )
	
				on :stzHashList
					return new stzHashList( This.YieldFromItemsAtPositionsXT(paPositions, pcCode) )
			
			other
					StzRaise("Unsupported return type!")
			off

		def HarvestFromXT(panPositions, pcCode)
			return This.HarvestFromXT(panPositions, pcCode)

			def HarvestFromXTQ(paPositions, pcCode)
				return This.HarvestFromXTQR(paPositions, pcCode, :stzList)
		
			def HarvestFromXTQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromXT(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFromXT(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFromXT(paPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off

		def HarvestFromPositionsXT(panPositions, pcCode)
			return This.HarvestFromXT(panPositions, pcCode)

			def HarvestFromPositionsXTQ(paPositions, pcCode)
				return This.HarvestFromPositionsXTQR(paPositions, pcCode, :stzList)
		
			def HarvestFromPositionsXTQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromPositionsXT(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFromPositionsXT(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFromPositionsXT(paPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off

		def HarvestFromItemsAtXT(panPositions, pcCode)
			return This.HarvestFromXT(panPositions, pcCode)

			def HarvestFromItemsAtXTQ(paPositions, pcCode)
				return This.HarvestFromItemsAtXTQR(paPositions, pcCode, :stzList)
		
			def HarvestFromItemsAtXTQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromItemsAtXT(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFromItemsAtXT(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFromItemsAtXT(paPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off

		def HarvestFromItemsAtPositionsXT(panPositions, pcCode)
			return This.HarvestOnXT(panPositions, pcCode)

			def HarvestFromItemsAtPositionsXTQ(paPositions, pcCode)
				return This.HarvestFromItemsAtPositionsXTQR(paPositions, pcCode, :stzList)
		
			def HarvestFromItemsAtPositionsXTQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromItemsAtPositionsXT(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFromItemsAtPositionsXT(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFromItemsAtPositionsXT(paPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off
		#>

		#< @FunctionMisspelledForm

		def YiledFromXT(paPostions, pcCode)
			return This.YieldFromXT(paPositons, pcCode)

		#>

	  #======================================================#
	 #   YIELDING INFORMATION ON ITEMS IN GIVEN SECTIONS    #
	#======================================================#

	def YieldFromSections(paSections, pcCode)
		if NOT ( isList(paSections) and Q(paSections).IsListOfPairsOfNumbers() )
			StzRaise("Incorrect param! paSections must be a list of pairs of numbers.")
		ok

		# Getting all the positions from the provided sections
		# Example: [ [2,5], [7,9 ] ] --> [ 2, 3, 4, 5, 7, 8, 9 ]

		anSectionsExpanded = StzListQ(paSections).PerformQ('{
			@item = Q(@item).ExpandedIfPairOfNumbers()
		}').Content()
	
		anPositions = ListsMergeQ( anSectionsExpanded ).DuplicatesRemoved()

		return This.YieldFrom(anPositions, pcCode)

		#< @FunctionFluentForm

		def YieldFromSectionsQ(paSections, pcCode)
			return This.YieldFromSectionsQR(paPositions, pcCode, :stzList)
	
		def YieldFromSectionsQR(paPositions, pcCode, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.YieldFromSections(paPositions, pcCode) )
	
			on :stzListOfStrings
				return new stzListOfStrings( This.YieldFromSections(paPositions, pcCode) )
				
			on :stzListOfNumbers
				return new stzListOfNumbers( This.YieldFromSections(paPositions, pcCode) )
		
			other
				StzRaise("Unsupported return type!")
			off			

		#>

		#< @FunctionAlternativeForms

		def HarvestFromSections(paSections, pcCode)
			return This.YieldFromSections(paSections, pcCode)

			def HarvestFromSectionsQ(paSections, pcCode)
				return This.HarvestFromSectionsQR(paSections, pcCode, :stzList)

			def HarvestFromSectionsQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromSections(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestFromSections(paSections, pcCode) )
	
				other
					StzRaise("Unsupported param type!")
				off
	
		def YieldSections(paSections, pcCode)
			return This.YieldFromSections(paSections, pcCode)

			def YieldSectionsQ(paSections, pcCode)
				return This.YieldSectionsQR(paSections, pcCode, :stzList)

			def YieldSectionsQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.YieldSections(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.YieldSections(paSections, pcCode) )
	
				other
					StzRaise("Unsupported param type!")
				off

		def HarvestSections(paSections, pcCode)
			return This.YieldFromSections(paSections, pcCode)

			def HarvestSectionsQ(paSections, pcCode)
				return This.HarvestSectionsQR(paSections, pcCode, :stzList)

			def HarvestSectionsQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestSections(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestSections(paSections, pcCode) )
	
				other
					StzRaise("Unsupported param type!")
				off
		#>

	def YieldFromSectionsOneByOne(paSections, pcCode)
		if NOT ( isList(paSections) and Q(paSections).IsListOfPairsOfNumbers() )
			StzRaise("Incorrect param! paSections must be a list of pairs of numbers.")
		ok

		aResult = []

		anSectionsExpanded = []
		for aSection in paSections
			anSectionsExpanded + Q(aSection).ExpandedIfPairOfNumbers()
		next

		for anPositions in anSectionsExpanded
			aResult + This.YieldFromPositions(anPositions, pcCode)
		next

		return aResult

		#< @FunctionFluentForm

		def YieldFromSectionsOneByOneQ(paSections, pcCode)
			return This.YieldFromSectionsOneByOneQR(paSections, pcCode, :stzList)

		def YieldFromSectionsOneByOneQR(paSections, pcCode, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				StzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.YieldFromSectionsOneByOneQ(paSections, pcCode) )

			on :stzListOfLists
				return new stzListOfLists( This.YieldFromSectionsOneByOneQ(paSections, pcCode) )

			other
				StzRaise("Unsupported param type!")
			off

		#>

		#< @FunctionAlternativeForms

		def HarvestFromSectionsOneByOne(paSections, pcCode)
			return This.YieldFromSections(paSections, pcCode)

			def HarvestFromSectionsOneByOneQ(paSections, pcCode)
				return This.HarvestFromSectionsOneByOneQR(paSections, pcCode, :stzList)

			def HarvestFromSectionsOneByOneQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromSectionsOneByOne(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestFromSectionsOneByOne(paSections, pcCode) )
	
				other
					StzRaise("Unsupported param type!")
				off
				
		def HarvestSectionsOneByOne(paSections, pcCode)
			return This.YieldFromSections(paSections, pcCode)

			def HarvestSectionsOneByOneQ(paSections, pcCode)
				return This.HarvestSectionsOneByOneQR(paSections, pcCode, :stzList)

			def HarvestSectionsOneByOneQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestSectionsOneByOne(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestSectionsOneByOne(paSections, pcCode) )
	
				other
					StzRaise("Unsupported param type!")
				off

		def YieldSectionsOneByOne(paSections, pcCode)
			return This.YieldFromSections(paSections, pcCode)

			def YieldSectionsOneByOneQ(paSections, pcCode)
				return This.YieldSectionsOneByOneQR(paSections, pcCode, :stzList)

			def YieldSectionsOneByOneQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.YieldSectionsOneByOne(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.YieldSectionsOneByOne(paSections, pcCode) )
	
				other
					StzRaise("Unsupported param type!")
				off

		#>

	  #================================================================#
	 #   YIELDING INFORMATION ON ITEMS IN GIVEN SECTIONS -- EXTENDED  #
	#================================================================#

	def YieldFromSectionsXT(paSections, pcCode)
		if NOT ( isList(paSections) and Q(paSections).IsListOfPairsOfNumbers() )
			StzRaise("Incorrect param! paSections must be a list of pairs of numbers.")
		ok

		# Getting all the positions from the provided sections
		# Example: [ [2,5], [7,9 ] ] --> [ 2, 3, 4, 5, 7, 8, 9 ]

		anSectionsExpanded = StzListQ(paSections).PerformQ('{
			@item = Q(@item).ExpandedIfPairOfNumbers()
		}').Content()
	
		anPositions = ListsMergeQ( anSectionsExpanded ).DuplicatesRemoved()

		return This.YieldFromXT(anPositions, pcCode)

		#< @FunctionFluentForm

		def YieldFromSectionsXTQ(paSections, pcCode)
			return This.YieldFromSectionsXTQR(paPositions, pcCode, :stzList)
	
		def YieldFromSectionsXTQR(paPositions, pcCode, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.YieldFromSectionsXT(paPositions, pcCode) )
	
			on :stzListOfStrings
				return new stzListOfStrings( This.YieldFromSectionsXT(paPositions, pcCode) )
				
			on :stzListOfNumbers
				return new stzListOfNumbers( This.YieldFromSectionsXT(paPositions, pcCode) )
		
			other
				StzRaise("Unsupported return type!")
			off			

		#>

		#< @FunctionAlternativeForms

		def HarvestFromSectionsXT(paSections, pcCode)
			return This.YieldFromSectionsXT(paSections, pcCode)

			def HarvestFromSectionsXTQ(paSections, pcCode)
				return This.HarvestFromSectionsXTQR(paSections, pcCode, :stzList)

			def HarvestFromSectionsXTQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromSectionsXT(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestFromSectionsXT(paSections, pcCode) )
	
				other
					StzRaise("Unsupported param type!")
				off
	
		def YieldSectionsXT(paSections, pcCode)
			return This.YieldFromSectionsXT(paSections, pcCode)

			def YieldSectionsXTQ(paSections, pcCode)
				return This.YieldSectionsXTQR(paSections, pcCode, :stzList)

			def YieldSectionsXTQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.YieldSectionsXT(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.YieldSectionsXT(paSections, pcCode) )
	
				other
					StzRaise("Unsupported param type!")
				off

		def HarvestSectionsXT(paSections, pcCode)
			return This.YieldFromSectionsXT(paSections, pcCode)

			def HarvestSectionsXTQ(paSections, pcCode)
				return This.HarvestSectionsXTQR(paSections, pcCode, :stzList)

			def HarvestSectionsXTQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestSectionsXT(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestSectionsXT(paSections, pcCode) )
	
				other
					StzRaise("Unsupported param type!")
				off
		#>

	def YieldFromSectionsOneByOneXT(paSections, pcCode)
		if NOT ( isList(paSections) and Q(paSections).IsListOfPairsOfNumbers() )
			StzRaise("Incorrect param! paSections must be a list of pairs of numbers.")
		ok

		aResult = []

		anSectionsExpanded = []
		for aSection in paSections
			anSectionsExpanded + Q(aSection).ExpandedIfPairOfNumbers()
		next

		for anPositions in anSectionsExpanded
			aResult + This.YieldFromPositionsXT(anPositions, pcCode)
		next

		return aResult

		#< @FunctionFluentForm

		def YieldFromSectionsOneByOneXTQ(paSections, pcCode)
			return This.YieldFromSectionsOneByOneXTQR(paSections, pcCode, :stzList)

		def YieldFromSectionsOneByOneXTQR(paSections, pcCode, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				StzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.YieldFromSectionsOneByOneXTQ(paSections, pcCode) )

			on :stzListOfLists
				return new stzListOfLists( This.YieldFromSectionsOneByOneXTQ(paSections, pcCode) )

			other
				StzRaise("Unsupported param type!")
			off

		#>

		#< @FunctionAlternativeForms

		def HarvestFromSectionsOneByOneXT(paSections, pcCode)
			return This.YieldFromSectionsXT(paSections, pcCode)

			def HarvestFromSectionsOneByOneXTQ(paSections, pcCode)
				return This.HarvestFromSectionsOneByOneXTQR(paSections, pcCode, :stzList)

			def HarvestFromSectionsOneByOneXTQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromSectionsOneByOneXT(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestFromSectionsOneByOneXT(paSections, pcCode) )
	
				other
					StzRaise("Unsupported param type!")
				off
				
		def HarvestSectionsOneByOneXT(paSections, pcCode)
			return This.YieldFromSectionsXT(paSections, pcCode)

			def HarvestSectionsOneByOneXTQ(paSections, pcCode)
				return This.HarvestSectionsOneByOneXTQR(paSections, pcCode, :stzList)

			def HarvestSectionsOneByOneXTQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestSectionsOneByOneXT(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestSectionsOneByOneXT(paSections, pcCode) )
	
				other
					StzRaise("Unsupported param type!")
				off

		def YieldSectionsOneByOneXT(paSections, pcCode)
			return This.YieldFromSectionsXT(paSections, pcCode)

			def YieldSectionsOneByOneXTQ(paSections, pcCode)
				return This.YieldSectionsOneByOneXTQR(paSections, pcCode, :stzList)

			def YieldSectionsOneByOneXTQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.YieldSectionsOneByOneXT(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.YieldSectionsOneByOneXT(paSections, pcCode) )
	
				other
					StzRaise("Unsupported param type!")
				off

		#>

	  #================================================================#
	 #   YIELDING INFORMATION ON ITEMS VERIFYiNG A GIVEN CONDITION    #
	#================================================================#

	def YieldW(pcCode, pcCondition)
		/*
		o1 = new stzList([ 1, 2, 3, 4, 5, 6, 7 ])
		? o1.YieldW('@NextItem', :if = 'StzNumberQ(@item).IsMultipleOf(2)')
		*/
		if NOT isString(pcCode)
			StzRaise("Incorrect param! pcCode must be a string.")
		ok

		if isList(pcCondition) and Q(pcCondition).IsWhereOrIfNamedParam()
			pcCondition = pccondition[2]
		ok

		if NOT isString(pcCondition)
			StzRaise("Incorrect param! pcCondition must be astring.")
		ok

		anPositions = This.FindW(pcCondition)
		aResult = This.YieldFrom(anPositions, pcCode)

		return aResult

		#< @FunctionFluentForm

		def YieldWQ(pcCode, pcCondition)
				return This.YieldWQR(paPositions, pcCode, :stzList)
		
			def YieldWQR(pcCode, pcCondition, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldW(pcCode, pcCondition) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldW(pcCode, pcCondition) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldW(pcCode, pcCondition) )
	
				on :stzHashList
					return new stzHashList( This.YieldW(pcCode, pcCondition) )
			
			other
					StzRaise("Unsupported return type!")
			off

		#>

		#> @FunctionAlternativeForm

		def HarvestW(pcCode, pcCondition)
			return This.YieldW(pcCode, pcCondition)

			def HervestWQ(pcCode, pcCondition)
				return This.HarvestWQR(pcCode, pcCondition, :stzList)

			def HervestWQR(pcCode, pcCondition, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				if NOT isString(pcReturnType)
					StzRaise("IncorrectType! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestW(pcCode, pcCondition) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestW(pcCode, pcCondition) )

				other
					StzRaise("Unsupported return type!")
				off
		#>

		#< @FunctionMisspelledForm

		def YiledW(pcCode, pcCondition)
			return This.YieldW(pcCode, pcCondition)

		#>

	  #---------------------------------------------------------------------------#
	 #   YIELDING INFORMATION ON ITEMS VERIFYiNG A GIVEN CONDITION -- EXTENDED   #
	#---------------------------------------------------------------------------#

	def YieldWXT(pcCode, pcCondition)

		if NOT isString(pcCode)
			StzRaise("Incorrect param! pcCode must be a string.")
		ok

		if isList(pcCondition) and Q(pcCondition).IsWhereOrIfNamedParam()
			pcCondition = pccondition[2]
		ok

		if NOT isString(pcCondition)
			StzRaise("Incorrect param! pcCondition must be astring.")
		ok

		anPositions = This.FindWXT(pcCondition)
		aResult = This.YieldFromXT(anPositions, pcCode)

		return aResult

		#< @FunctionFluentForm

		def YieldWXTQ(pcCode, pcCondition)
				return This.YieldWXTQR(paPositions, pcCode, :stzList)
		
			def YieldWXTQR(pcCode, pcCondition, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldWXT(pcCode, pcCondition) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldWXT(pcCode, pcCondition) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldWXT(pcCode, pcCondition) )
	
				on :stzHashList
					return new stzHashList( This.YieldWXT(pcCode, pcCondition) )
			
			other
					StzRaise("Unsupported return type!")
			off

		#>

		#> @FunctionAlternativeForm

		def HarvestWXT(pcCode, pcCondition)
			return This.YieldWXT(pcCode, pcCondition)

			def HervestWXTQ(pcCode, pcCondition)
				return This.HarvestWXTQR(pcCode, pcCondition, :stzList)

			def HervestWXTQR(pcCode, pcCondition, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				if NOT isString(pcReturnType)
					StzRaise("IncorrectType! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestWXT(pcCode, pcCondition) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestWXT(pcCode, pcCondition) )

				other
					StzRaise("Unsupported return type!")
				off
		#>

	  #===============================================#
	 #  YIELDING AND CUMULATING VALUES ON EACH ITEM  #
	#===============================================#

	def YieldAndCumulate(pcCode, paReturnEachOrLast)
		/* EXAMPLE
			o1 = new stzList([ 1, 2, 3 ])
			? o1.YieldAndCumulate("@item", :ReturnEach)
			#--> [ 1, 3, 6 ]

			? o1.YieldAndCumulate("@item", :ReturnLast)
			#--> 6
		*/

		bReturnLast = FALSE

		if isList(paReturnEachOrLast)
			if len(paReturnEachOrLast) = 2 and
			   isString(paReturnEachOrLast[1]) and
			   paReturnEachOrLast[1] = :ReturnLast and
			   isNumber(paReturnEachOrLast[2]) and
			   Q(paReturnEachOrLast[2]).IsEither(TRUE, :Or = FALSE)
				bReturnLast = paReturnEachOrLast[2]
			ok

		but isString(paReturnEachOrLast)
			if paReturnEachOrLast = :ReturnLast
				bReturnLast = TRUE
			ok	
		ok

		if NOT (This.IsListOfNumbers() or This.IsListOfStrings())
			StzRaise("Can't cumulate! The list must b a list of numbers or a list of strings.")
		ok

		if NOT isString(pcCode)
			StzRaise("Incorrect param type! pcCode must be a string.")
		ok

		aYielded = This.Yield(pcCode)
		nLenYielded = len(aYielded)

		if nLenYielded > 0
			aCumulated = [ aYielded[1] ]

			if nLenYielded > 1
				for i = 2 to nLenYielded
					aCumulated + ( aCumulated[i-1] + aYielded[i] )
				next
			ok
		ok

		nLenCumulated = len(aCumulated)

		if bReturnLast
			return aCumulated[ nLenCumulated ]
		else
			return aCumulated
		ok

		#< @FunctionFluentForm

		def YieldAndCumulateQ(pcCode, paReturnEachOrLast)
			return Q(This.YieldAndCumulate(pcCode, paReturnEachOrLast))

		#>

		#< @FunctionAlternativeForm

		def HarvestAndCumulate(pcCode, paReturnEachOrLast)
			return This.YieldAndCumulate(pcCode, paReturnEachOrLast)

			def HarvestAndCumulateQ(pcCode, paReturnEachOrLast)
				This.YieldAndCumulateQ(pcCode, paReturnEachOrLast)

		#>

	  #-----------------------------------------------------------#
	 #  YIELDING AND CUMULATING VALUES ON EACH ITEM -- EXTENDED  #
	#-----------------------------------------------------------#

	def YieldAndCumulateXT(pcCode, paReturnEachOrLast)

		bReturnLast = FALSE

		if isList(paReturnEachOrLast)
			if len(paReturnEachOrLast) = 2 and
			   isString(paReturnEachOrLast[1]) and
			   paReturnEachOrLast[1] = :ReturnLast and
			   isNumber(paReturnEachOrLast[2]) and
			   Q(paReturnEachOrLast[2]).IsEither(TRUE, :Or = FALSE)
				bReturnLast = paReturnEachOrLast[2]
			ok

		but isString(paReturnEachOrLast)
			if paReturnEachOrLast = :ReturnLast
				bReturnLast = TRUE
			ok	
		ok

		if NOT ( This.IsListOfNumbers() or This.IsListOfStrings() )
			StzRaise("Can't cumulate! The list must b a list of numbers or a list of strings.")
		ok

		if NOT isString(pcCode)
			StzRaise("Incorrect param type! pcCode must be a string.")
		ok

		aYielded = This.YieldXT(pcCode)
		nLenYielded = len(aYielded)

		if nLenYielded > 0
			aCumulated = [ aYielded[1] ]

			if nLenYielded > 1
				for i = 2 to nLenYielded
					aCumulated + ( aCumulated[i-1] + aYielded[i] )
				next
			ok
		ok

		nLenCumulated = len(aCumulated)

		if bReturnLast
			return aCumulated[ nLenCumulated ]
		else
			return aCumulated
		ok

		#< @FunctionFluentForm

		def YieldAndCumulateXTQ(pcCode, paReturnEachOrLast)
			return Q(This.YieldAndCumulateXT(pcCode, paReturnEachOrLast))

		#>

		#< @FunctionAlternativeForm

		def HarvestAndCumulateXT(pcCode, paReturnEachOrLast)
			return This.YieldAndCumulateXT(pcCode, paReturnEachOrLast)

			def HarvestAndCumulateXTQ(pcCode, paReturnEachOrLast)
				This.YieldAndCumulateXTQ(pcCode, paReturnEachOrLast)

		#>

	  #--------------------------------------------------------#
	 #  APPLYING A REDUCE OPERATION ON THE ITEMS OF THE LIST  #
	#--------------------------------------------------------#

	def Reduce(pcCode)
		return This.YieldAndCumulate(pcCode, :ReturnLast)

		def ReduceQ(pcCode, paReturnEachOrLast)
			return This.Reduce(pcCode, paReturnEachOrLast)

	  #--------------------------------------------------------------------#
	 #  APPLYING A REDUCE OPERATION ON THE ITEMS OF THE LIST -- EXTENDED  #
	#--------------------------------------------------------------------#

	def ReduceXT(pcCode)
		return This.YieldAndCumulateXT(pcCode, :ReturnLast)

		def ReduceXTQ(pcCode, paReturnEachOrLast)
			return This.ReduceXT(pcCode, paReturnEachOrLast)

	  #=======================================#
	 #   PERFORMING AN ACTION ON EACH ITEM   #
	#=======================================#

	def Perform(pcAction)
		# Must begin with '@item ='

		/* Example

		aWhatIs = [ :Ring = "programming language", :Softanza = "Ring library", :Qt = "C++ framework" ]
		
		o1 = new stzList([ "Ring", "Softanza", "Qt" ])
		o1.Perform('{ @item += " is a " + aWhatIs[@item] }')
		
		? o1.Content()
		#--> [ "Ring is a programming language", "Softanza is a Ring library", "Qt is a C++ framework" ]

		*/

		if isList(pcAction) and Q(pcAction).IsDoNamedParam()
			pcAction = pcAction[2]
		ok

		This.PerformOnThesePositions(1:This.NumberOfItems(), pcAction)

		#< @FunctionfluentForm

		def PerformQ(pcAction)
			This.Perform(pcAction)
			return This

		def PerformQR(pcAction, pcReturnType)
			if IsList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				StzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return This

			on :stzListOfStrings
				return new stzListOfStrings( This.Perform(pcAction) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.Perform(pcAction) )

			on :stzListOfLists
				return new stzListOfLists( This.Perform(pcAction) )

			on :stzListOfPairs
				return new stzListOfPairs( This.Perform(pcAction) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForm

		def Doo(pcAction) # We can't use do() because it is reserved keyword by Ring
			This.Perform(pcAction)

			def DooQ(pcAction)
				return This.PerformQ(pcAction)

			def DooQR(pcAction, pcReturnType)
				return This.PerformQR(pcAction, pcReturnType)

			def DoQ(pcAction)
				return This.PerformQ(pcAction)

			def DoQR(pcAction, pcReturnType)
				return This.PerformQR(pcAction, pcReturnType)

		def Do_(pcAction) # We can't use do() because it is reserved keyword by Ring
			This.Perform(pcAction)

			def Do_Q(pcAction)
				return This.PerformQ(pcAction)

			def Do_QR(pcAction, pcReturnType)
				return This.PerformQR(pcAction, pcReturnType)

		#>

	  #---------------------------------------------------#
	 #   PERFORMIN ACTIONS ON CHARS IN GIVEN POSITIONS   #
	#---------------------------------------------------#

	def PerformOn(panPositions, pcCode)
		#< @MotherFunction > ReplaceItemAtPosition() | @RingBased #>

		if NOT ( isList(panPositions) and (Q(panPositions).IsListOfNumbers() or len(panPositions) = 0) )
			StzRaise("Invalid param type! panPositions must be a list of numbers.")
		ok

		if len(panPositions) = 0
			return
		ok

		if NOT isString(pcCode)
			StzRaise("Invalid param type! pcCode must be a string.")
		ok

		oCode = new stzString( StzCCodeQ(pcCode).Transpiled() )
		
		if oCode.WithoutSpaces() = ''
			return
		ok

		if NOT oCode.BeginsWithOneOfTheseCS(
			[ "@item =", "@item=",
			  "@item +=", "@item+=",
			  "@item -=", "@item-=",
			  "@item *=", "@item*=",
			  "@item /=", "@item/="
			],

			:CaseSensitive = FALSE )

			StzRaise("Syntax error! pcCode must begin with '@item ='.")
		ok

		cCode = oCode.Content()
		oCode = StzStringQ(cCode)

		@i = 0
		
		for @i in panPositions

			bEval = TRUE

			if @i = This.NumberOfItems() and
			   oCode.Copy().RemoveSpacesQ().ContainsCS( "This[@i+1]", :CS=FALSE )

				bEval = FALSE

			but @i = 1 and
			    oCode.Copy().RemoveSpacesQ().ContainsCS( "This[@i-1]", :CS=FALSE )

				bEval = FALSE
			
			ok

			if bEval

			eval(cCode)
				This.ReplaceItemAtPosition(@i, @item)
			ok

		next

		#--

		def PerformOnQ(panPositions, pcCode)
			This.PerformOn(panPositions, pcCode)
			return This

		def PerformOnQR(panPositions, pcCode)
			if IsList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				StzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return This

			on :stzListOfStrings
				return new stzListOfStrings( This.PerformOn(panPositions, pcCode) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.PerformOn(panPositions, pcCode) )

			on :stzListOfLists
				return new stzListOfLists( This.PerformOn(panPositions, pcCode) )

			on :stzListOfPairs
				return new stzListOfPairs( This.PerformOn(panPositions, pcCode) )

			other
				StzRaise("Unsupported return type!")
			off

		#--

		def PerformOnPositions(panPositions, pcCode)
			This.PerformOn(panPositions, pcCode)

			def PerformOnPositionsQ(panPositions, pcCode)
				This.PerformOnPositions(panPositions, pcCode)
				return This
	
			def PerformOnPositionsQR(panPositions, pcCode, pcReturnType)
				if IsList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok
	
				switch pcReturnType
				on :stzList
					return This
	
				on :stzListOfStrings
					return new stzListOfStrings( This.PerformOnPositions(panPositions, pcCode) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.PerformOnPositions(panPositions, pcCode) )
	
				on :stzListOfLists
					return new stzListOfLists( This.PerformOnPositions(panPositions, pcCode) )
	
				on :stzListOfPairs
					return new stzListOfPairs(This.PerformOnPositions(panPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off

		#--

		def PerformOnThesePositions(panPositions, pcCode)
			This.PerformOn(panPositions, pcCode)

			def PerformOnThesePositionsQ(panPositions, pcCode)
				This.PerformOnThesePositions(panPositions, pcCode)
				return This

			def PerformOnThesePositionsQR(panPositions, pcCode, pcReturnType)
				if IsList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok
	
				switch pcReturnType
				on :stzList
					return This
	
				on :stzListOfStrings
					return new stzListOfStrings( This.PerformOnThesePositions(panPositions, pcCode) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.PerformOnThesePositions(panPositions, pcCode) )
	
				on :stzListOfLists
					return new stzListOfLists( This.PerformOnThesePositions(panPositions, pcCode) )
	
				on :stzListOfPairs
					return new stzListOfPairs( This.PerformOnThesePositions(panPositions, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
	
				off

	  #------------------------------------------------------#
	 #   PERFORMING AN ACTION ON ITEMS AT GIVEN SECTIONS    #
	#------------------------------------------------------#

	def PerformOnSections(paSections, pcCode)

		# Checking correctness of paSections param

		If NOT isString(pcCode)
			StzRaise("Incorrect param! pcCode must be a string.")
		ok

		if NOT ( isList(paSections) and

			 Q(paSections).EachItemVerifyW(
				:That = 'isList(@item) and Q(@item).IsPairOfNumbers()' ) )

			StzRaise("Incorrect param! paSections must be a list of pairs of numbers.")
		ok

		# Getting all the positions from the provided sections
		# Example: [ [2,5], [7,9 ] ] --> [ 2, 3, 4, 5, 7, 8, 9 ]

		anSectionsExpanded = StzListQ(paSections).PerformQ('{
			@item = Q(@item).ExpandedIfPairOfNumbers()
		}').Content()
	
		anPositions = ListsMergeQ( anSectionsExpanded ).DuplicatesRemoved()

		This.PerformOn(anPositions, pcCode)

		#--

		def PerformOnSectionsQ(paSections, pcCode)
			This.PerformOnSections(paSections, pcCode)
			return This

		def PerformOnSectionsQR(paSections, pcCode, pcReturnType)
			if IsList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				StzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return This

			on :stzListOfStrings
				return new stzListOfStrings( This.PerformOnSections(paSections, pcCode) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.PerformOnSections(paSections, pcCode) )

			on :stzListOfLists
				return new stzListOfLists( This.PerformOnSections(paSections, pcCode) )

			on :stzListOfPairs
				return new stzListOfPairs( This.PerformOnSections(paSections, pcCode) )

			other
				StzRaise("Unsupported return type!")
			off

		#--

		def PerformOnTheseSections(paSections, pcCode)
			This.PerformOnSections(paSections, pcCode)

			def PerformOnTheseSectionsQ(paSections, pcCode)
				This.PerformOnTheseSections(paSections, pcCode)
				return This

			def PerformOnTheseSectionsQR(paSections, pcCode, pcReturnType)
				if IsList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					StzRaise("Incorrect param! pcReturnType must be a string.")
				ok
	
				switch pcReturnType
				on :stzList
					return This
	
				on :stzListOfStrings
					return new stzListOfStrings( This.PerformOnTheseSections(paSections, pcCode) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.PerformOnTheseSections(paSections, pcCode) )
	
				on :stzListOfLists
					return new stzListOfLists( This.PerformOnTheseSections(paSections, pcCode) )
	
				on :stzListOfPairs
					return new stzListOfPairs( This.PerformOnTheseSections(paSections, pcCode) )
	
				other
					StzRaise("Unsupported return type!")
				off
	
	  #---------------------------------------------------------------#
	 #   PERFORMING AN ACTION ON ITEMS VERIFYING A GIVEN CONDITION   #
	#---------------------------------------------------------------#

	def PerformW(pcAction, pcCondition)
		
		if isList(pcAction) and Q(pcAction).IsDoNamedParam()
			pcAction = pcAction[2]
		ok

		if NOT isString(pcAction)
			StzRaise("Incorrect type! pcAction must be a string.")
		ok
		
		if isList(pcCondition) and Q(pcCondition).IsIfOrWhereNamedParam()

			pcCondition = pcCondition[2]
		ok

		if NOT isString(pcCondition)
			StzRaise("Incorrect type! pcCondition must be a string.")
		ok

		# No need to purify the pcCondition code here,
		# FindItemsW() will do it

		anPositions = This.FindItemsW(pcCondition)

		# Do not purify pcAction code here,
		# PerformOn() will do it

		This.PerformOn(anPositions, pcAction)

		#< @FunctionFluentForm

		def PerformWQ(pcAction, pcCondition)
			This.PerformW(pcAction, pcCondition)
			return This

		def PerformWQR(pcAction, pcCondition, pcReturnType)
			if IsList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				StzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return This

			on :stzListOfStrings
				return new stzListOfStrings( This.PerformW(pcAction, pcCondition) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.PerformW(pcAction, pcCondition) )

			on :stzListOfLists
				return new stzListOfLists( This.PerformW(pcAction, pcCondition) )

			on :stzListOfPairs
				return new stzListOfPairs( This.PerformW(pcAction, pcCondition) )

			other
				StzRaise("Unsupported return type!")
			off
		#>

		#< @FunctionAlternativeForm

		def DoW( pcAction, pcCondition )
			This.PerformW( pcAction, pcCondition )

			def DoWQ( pcAction, pcCondition )
				return This.PerformWQ( pcAction, pcCondition )

			def DoWQR( pcAction, pcCondition, pcReturnType )
				return This.PerformWQR( pcAction, pcCondition, pcReturnType )
		#>

	  #==================================================#
	 #  CHECKING IF THE LIST IS EQUAL TO AN OTHER LIST  #
	#==================================================#

	def IsEqualToCS(paOtherList, pCaseSensitive)
		/*
		Two lists are equal when they have:
			1. same type
			2. same number of items AND
			3. same content
		*/

		# A check made to enable some external code
		# In Ring context use IsEqualToQ()

		if isObject(paOtherList)

			content = paOtherList.Content()

			if isList(content) and
		  	   len(content) = len(This.List()) and
		  	   This.HasSameContentAsCS(content, pCaseSensitive)

				return paOtherList
			else
				return FALSE
			ok
		ok

		if NOT isList(paOtherList)
			return FALSE
		ok

		# Doublechecking for potential performance gain

		if This.NumberOfItems() != len(paOtherList)
			return FALSE
		ok

		if isList(paOtherList) and
		   len(paOtherList) = len(This.List()) and
		   This.HasSameContentAsCS(paOtherList, pCaseSensitive)

			return TRUE
		else
			return FALSE
		ok

		#< @FunctionFluentForm

		def IsEqualToCSQ(paOtherList)

			bResult = FALSE

			if isList(paOtherList)
				bResult = This.IsEqualToCS(paOtherList, pCaseSensitive)
				
			ok

			if bResult = TRUE
				return This
			else
				return new stzFalsObject
			ok

		#>

		#< @FunctionAlternativeForms

		def IsEqualCS(paOtherList, pCaseSensitive)
			if isList(paOtherList) and Q(paOtherList).IsToNamedParam()
				pOtherList = pOtherList[2]
			ok

			return This.IsEqualToCS(paOtherList, pCaseSensitive)

		def IsNotEqualToCS(paOtherList, pCaseSensitive)
			return NOT This.IsEqualToCS(paOtherList, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def IsEqualTo(paOtherList)
		return This.IsEqualToCS(paOtherList, :CaseSensitive = TRUE)

		def IsEqualToQ(paOtherList)
			return This.IsEqualToCSQ(paOtherList, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def IsEqual(paOtherList)
			if isList(paOtherList) and Q(paOtherList).IsToNamedParam()
				pOtherList = pOtherList[2]
			ok

			return This.IsEqualTo(paOtherList)

			def IsEqualQ(paOtherList)
				return This.IsEqualToQ(paOtherList)

		#>

		#< @FunctionNegativeForm

		def IsNotEqualTo(paOtherList)
			return NOT This.IsEqualTo(paOtherList)

		#>

	  #-----------------------------------------------------------#
	 #  CHECKING IF THE LIST IS STRICTLY EQUAL TO AN OTHER LIST  #
	#-----------------------------------------------------------#

	def IsStrictlyEqualToCS(paOtherList, pCaseSensitive)

		/*
		Tow lists are striclty equal when:
			1. they are equal (in the sense of IsEqualTo() method)
			2. they have same order of items (ItemsHaveSameOrder())
		*/
		
		if This.IsEqualToCS(paOtherList, pCaseSensitive) and
		   This.ItemsHaveSameOrderAs(paOtherList)
			return TRUE
		else
			return FALSE
		ok

		#< @FunctionAlternativeForms

		def IsStrictlyEqualCS(paOtherList, pCaseSensitive)
			if isList(paOtherList) and Q(paOtherList).IsToNamedParam()
				pOtherList = pOtherList[2]
			ok

			return This.IsStrictlyEqualToCS(paOtherList, pCaseSensitive)

		def IsIdenticalToCS(paOtherList, pCaseSensitive)
			return This.IsStrictlyEqualToCS(paOtherList, pCaseSensitive)

		def IsIdenticalCS(paOtherList, pCaseSensitive)
			if isList(paOtherList) and Q(paOtherList).IsToNamedParam()
				pOtherList = pOtherList[2]
			ok

			return This.IsStrictlyEqualToCS(paOtherList, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def IsStrictlyEqualTo(paOtherList)
		return This.IsStrictlyEqualToCS(paOtherList, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def IsStrictlyEqual(paOtherList, pCaseSensitive)
			if isList(paOtherList) and Q(paOtherList).IsToNamedParam()
				pOtherList = pOtherList[2]
			ok

			return This.IsStrictlyEqualTo(paOtherList)

		def IsIdenticalTo(paOtherList)
			return This.IsStrictlyEqualTo(paOtherList)

		def IsIdentical(paOtherList)
			if isList(paOtherList) and Q(paOtherList).IsToNamedParam()
				pOtherList = pOtherList[2]
			ok

			return This.IsStrictlyEqualTo(paOtherList)

		#>

	  #--------------------------------------------------------#
	 #  CHECKING IF THE LIST IS QUEIT EQUAL TO AN OTHER LIST  #
	#--------------------------------------------------------#

	def IsQuietEqualTo(paOtherList)

		if This.IsEqualTo(paOtherList)
			return TRUE
		ok

		nDif = abs(This.NumberOfItems() - StzListQ(paOtherList).NumberOfItems())
		n = nDif / This.NumberOfItems()
		
		if n < QuietEqualityRatio() # 0.09 by default, can be changed with SetQuietEqualityRatio(n)
			return TRUE
		ok

		return FALSE

		def IsQuietEqual(paOtherList)
			return This.IsQuietEqualTo(paOtherList)

	  #--------------------------------------------------------#
	 #  CHECKING IF THE LIST HAS SAME ORDER AS AN OTHER LIST  #
	#--------------------------------------------------------#

	def ItemsHaveSameOrderAs(paOtherList)
		if NOT isList(paOtherList)
			StzRaise("Incorrect param type! paOtherList must be a list.")
		ok

		aContent = This.Content()
		nLenList = This.NumberOfItems()
		nLenOtherList = len(paOtherList)
		nMin = StzListOfNumbersQ([nLenList, nLenOtherList]).Min()

		bResult = TRUE

		for i = 1 to nMin
			if Q(aContent[i]).IsNotEqualTo(paOtherList[i])
				bResult = FALSE
				exit
			ok
		next

		return bResult
	
		def ItemsHaveSameOrder(paOtherList)
			return This.ItemsHaveSameOrderAs(paOtherList)

	  #------------------------------------------------------------#
	 #  CHECKING IF ALL THE ITEMS ARE EIGTHER NUMBERS OR ITEMS  #
	#------------------------------------------------------------#

	def AllItemsAreNumbersOrStrings()
		bResult = TRUE
		for item in This.List()
			if NOT (isNumber(item) or isString(item))
				bResult = FALSE
				exit
			ok
		next
		return bResult

		def ItemsAreNumbersOrStrings()
			return This.AllItemsAreNumbersOrStrings()

		def AllItemsAreStringsOrNumbers()
			return This.AllItemsAreNumbersOrStrings()

		def ItemsAreStringsOrNumbers()
			return This.AllItemsAreNumbersOrStrings()

	  #-------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS 2 NUMBERS  #
	#-------------------------------------------#

	def BothAreNumbers()
		if This.NumberOfItems() = 2 and
		   isNumber(This[1]) and isNumber(This[2])

			return TRUE
		else
			return FALSE
		ok

		def ContainsTwoNumbers()
			return This.BothAreNumbers()

		def Contains2Numbers()
			return This.BothAreNumbers()

	  #-------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS 2 STRINGS  #
	#-------------------------------------------#

	def BothAreStrings()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and isString(This[2])

			return TRUE
		else
			return FALSE
		ok

		def ContainsTwoStrings()
			return This.BothAreStrings()

		def Contains2Strings()
			return This.BothAreStrings()

	  #-----------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS 2 LISTS  #
	#-----------------------------------------#

	def BothAreLists()
		if This.NumberOfItems() = 2 and
		   isList(This[1]) and isList(This[2])

			return TRUE
		else
			return FALSE
		ok

		def ContainsTwoLists()
			return This.BothAreLists()

		def Contains2Lists()
			return This.BothAreLists()

	  #-------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS 2 OBJECTS  #
	#-------------------------------------------#

	def BothAreObjects()
		if This.NumberOfItems() = 2 and
		   isObject(This[1]) and isObject(This[2])

			return TRUE
		else
			return FALSE
		ok

		def ContainsTwoObjects()
			return This.BothAreObjects()

		def Contains2Objects()
			return This.BothAreObjects()

	  #--------------------------------------------------------#
	 #  CHECKING IF THE LIST IS THE REVERSE OF AN OTHER LIST  #
	#--------------------------------------------------------#

	def IsReverseOf(paOtherList)
		if NOT isList(paOtherList)
			StzRaise("Incorrect param type! paOtherList must be a list.")
		ok

		nLen = This.NumberOfItems()
		nLenOtherList = len(paOtherList)

		if nLen != nOtherList
			return FALSE
		ok

		aContent = This.Content()

		bResult = TRUE
		for i = 1 to nLen
			if Q(aContent[i]).IsDifferentFrom( paOtherList[ nLenOtherList - i + 1 ] )
				bResult = FALSE
				exit
			ok
		next i

		return bResult

		def IsReverse(paOtherList)
			return This.IsReverseOf(paOtherList)

	  #-------------------------------------#
	 #  REVERSING ITEMS ORDER IN THE LIST  #
	#-------------------------------------#

	def Reverse()

		aResult = ring_reverse( This.List() )
		This.Update( aResult )

		def ReverseQ()
			This.Reverse()
			return This

		#< @FunctionAlternativeForms

		def ReverseOrder()
			This.Reverse()

			def ReverseOrderQ()
				This.ReverseOrder()
				return This

		def ReverseItems()
			This.Reverse()

			def ReverseItemsQ()
				This.ReverseItems()
				return This

		def ReverseItemsOrder()
			This.Reverse()

			def ReverseItemsOrderQ()
				This.ReverseItemsOrder()
				return This

		#>

	def Reversed()
		aResult = This.Copy().ReverseQ().Content()
		return aResult

		#< @FunctionAlternativeForms

		def ItemsReversed()
			return This.Reversed()

		def ItemsOrderReversed()
			return This.Reversed()

		def OrderReversed()
			return This.Reversed()

		#>

	  #----------------------------------------------------------#
	 #  CHECKING IF THE LIST HAS MORE ITEMS THAN AN OTHER LIST  #
	#----------------------------------------------------------#

	def HasMoreNumberOfItems(paOtherList)
		if isList(paOtherList) and Q(paOtherList).IsThenNamedParam()
			paOtherList = paOtherList[2]
		ok

		if This.NumberOfItems() > len(paOtherList)
			return TRUE
		else
			return FALSE
		ok

		#< @FunctionAlternativeForms

		def HasMoreNumberOfItemsThen(paOtherList)
			return This.HasMoreNumberOfItems(paOtherList)

		def HasMoreItems(paOtherList)
			return This.HasMoreNumberOfItems(paOtherList)

		def HasMoreItemsThen(paOtherList)
			return This.HasMoreNumberOfItems(paOtherList)

		#--

		def ContainsMoreNumberOfItems(paOtherList)
			return This.HasMoreNumberOfItems(paOtherList)

		def ContainsMoreNumberOfItemsThen(paOtherList)
			return This.HasMoreNumberOfItems(paOtherList)

		def ContainsMoreItems(paOtherList)
			return This.HasMoreNumberOfItems(paOtherList)

		def ContainsMoreItemsThen(paOtherList)
			return This.HasMoreNumberOfItems(paOtherList)

		#--

		def IsLarger(paOtherList)
			return This.HasMoreNumberOfItems(paOtherList)

		def IsLargerThen(panOtherList)
			return This.HasMoreNumberOfItems(paOtherList)
	
		#>

	  #----------------------------------------------------------#
	 #  CHECKING IF THE LIST HAS LESS ITEMS THAN AN OTHER LIST  #
	#----------------------------------------------------------#

	def HasLessNumberOfItems(paOtherList)
		if isList(paOtherList) and Q(paOtherList).IsThenNamedParam()
			paOtherList = paOtherList[2]
		ok

		if This.NumberOfItems() < len(paOtherList)
			return TRUE
		else
			return FALSE
		ok

		#< @FunctionAlternativeForms

		def HasLessNumberOfItemsThen(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		def HasLessItems(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		def HasLessItemsThen(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		#--

		def ContainsLessNumberOfItems(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		def ContainsLessNumberOfItemsThen(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		def ContainsLessItems(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		def ContainsLessItemsThen(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		#--

		def IsSmaller(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		def IsSmallerThen(panOtherList)
			return This.HasLessNumberOfItems(paOtherList)
	
		#--

		def HasFewerNumberOfItemsThen(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		def HasFewerItems(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		def HasFewerItemsThen(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		#--

		def ContainsFewerNumberOfItems(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		def ContainsFewerNumberOfItemsThen(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		def ContainsFewerItems(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		def ContainsFewerItemsThen(paOtherList)
			return This.HasLessNumberOfItems(paOtherList)

		#>

	  #--------------------------------------------#
	 #  CHECKING IF A GIVEN VALUE IS ALSO A LIST  #
	#--------------------------------------------#

	def HasSameTypeAs(p)
		return isList(p)

		def HasSameType(p)
			return This.HasSameTypeAs(p)

	  #--------------------------------------------------------------------#
	 #  CHECKING IF LIST HAS THE SAME CONTENT AS AN OTHER LIST OR ITEM  #
	#--------------------------------------------------------------------#

	def HasSameContentCS(paOtherList, pCaseSensitive)
		if isList(paOtherList) and Q(paOtherList).IsAsNamedParam()
			paOtherList = paOtherList[2]
		ok

		if NOT isList(paOtherList)
			StzRaise("Invalid param type! paOtherList should be a list.")
		ok

		# The two lists must have same number of items

		If  This.NumberOfItems() != len(paOtherList)
			return FALSE
		ok

		bResult = TRUE

		for item in paOtherList
			if NOT This.ContainsCS(item, pCaseSensitive)
				bResult = FALSE
				exit
			ok
		next
			
		return bResult
	
		def HasSameContentAsCS(paOtherList, pCaseSensitive)
			return This.HasSameContentCS(paOtherList, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def HasSameContent(paOtherList)
		return This.HasSameContentCS(paOtherList, :CaseSensitive = TRUE)

		def HasSameContentAs(paOtherList)
			return This.HasSameContent(paOtherList)

	  #=====================================#
	 #    CLASSIFYING (OR CATEGORIZING)    #
	#=====================================#

	def AllItemsAreContiguousLists()
		bResult = TRUE

		for item in This.List()
			if NOT ( isList(item) and StzListQ(item).IsContiguous() )
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def AllItemsAreContinuousLists()
			return This.AllItemsAreContiguousLists()

	def Classify()

		/* EXAMPLE

		aList = [
			:Arabic,
			:Arabic,
			:French,
			:English,
			:Spanish,
			:Spanish,
			:English,
			:Arabic
		]
		
		StzListQ(aList) {
		 	? Classify()
			#--> [
			# 	:Arabic  = [ 1, 2, 8 ],
			# 	:French  = [ 3 ],
			# 	:Enslish = [ 4, 7 ],
			#    	:Spanish = [ 5, 6 ]
			#    ]
		}
		*/

		aClasses = This.UniqueItems()

		cClass   = ""
		aResult  = []

		for pClass in aCLasses
			anPositions = This.FindAll(pClass)

			cClass = @@( pClass )

			aResult + [ cClass, anPositions ]

		next

		return aResult

		#< @FunctionFluentForm

		def ClassifyQ()
			return This.ClassifyQR(:stzList)

		def ClassifyQR(pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.Classify() )

			on :stzHashList
				return new stzHashList( This.Classify() )

			other
				StzRaise("Unssupported return type!")

			off
		#>

		#< @FunctionAlternativeForms

		def Categorize()
			return This.Classify()

			def CategorizeQ()
				return This.CategorizeQR(:stzList)
	
			def CategorizeQR(pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.Categorize() )
	
				on :stzHashList
					return new stzHashList( This.Categorize() )
	
				other
					StzRaise("Unssupported return type!")
	
				off

		def Categorise()
			return This.Classify()

			def CategoriseQ()
				return This.CategoriseQR(:stzList)
	
			def CategoriseQR(pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.Categorise() )
	
				on :stzHashList
					return new stzHashList( This.Categorise() )
	
				other
					StzRaise("Unssupported return type!")
	
				off

		#>

	#--

	def Classes()

		aClasses = StzHashListQ( This.Classify() ).Keys()
		return aClasses


		#< @FunctionFluentForm

		def ClassesQ()
			return This.ClassesQR(:stzList)

		def ClassesQR(pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.Classes() )

			on :stzListOfStrings
				return new stzListOfStrings( This.Classes() )

			other
				StzRaise("Unsupported return type!")
			off
		#>

		#< @FunctionAlternativeForm

		def Categories()
			return This.Classes()

			def CategoriesQ()
				return This.ClassesQR(:stzList)
	
			def CategoriesQR(pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.Categories() )
	
				on :stzListOfStrings
					return new stzListOfStrings( This.Categories() )
	
				other
					StzRaise("Unsupported return type!")
				off

	#--

	def NumberOfClasses()
		return len( This.Classes() )

		def NumberOfClassesQ()
			return new stzNumber( This.NumberOfClasses() )

		def NumberOfCategories()
			return This.NumberOfClasses()

			def NumberOfCategoriesQ()
				return new stzNumber( This.NumberOfCategories() )

		def CuontClasses()
			return This.NumberOfClasses()

		def HowManyClasses()
			return This.NumberOfClasses()

		def HowManyClass()
			return This.NumberOfClasses()


	def Klass(pcClass)
		return This.Classify()[pcClass]

		def KlassQ(pcClass)
			return new stzString(This.Klass(pcClass))

		def Category(pcClass)
			return This.Klass(pcClass)

			def CategoryQ(pcClass)
				return new stzString(This.Category(pcClass))

	def NumberOfOccurrenceOfClass(pcClass)
		nResult = StzListQ( This.Classes() ).NumberOfOccurrence( pcClass )
		return nResult

		def CountClass(pcClass)
			return This.NumberOfOccurrenceOfClass(pcClass)

		def CountOccurrencesOfClass(pcClass)
			return This.NumberOfOccurrenceOfClass(pcClass)

		def HowManyOccurrencesOfClass(pcClass)
			return This.NumberOfOccurrenceOfClass(pcClass)

		def HowManyOccurrenceOfClass(pcClass)
			return This.NumberOfOccurrenceOfClass(pcClass)


	def ClassFrequency(pcClass)
		nResult = This.NumberOfOccurrenceOfClass(pcClass) / This.NumberOfClasses()

		def ClassFreq(pcClass)

	def ClassesFrequencies()
		anResult = []
		for cClass in This.Classes()
			anResult + This.ClassFrequency(pcClass)
		next
		return anResult

		def ClassesFreq()
			return This.ClassesFrequencies()

	def ClassesAndTheirFrequencies()
		acClasses 	= This.Classes()
		anFrequencies 	= This.ClassesFrequencies()

		aResult = StzLisQ( acClasses ).AssociatedWith( anFrequencies )

		return aResult

		def ClassesAndTheirFreq()
			return This.ClassesAndTheirFrequencies()

		def ClassesXT()
			return This.ClassesAndTheirFrequencies()

	   #--------------------------------------------------------#
	  #   CLASSIFYING: SPECIEFIC CASE OF LISTS MADE OF LISTS   #
	 #   OF NUMBERS IN WHICH THE _:_ SYNTAX IS PREFERRED      #
	#--------------------------------------------------------#

	# @C prefix is used to say this function returns its result with
	# list of numbers in the _:_ Contiguous List syntax
	# provided by Ring. See example hereafter.

	def ClassifySF()	# Specific for lists of lists of numbers
				# Returs classes in the "_:_" syntax
				# @C for Continuous lists
	
		/* EXAMPLE
		o1 = new stzList([
			1:5, 3:9, 1:5, 10:15, 3:9, 12:20, 10:15, 1:5, 12:20
		])
		
		? o1.ClassifySF()	# Same as Categorize()
		#--> [
		#	[ "1:5",   [1, 3, 8 ] ],	
		#	[ "3:9",   [2, 5 ] ],
		#	[ "10:15", [4, 7 ] ],
		#	[ "12:20", [6, 9 ]
		#    ]

		*/

		acClasses@C = This.ClassesSF()

		aPositions = StzHashListQ( This.Classify() ).Values()

		aResult = StzListQ(acClasses@C).AssociatedWith(aPositions)

		return aResult

		#< @FunctionFluentForm

		def Classify@CQ()
			return This.Classify@CQR(:stzList)

		def Classify@CQR(pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.ClassifySF() )

			on :stzHashList
				return new stzHashList( This.ClassifySF() )

			other
				StzRaise("Unssupported return type!")

			off
		#>

		#< @FunctionAlternativeForms

		def CategorizeSF()
			return This.ClassifySF()

			def Categorize@CQ()
				return This.Categorize@CQR(:stzList)
	
			def Categorize@CQR(pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.CategorizeSF() )
	
				on :stzHashList
					return new stzHashList( This.CategorizeSF() )
	
				other
					StzRaise("Unssupported return type!")
	
				off

		def CategoriseSF()
			return This.ClassifySF()

			def Categorise@CQ()
				return This.Categorise@CQR(:stzList)
	
			def Categorise@CQR(pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.CategoriseSF() )
	
				on :stzHashList
					return new stzHashList( This.CategoriseSF() )
	
				other
					StzRaise("Unssupported return type!")
	
				off

		#>

	def ClassesSF()
		acClasses = This.Classes()

		for cClass in acClasses
			cClass = StzStringQ(cClass).ToListInShortForm()
		next

		return acClasses

		#< @FunctionFluentForm

		def Classes@CQ()
			return This.Classes@CQR(:stzList)

		def Classes@CQR(pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.ClassesSF() )

			on :stzListOfStrings
				return new stzListOfStrings( This.ClassesSF() )

			other
				StzRaise("Unsupported return type!")
			off
		#>

		#< @FunctionAlternativeForm

		def CategoriesSF()
			return This.ClassesSF()

			def Categories@CQ()
				return This.Classes@CQR(:stzList)
	
			def Categories@CQR(pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.CategoriesSF() )
	
				on :stzListOfStrings
					return new stzListOfStrings( This.CategoriesSF() )
	
				other
					StzRaise("Unsupported return type!")
				off

	def KlassSF(pcClass)
		aResult = []

		if isString(pcClass) and StzStringQ(pcClass).IsListInShortForm()
			cClass =Q(pcClass).WithoutSpaces()
			aResult = This.ClassifySF()[cClass]
		ok

		return aResult

		def Klass@CQ(pcClass)
			return new stzString( This.KlassSF(pcClass) )

		def CategorySF(pcClass)
			return This.KlassSF(pcClass)

			def Category@CQ(pcClass)
				return new stzString( This.CategorySF(pcClass) )

	def NumberOfOccurrenceOfClassSF(pcClass)
		nResult = StzListQ( This.ClassesSF() ).NumberOfOccurrence( pcClass )
		return nResult

		def CountClassSF(pcClass)
			return This.NumberOfOccurrenceOfClassSF(pcClass)

		def HowManyClassSF(pcClass)
			return This.NumberOfOccurrenceOfClassSF(pcClass)

		def CountOccurrencesOfClassSF(pcClass)
			return This.NumberOfOccurrenceOfClassSF(pcClass)

		def HowManyOccurrencesOfClassSF(pcClass)
			return This.NumberOfOccurrenceOfClassSF(pcClass)

		def HowManyOccurrenceOfClassSF(pcClass)
			return This.NumberOfOccurrenceOfClassSF(pcClass)

		
	def ClassFrequencySF(pcClass)
		nResult = This.NumberOfOccurrenceOfClassSF(pcClass) / This.NumberOfClasses()
		return nResult

		def ClassFreqSF(pcClass)
			return This.ClassFrequencySF(pcClass)

	def ClassesFrequenciesSF()
		anResult = []
		for cClass in This.ClassesSF()
			anResult + This.ClassFrequencySF(pcClass)
		next
		return anResult

		def ClassesFreqSF()
			return This.ClassesFrequenciesSF()

	def ClassesAndTheirFrequenciesSF()
		acClasses 	= This.ClassesSF()
		anFrequencies 	= This.ClassesFrequencies()

		aResult = StzLisQ( acClasses ).AssociatedWith( anFrequencies )

		return aResult

		def ClassesAndTheirFreqSF()
			return This.ClassesAndTheirFrequenciesSF()

		def ClassesXTSF()
			return This.ClassesAndTheirFrequenciesSF()

	  #-----------------------------------------------------#
	 #   THE LIST IS MADE OF CONTIGUOUS CHARS OR NUMBERS   #
	#-----------------------------------------------------#

	def IsContiguous()
		bResult = FALSE

		if This.IsListOfNumbers()

			bResult = This.ToStzListOfNumbers().IsContiguous()

		but This.IsListOfChars()

			bResult = This.ToStzListOfChars().IsContiguous()

		ok

		return bResult

		def IsContinuous()
			return IsContiguous()

	  #==================================#
	 #  BISECTING THE LIST INTO HALVES  #
	#==================================#

	#-- FIRST HALF

	def FirstHalf()

		nPos = floor(This.NumberOfItems() / 2)
		acResult = This.Section(1, nPos)

		return acResult

	def FirstHalfAndPosition()
		aResult = [ This.FirstHalf(), 1 ]
		return aResult

		def FirstHalfAndItsPosition()
			return This.FirstHalfAndPosition()

	def FirstHalfAndSection()
		aResult = [ This.FirstHalf(), [1, floor(This.NumberOfItems() / 2)] ]
		return aResult

		def FirstHalfAndItsSection()
			return This.FirstHalfAndSection()
		
	def FirstHalfXT()

		nPos = ceil(This.NumberOfItems() / 2)
		acResult = This.Section(1, nPos)

		return acResult
		
	def FirstHalfAndPositionXT()
		aResult = [ This.FirstHalfXT(), 1 ]
		return aResult

		def FirstHalfAndItsPositionXT()
			return This.FirstHalfAndPositionXT()

	def FirstHalfAndSectionXT()
		aResult = [ This.FirstHalfXT(), [1, ceil(This.NumberOfItems() / 2)] ]
		return aResult

		def FirstHalfAndItsSectionXT()
			return This.FirstHalfAndSectionXT()

	#-- SECOND HALF

	def SecondHalf()
		nLen = This.NumberOfItems()
		nPos = floor(nLen / 2) + 1
		acResult = This.Section(nPos, nLen)

		return acResult

	def SecondHalfAndPosition()
		nLen = This.NumberOfItems()
		nPos = floor(nLen / 2) + 1
		aResult = [ This.SecondHalf(), nPos ]
		return aResult

		def SecondHalfAndItsPosition()
			return This.SecondHalfAndPosition()

	def SecondHalfAndSection()
		nLen = This.NumberOfItems()
		nPos = floor(nLen / 2) + 1
		aResult = [ This.SecondHalf(), [ nPos, nLen ] ]
		return aResult

		def SecondHalfAndItsSection()
			return This.SecondHalfAndSection()

	def SecondHalfXT()
		nLen = This.NumberOfItems()
		nPos = ceil(nLen / 2) + 1
		acResult = This.Section(nPos, nLen)

		return acResult

	def SecondHalfAndPositionXT()
		nLen = This.NumberOfItems()
		nPos = ceil(nLen / 2) + 1
		aResult = [ This.SecondHalfXT(), nPos ]
		return aResult

		def SecondHalfAndItsPositionXT()
			return This.SecondHalfAndPositionXT()

	def SecondHalfAndSectionXT()
		nLen = This.NumberOfItems()
		nPos = ceil(nLen / 2) + 1
		aResult = [ This.SecondHalfXT(), [ nPos, nLen ] ]
		return aResult

		def SecondHalfAndItsSectionXT()
			return This.SecondHalfAndSectionXT()

	#-- THE TWO HALVES

	def Halves()
		acResult = []
		acResult + This.FirstHalf() + This.SecondHalf()

		return acResult

		def Bisect()
				return This.Halves()

	def HalvesXT()
		acResult = []
		acResult + This.FirstHalfXT() + This.SecondHalfXT()

		return acResult

		def BisectXT()
			return This.Halves()

	def HalvesAndPositions()
		aResult = [ This.FirstHalfAndPosition(), This.SecondHalfAndPosition() ]
		return aResult

		def HalvesAndTheirPositions()
			return This.HalvesAndPositions()

	def HalvesAndPositionsXT()
		aResult = [ This.FirstHalfAndPositionXT(), This.SecondHalfAndPositionXT() ]
		return aResult

		def HalvesAndTheirPositionsXT()
			return This.HalvesAndPositionsXT()

	def HalvesAndSections()
		aResult = [ This.FirstHalfAndSection(), This.SecondHalfAndSection() ]
		return aResult

		def HalvesAndTheirSections()
			return This.HalvesAndSections()

	def HalvesAndSectionsXT()
		aResult = [ This.FirstHalfAndSectionXT(), This.SecondHalfAndSectionXT() ]
		return aResult

		def HalvesAndTheirSectionsXT()
			return This.HalvesAndSectionsXT()

	  #============================================================#
	 #  INDEXING THE LIST BY POSITION OR BY NUMBER OF OCCURRENCE  #
	#============================================================#

	def Index()
		return IndexBy(:Position)

	def Indexed()
		return This.Index()

	#--

	def IndexXT(pBy)
		cBy = ""

		if isList(paBy) and
		   Q(paBy).IsOneOfTheseNamedParams([ :By, :On ])

			pBy = pBy[2]
		ok

		if NOT isString(pBy)
			StzRaise("Incorrect param type! pBy must be a string.")
		ok

		if pBy = :Position
			return This.IndexByPosition()

		but pBy = :NumberOfOccurrence or :NumberOfOccurrences
			return This.IndexByNumberOfOccurrence()

		else
			StzRaise("Unsupported indexing type! Allowed types are by :Positon and by :NumberOfOccurrences.")
		ok
	
	def IndexedXT(pBy)
		return This.IndexXT(pBy)

	#--

	def IndexBy(pcBy)
		if NOT isString(pcBy)
			StzRaise("Incorrect param type! pcBy must be a string.")
		ok

		if NOT Q(pcBy).IsOneOfThese([ :Position, :NumberOfOccurrence, :NumberOfOccurrences ])
			StzRaise("Incorrect value of pcBy! Allowed values are :Position and :NumberOfOccurrence.")
		ok

		aResult = []
		if pcBy = :Position
			aUniqueItems = This.DuplicatesRemoved()
			nLen = len(aUniqueItems)

			for i = 1 to nLen
				item = aUniqueItems[i]
				anPos = This.Positions(item)
				aResult + [ item, anPos ]
			next
	
		but pcBy = :NumberOfOccurrence or pcBy = :NumberOfOccurrences
			/* Index( [ "A", "A", "B", "C" ] --> [ :A = 2, :B = 1, :C = 1 ] */
			
			aUniqueItems = This.DuplicatesRemoved()
			nLen = len(aUniqueItems)

			for i = 1 to nLen
				item = aUniqueItems[i]
				n =  This.NumberOfOccurrence(item)
				aResult + [ item, n ]
			next	
		else
			StzRaise("Unsupported indexing paramater!")
		ok

		return aResult

		def IndexOn(pcOn)
			return This.IndexBy(pcOn)

	def IndexedBy(pcBy)
		return This.IndexBy(pcBy)

		def IndexedOn(pcOn)
			return This.IndexedBy(pcOn)

	#--
	
	def IndexByPosition()
		return IndexBy(:Position)

		def IndexOnPosition()
			return This.IndexByPosition()

	def IndexedByPosition()
		return This.IndexByPosition()

		def IndexedOnPosition()
			return This.IndexedByPostion()

	#--

	def IndexByNumberOfOccurrence()
		return IndexBy(:NumberOfOccurrence)

		def IndexByNumberOfOccurrences()
			return This.IndexByNumberOfOccurrence()

		def IndexOnNumberOfOccurrence()
			return This.IndexByNumberOfOccurrence()

		def IndexOnNumberOfOccurrences()
			return This.IndexByNumberOfOccurrence()

	def IndexedByNumberOfOccurrence()
		return This.IndexByNumberOfOccurrence()

		def IndexedByNumberOfOccurrences()
			return This.IndexedByNumberOfOccurrence()

		def IndexedOnNumberOfOccurrence()
			return This.IndexedByNumberOfOccurrence()

		def IndexedOnNumberOfOccurrences()
			return This.IndexedByNumberOfOccurrence()

	  #========================================#
	 #     COMPARAISON WITH AN OTHER LIST     #
	#========================================#

	  #-------------------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS SAME ITEMS AS AN OTHER LIST  #
	#-------------------------------------------------------------#

	def ContainsSameItemsAsCS(paOtherList, pCaseSensitive)
		if len( This.DifferentItemsWithCS(paOtherList, pCaseSensitive) ) = 0
			return TRUE
		else
			return FALSE
		ok

	#-- WITHOUT CASESENSITIVITY

	def ContainsSameItemsAs(paOtherList)
		return This.ContainsSameItemsAsCS(paOtherList, :CaseSensitive = TRUE)

	   #------------------------------------------------------------#
	  #  GETTING THE LIST OF ITEMS FORMING THE DIFFERENCE BETWEEN  #
	 #  THE MAIN LIST AND AND OTHER GIVEN LIST                    #
	#------------------------------------------------------------#

	def DifferenceWithCS(paOtherList, pCaseSensitive)
		/*
		Returns a list composed of two hashlists:
			[
			:SURPLUS = [ "A", "B", ... ],
			:LACKING = [ "X", "Y", ... ]
			]
		*/
		aResult = [
				:SURPLUS = This.OverItemsComparedToCS(paOtherList, pCaseSensitive),
				:LACKING = This.LackingItemsComparedToCS(paOtherList, pCaseSensitive)
			  ]

		return aResult

	#-- WITHOUT CASESENSITIVITY

	def DifferenceWith(paOtherList)
		return This.DifferenceWithCS(paOtherList, :CaseSensitive = TRUE)

	   #---------------------------------------------------------#
	  #  GETTING THE LIST OF ITEMS WHICH ARE DIFFERENT BETWEEN  #
	 #  THE MAIN LIST AND AND OTHER GIVEN LIST                 #
	#---------------------------------------------------------#

	def DifferentItemsWithCS(paOtherList, pCaseSensitive)
		if NOT isList(pOtherList)
			StzRaise("Incorrect param type! paOtherList must be a list.")
		ok

		aResult = This.OverItemsComparedToCS(paOtherList, pCaseSensitive)

		acLackingItems = This.LackingItemsComparedToCS(paOtherList, pCaseSensitive)
		nLen = len(acLackingItems)

		aContent = This.Content()

		for i = 1 to nLen
			aResult + aContent[i]
		next
	
		return aResult

		def DifferentItemsWithCSQ(paOtherList, pCaseSensitive)
			return new stzList( This.DifferentItemsWithCS(paOtherList, pCaseSensitive) )

	#-- WITHOUT CASESENSITIVITY

	def DifferentItemsWith(paOtherList)
		if NOT isList(pOtherList)
			StzRaise("Incorrect param type! paOtherList must be a list.")
		ok

		aResult = This.OverItemsComparedTo(paOtherList)
		aLacking = This.LackingItemsComparedTo(paOtherList)
		nLen = len(aLacking)

		for i = 1 to nLen
			aResult + aLacking[i]
		next
	
		return aResult

		def DifferentItemsWithQ(paOtherList)
			return new stzList( This.DifferentItemsWith(paOtherList) )

	  #--------------------------------------------------------------------#
	 #  GETTING THE OVER-ITEMS IN A GIVEN LIST COMPARED TO THE MAIN LIST  #
	#--------------------------------------------------------------------#

	def OverItemsComparedToCS(paOtherList, pCaseSensitive)
		if NOT isList(pOtherList)
			StzRaise("Incorrect param type! paOtherList must be a list.")
		ok

		aResult = []

		oOtherList = new stzList(paOtherList)
		nLen = This.NumberOfItems()

		aContent = This.Content()

		for i = 1 to nLen

			if NOT oOtherList.ContainsCS(aContent[i], pCaseSensitive)
				aResult + aContent[i]
			ok
		next

		return aResult

		def OverItemsComparedToCSQ(paOtherList, pCaseSensitive)
			return new stzList( This.OverItemsComparedToCS(paOtherList, pCaseSensitive) )

	#-- WITHOUT CASESENSITIVITY

	def OverItemsComparedTo(paOtherList)
		return This.OverItemsComparedToCS(paOtherList, :CaseSensitive = TRUE)

		def OverItemsComparedToQ(paOtherList)
			return new stzList( This.OverItemsComparedTo(paOtherList) )

	  #-------------------------------------------------------------------------#
	 #  GETTING THE LACKING-ITEMS IN THE LIST COMPARED TO AN OTHER GIVEN LIST  #
	#-------------------------------------------------------------------------#

	def LackingItemsComparedToCS(paOtherList, pCaseSensitive)
		aResult = []
		nLen = len(paOtherList)

		for i = 1 to nLen
			item = paOtherList[i]

			if NOT This.ContainsCS(item, pCaseSensitive)
				aResult + item
			ok
		next

		return aResult

		def LackingItemsComparedToCSQ(paOtherList, pCaseSensitive)
			return new stzList( This.LackingItemsComparedToCS(paOtherList, pCaseSensitive) )	

	#-- WITHOUT CASESENSITIVITY

	def LackingItemsComparedTo(paOtherList)
		return This.LackingItemsComparedToCS(paOtherList, :CaseSensitive = TRUE)

		def LackingItemsComparedToQ(paOtherList)
			return new stzList( This.LackingItemsComparedTo(paOtherList) )	

	  #------------------------------------------------------------------------#
	 #  CHECKING IF THE LIST HAS SAME NUMBER OF ITEMS AS AN OTHER GIVEN LIST  #
	#------------------------------------------------------------------------#

	def HasSameNumberOfItemsAsCS(paOtherList, pCaseSensitive)
		If len(paOtherList) = This.NumberOfItems()
			return TRUE
		else
			return FALSE
		ok

		def HasSameWidthAsCS(paOtherList, pCaseSensitive)
			return This.HasSameNumberOfItemsAsCS(paOtherList, pCaseSensitive)

		def HasSameSizeAsCS(paOtherList, pCaseSensitive)
			return This.HasSameNumberOfItemsAsCS(paOtherList, pCaseSensitive)

		def ContainsSameNumberOfItemsAsCS(paOtherList, pCaseSensitive)
			return This.HasSameNumberOfItemsAsCS(paOtherList, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def HasSameNumberOfItemsAs(paOtherList)
		return This.HasSameNumberOfItemsAsCS(paOtherList, :CaseSensitive = TRUE)

		def HasSameWidthAs(paOtherList)
			return HasSameNumberOfItemsAs(paOtherList)

		def HasSameSizeAs(paOtherList)
			return HasSameNumberOfItemsAs(paOtherList)

		def ContainsSameNumberOfItemsAs(paOtherList)
			return This.HasSameNumberOfItemsAs(paOtherList)

	  #-------------------------------------------------------------------------------------#
	 #  GETTING THE COMMON-ITEMS (INTERSECTION) BETWEEN THE MAIN LIST AN OTHER GIVEN LIST  #
	#-------------------------------------------------------------------------------------#

	def CommonItemsCS(paOtherList, pCaseSensitive)

		if isList(paOtherList) and Q(paOtherList).IsWithNamedParam()
			paOtherList = paOtherList[2]
		ok

		if NOT isList(paOtherList)
			StzRaise("Incorrect param type! paOtherList must be a list.")
		ok

		aContent = This.Content()
		nLen = len(aContent)
		aResult = []
		
		for i = 1 to nLen

			if (NOT Q(aResult).ContainsCS(aContent[i], pCaseSensitive)) and
			   Q(paOtherList).ContainsCS(aContent[i], pCaseSensitive)

				aResult + aContent[i]
			ok

		next

		return aResult

		#< FunctionFluentForm

		def CommonItemsCSQ(paOtherList, pCaseSensitive)
			return new stzlist( This.CommonItemsCS(paOtherList, pCaseSensitive) )

		#>

		#< @FunctionAlternativeForms

		def IntersectionCS(paOtherList, pCaseSensitive)
			return This.CommonItemsCS(paOtherList, pCaseSensitive)

			def IntersectionCSQ(paOtherList, pCaseSensitive)
				return This.CommonItemsWithCSQ(paOtherList, pCaseSensitive)

		def IntersectCS(paOtherList, pCaseSensitive)
			return This.CommonItemsCS(paOtherList, pCaseSensitive)

			def IntersectCSQ(paOtherList, pCaseSensitive)
				return This.CommonItemsWithCSQ(paOtherList, pCaseSensitive)

		def CommonItemsWithCS(paOtherList, pCaseSensitive)
			return This.CommonItemsCS(paOtherList, pCaseSensitive)

			def CommonItemsWithCSQ(paOtherList, pCaseSensitive)
				return new stzList( This.CommonItemsWithCS(paOtherList, pCaseSensitive) )

		def IntersectionWithCS(paOtherList, pCaseSensitive)
			return This.CommonItemsCS(paOtherList, pCaseSensitive)

			def IntersectionWithCSQ(paOtherList, pCaseSensitive)
				return This.CommonItemsWithCSQ(paOtherList, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def CommonItems(paOtherList)
		return This.CommonItemsCS(paOtherList, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def CommonItemsQ(paOtherList)
			return new stzlist( This.CommonItems(paOtherList) )

		#>

		#< @FunctionAlternativeForms

		def Intersection(paOtherList)
			return This.CommonItems(paOtherList)

			def IntersectionQ(paOtherList)
				return This.CommonItemsWithQ(paOtherList)

		def Intersect(paOtherList)
			return This.CommonItems(paOtherList)

			def IntersectQ(paOtherList)
				return This.CommonItemsWithQ(paOtherList)

		def CommonItemsWith(paOtherList)
			return This.CommonItems(paOtherList)

			def CommonItemsWithQ(paOtherList)
				return new stzList( This.CommonItemsWith(paOtherList) )

		def IntersectionWith(paOtherList)
			return This.CommonItems(paOtherList)

			def IntersectionWithQ(paOtherList)
				return This.CommonItemsWithQ(paOtherList)

		#>

	  #------------------------------------------------------------------------#
	 #  NUMBER OF COMMON ITEMS BETWEEN THE MAIN LIST AND AN OTHER GIVEN LIST  #
	#------------------------------------------------------------------------#

	def NumberOfCommonItemsWithCS(paItems, pCaseSensitive)
		return len(This.CommonItemsWithCS(paItems, pCaseSensitive))

		def SizeOfIntersectionWithCS(paItems, pCaseSensitive)
			return NumberOfCommonItemsWithCS(paItems, pCaseSensitive)

		def CountCommonItemsWithCS(paItem, pCaseSensitive)
			return This.NumberOfCommonItemsWithCS(paItems, pCaseSensitive)

		def HowManyCommonItemsWithCS(paItem, pCaseSensitive)
			return This.NumberOfCommonItemsWithCS(paItems, pCaseSensitive)

		def HowManyCommonItemWithCS(paItem, pCaseSensitive)
			return This.NumberOfCommonItemsWithCS(paItems, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def NumberOfCommonItemsWith(paItems)
		return This.NumberOfCommonItemsWithCS(paItems, :CaseSensitive = TRUE)

		def SizeOfIntersectionWith(paItems)
			return NumberOfCommonItemsWith(paItems)

		def CountCommonItemsWith(paItem)
			return This.NumberOfCommonItemsWith(paItems)

		def HowManyCommonItemsWith(paItem)
			return This.NumberOfCommonItemsWith(paItems)

		def HowManyCommonItemWith(paItem)
			return This.NumberOfCommonItemsWith(paItems)

	  #---------------------------------------------------------------------------#
	 #  NUMBER OF DIFFERENT ITEMS BETWEEN THE MAIN LIST AND AN OTHER GIVEN LIST  #
	#---------------------------------------------------------------------------#

	def NumberOfDifferentItemsWithCS(paItems, pCaseSensitive)
		return len(This.DifferentItemsWithCS(paItems, pCaseSensitive))

		def CountDifferentItemsWithCS(paItem, pCaseSensitive)
			return This.NumberOfDifferentItemsWithCS(paItems, pCaseSensitive)

		def HowManyDifferentItemsWithCS(paItem, pCaseSensitive)
			return This.NumberOfDifferentItemsWithCS(paItems, pCaseSensitive)

		def HowManyDifferentItemWithCS(paItem, pCaseSensitive)
			return This.NumberOfDifferentItemsWithCS(paItems, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def NumberOfDifferentItemsWith(paItems)
		return This.NumberOfDifferentItemsWithCS(paItems, :CaseSensitive = TRUE)

		def CountDifferentItemsWith(paItem)
			return This.NumberOfDifferentItemsWith(paItems)

		def HowManyDifferentItemsWith(paItem)
			return This.NumberOfDifferentItemsWith(paItems)

		def HowManyDifferentItemWith(paItem)
			return This.NumberOfDifferentItemsWith(paItems)

	  #=============================#
	 #  SORTING ORDER OF THE LIST  #
	#=============================#

	def SortingOrder()
		cResult = :Unsorted

		if This.IsSorted()
			if This.IsSortedInAscending()
				cResult = :Ascending
			else
				cResult = :Descending
			ok
		ok

		return cResult

	def HasSameSortingOrderAs(paOtherList)

		oTemp = new stzList(paOtherList)
		if oTemp.SortingOrder() = This.SortingOrder()
			return TRUE
		else
			return FALSE
		ok

		def HasSameOrderAs(paOtherList)
			return This.HasSameSortingOrderAs(paOtherList)

	  #-----------------------------------#
	 #  IS THE LIST SORTED OR UNSORTED?  #
	#-----------------------------------#
 
	def IsSorted()
		if This.IsSortedInAscending() or
		   This.IsSortedInDescending()
			return TRUE
		else
			return FALSE
		ok

		def ItemsAreSorted()
			return This.IsSorted()

	def IsSortedInAscending()
		/*
		The idea is to sort a copy of the list in ascending order
		and then compare the copy to the original list...
		If they are identical, then the list is sorted in ascending order!
		*/

		aSortedInAscending = This.Copy().SortedInAscending()
		bResult = This.IsIdenticalTo(aSortedInAscending)
		return bResult

		def ItemsAreSortedInAscending()
			return This.IsSortedInAscending()

	def IsSortedInDescending()
		/*
		The idea is to sort a copy of the list in descending order
		and then compare the copy to the original list...
		If they are identical, then the list is sorted in descending order!
		*/

		aSortedInDescending = This.Copy().SortedInDescending()
		bResult = This.IsIdenticalTo(aSortedInDescending)
		return bResult

		def ItemsAreSortedInDescending()
			return This.IsSortedInDescending()

	def IsUnsorted()
		return NOT This.IsSorted()

		def ItemsAreUnSorted()
			return This.IsUnsorted()

		def IsNotSorted()
			return NOT This.IsUnsorted()

		def ItemsAreNotSorted()
			return NOT This.IsUnsorted()

	  #-------------------------------------------------------------#
	 #  CHECKING IF THE LIST IS SORTABLE (MADE OF SORTABLE ITEMS)  #
	#-------------------------------------------------------------#
 
	def IsSortable()
		if This.SortableItems() = This.NumberOfItems()
			return TRUE
		else
			return FALSE
		ok

	  #-------------------------------------#
	 #  SORTABLE ITEMS & UNSORTABLE ITEMS  #
	#-------------------------------------#
 
	def SortableItems()
		/*
		Number, strings and lists are sortable.

		Objects are not sortable except if they are stzNumber, stzString or stzList,
		or anyone of their derivaties.

		NB: This may change in the future and normal ring objects become sortable.

		*/
		aResult = []
		for item in Content()
			if isNumber(item) or isString(item) or isList(item) or
			   @IsStzNumber(item) or @IsStzString(item) or @IsStzList(item)
				aResult + item
			ok
		next
		return aResult

	def UnsortableItems()
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []
		for i = 1 to nLen
			item = aContent[i]
			if isNumber(item) or isString(item) or isList(item) or
			   @IsStzNumber(item) or @IsStzString(item) or @IsStzList(item)
				// do nothing, skip!
			else
				aResult + item
			ok
		next
		return aResult

	  #----------------------------------#
	 #  SORTING THE ITEM IN ASSCENDING  #
	#----------------------------------#
 
	def SortInAscending()
		/*
		Ring native sort() function can sort a list made:
			- only of numbers
			- or only of strings.

		In sofanza a list is sorted by applying 4 steps:
			1- numbers are sorted first and put at the beginning
			2- then strings are sorted and put after numbers
			3- then lists are added after strings (if any) in
			  their order of appearance
			4- then objects are added after lists (if any) in
			  their order of appearance

			NOTE: 3 and 4 steps could change in the future when
			Softanza becomes able to sort even lists  and objects!
		*/

		aNumbers = ring_sort( This.OnlyNumbers() )

		aStrings = ring_sort( This.OnlyStrings() )

		aLists = This.OnlyLists()

		aObjects = This.OnlyObjects()

		aResult = ListsMerge([ aNumbers, aStrings, aLists, aObjects ])

		This.Update( aResult )

		#< @FunctionFluentForm

		def SortInAscendingQ()
			This.SortInAscending()
			return This

		#>

		#< @FunctionAlternativeForm

		def Sort()
			This.SortInAscending()

			def SortQ()
				return This.SortInAscendingQ()

		#>

		#< @FunctionMisspelledForms

		def SortInAsending()
			This.SortInAscending()

			def SortInAsendingQ()
				This.SortInAsending()
				return This


		def SortInAssending()
			This.SortInAscending()

			def SortInAssendingQ()
				This.SortInAssending()
				return This

		#>

	def SortedInAscending()
		aResult = This.Copy().SortInAscendingQ().Content()
		return aResult

		def Sorted()
			return This.SortedInAscending()

		def SortedInAsending()
			return This.SortedInAscending()

		def SortedInAssending()
			return This.SortedInAscending()

	  #-----------------------------------#
	 #  SORTING THE ITEMS IN DESCENDING  #
	#-----------------------------------#

	def SortInDescending()
 		aResult = This.SortInAscendingQ().Content()
		This.Update( ListReverse(aResult) )

		#< @FunctionFluentForm

		def SortInDescendingQ()
			This.SortInDescending()
			return This
		
		#>
	
		#< @FunctionMisspelledForms

		def SortInDesending()
			This.SortInDescending()

			def SortInDesendingQ()
				This.SortInDescending()
				return This


		def SortInDessending()
			This.SortInDescending()

			def SortInDessendingQ()
				This.SortInDescending()
				return This

		#>

	def SortedInDescending()
		aResult = This.Copy().SortInDescendingQ().Content()
		return aResult

		def SortedInDesending()
			return This.SortedInDescending()

		def SortedInDessending()
			return This.SortedInDescending()

	  #-------------------------------------------#
	 #  SORTING THE ITEM IN THE REVERSE ORDER  #
	#-------------------------------------------#
 
	def SortInReverseOrder()
		switch This.SortingOrder()
		on :Ascending
			This.SortInDescending()

		on: Descending
			This.SortInAscending()
		off

		def SortInReverseOrderQ()
			This.SortInReverse()
			return This

		def SortInReverse()
			This.SortInReverseOrder()

			def SortInReverseQ()
				This.SortInReverse()
				return This

	def SortedInReverse()
		aResult = This.Copy().SortInReverseQ().Content()
		return aResult

		def SortedInReverseOrder()
			return This.SortedInReverse()

	  #---------------------------------------#
	 #  SORTING THE ITEM BY - IN ASCENDING  #
	#--------------------------------------#
 
	def SortBy(pcExpr)
		/* EXAMPLE
		o1 = new stzList([ "a", "abcde", "abc", "ab", "abcd" ])
		o1.SortBy('len(@item)')
		? o1.Content()

		#--> [ "a", "ab", "abc", "abcd", "abcde" ]

		*/

		if NOT (isString(pcExpr) and Q(pcExpr).ContainsCS("@item", :CS = FALSE))
			StzRaise("Incorrect param! pcExpr must be a string containing @item keyword.")
		ok

		acContent = This.Content()
		nLen = len(acContent)

		cCode = 'value = ' + Q(pcExpr).BoundsRemoved([ "{", "}" ])
		aValues = []
		
		for @i = 1 to nLen
			@item = acContent[@i]
			eval(cCode)
			aValues + value
		next

		oTable = new stzTable([ :COL1 = acContent, :COL2 = aValues ])
		acSorted = oTable.SortByQ(:COL2).Col(1)

		This.Update(acSorted)

		#< @FunctionFluentForm

		def SortByQ(pcExpr)
			This.SortBy(pcExpr)
			return This

		#>

		#< @FunctionAlternativeForm

		def SortInAscendingBy(pcExpr)
			This.SortBy(pcExpr)

			def SortInAscendingByQ(pcExpr)
				This.SortInAscendingBy(pcExpr)
				return This

		#>

	def SortedBy(pcExpr)
		aResult = This.Copy().SortByQ(pcExpr).Content()
		return aResult

		def SortedInAscendingBy(pcExpr)
			return This.SortedBy(pcExpr)

	  #-----------------------------------------#
	 #  SORTING THE ITEM BY - IN DESCENDING  #
	#-----------------------------------------#
 
	def SortInDescendingBy(pcExpr)
		This.SortInAscendingBy(pcExpr)
		This.ReverseQ()

		def SortInDescendingByQ(pcExpr)
			This.SortInDescendingBy(pcExpr)
			return This

	def SortedInDescendingBy(pcExpr)
		aResult = This.Copy().SortInDescendingByQ(pcExpr).Content()
		return aResult

		def SortedInDescendingByQ(pcExpr)
			return This.SortedInDescendingBy(pcExpr)

	  #---------------------------------------#
	 #     ASSOCIATE WITH AN ANOTHER LIST    #
	#---------------------------------------#

	// Returns an Associative List (HashList) from the main list and an other list

	def AssociateWith(paOtherList)
		/* EXAMPLE

		o1 = new stzList([ "Name", "Age", "Job" ])
		o1.AssociateWith([ "Ali", 24, "Programmer" ])
		? o1.Content()

		#--> [ ["Name", "Ali"], ["Age", 24], ["Job", "Programmer"] ]

		*/

		if NOT isList(paOtherList)
			StzRaise("Incorrect param tpe!")
		ok

		aResult = []
		nLen  = This.NumberOfItems()
		nLenOtherList = len(paOtherList)

		aContent = This.Content()

		for i = 1 to nLen
			otherItem = NULL
			if i <= nLenOtherList
				otherItem = paOtherList[i]
			ok

			aResult + [ aContent[i], otherItem ]
		next

		This.Update( aResult )

		def AssociateWithQ(paOtherList)
			This.AssociateWith(paOtherList)
			return This

	def AssociatedWith(paOtherList)
		aResult = This.Copy().AssociateWithQ(paOtherList).Content()
		return aResult

	  #----------------------------#
	 #   REPEATED LEADING ITEMS   # # TODO: Add case sensitivity!
	#----------------------------#

	def HasRepeatedLeadingItems()
		if StzListQ(This.RepeatedLeadingItems()).IsEmpty()
			return FALSE
		else
			return TRUE
		ok

		#< @FunctionAlternativeForms

		def HasLeadingRepeatedItems()
			return This.HasRepeatedLeadingItems()

		def HasLeadingItems()
			return This.HasRepeatedLeadingItems()
	
		#--

		def ContainsRepeatedLeadingItems()
			return This.HasRepeatedLeadingItems()

		def ContainsLeadingRepeatedItems()
			return This.HasRepeatedLeadingItems()

		def ContainsLeadingItems()
			return This.HasRepeatedLeadingItems()

		#>

	def HasRepeatedTrailingItems()
		if StzListQ(This.RepeatedTrailingItems()).IsEmpty()
			return FALSE
		else
			return TRUE
		ok

		#< @FunctionAlternativeForms

		def HasTrailingRepeatedItems()
			return This.HasRepeatedTrailingItems()

		def HasTrailingItems()
			return This.HasRepeatedTrailingItems()
	
		#--

		def ContainsRepeatedTrailingItems()
			return This.HasRepeatedTrailingItems()

		def ContainsTrailingRepeatedItems()
			return This.HasRepeatedTrailingItems()

		def ContainsTrailingItems()
			return This.HasRepeatedTrailingItems()

		#>
	
	def RepeatedLeadingItems() # Same item is repeated at the start of the list

		/* Example:
			[ 'e', 'e', 'e', 'T', 'U', 'N', 'I', 'S' ]
			--> ['e','e','e']

			[ 'e', 'x', 'e', 'e', 'e', 'T', 'U', 'N', 'I', 'S' ]
			--> []
		*/

		aContent = This.Content()
		nLen = This.NumberOfItems()

		if NOT This.IsEmpty()
			cResult = ""
	
			i = 1
			while aContent[i] = aContent[1] and i <= nLen
				i++
			end

			if i > 2
				return This.NFirstItems(i-1)
			ok
		ok

		def RepeatedLeadingItemsQ()
			return new stzList( This.RepeatedLeadingItems() )
	
		def LeadingRepeatedItems()
			return This.RepeatedLeadingItems()

			def LeadingRepeatedItemsQ()
				return new stzList( This.LeadingRepeatedItems() )
	
		def LeadingItems()
			return This.RepeatedLeadingItems()

			def LeadingItemsQ()
				return new stzList( This.LeadingItems() )
	
	def RepeatedLeadingItem()
		if This.HasRepeatedLeadingItems()
			return This[1]
		ok

		def RepeatedLeadingItemQ()
			return Q(This.RepeatedLeadingItem())
	
		def LeadingRepeatedItem()
			return This.RepeatedLeadingItem()

			def LeadingRepeatedItemQ()
				return Q(This.LeadingRepeatedItem())
	
		def LeadingItem()
			return This.RepeatedLeadingItem()

			def LeadingItemQ()
				return Q(This.LeadingItem())
	
	def NumberOfRepeatedLeadingItems()
		if This.HasRepeatedLeadingItems()
			return StzListQ( This.RepeatedLeadingItems() ).NumberOfItems()
		else
			return 0
		ok

		#< @FunctionAlternativeForms

		def NumberOfLeadingRepeatedItems()
			return This.NumberOfRepeatedLeadingItems()

		def NumberOfLeadingItems()
			return This.NumberOfRepeatedLeadingItems()

		def CountRepeatedLeadingItems()
			return This.NumberOfRepeatedLeadingItems()

		def CountLeadingRepeatedItems()
			return This.NumberOfRepeatedLeadingItems()

		def CountLeadingItems()
			return This.NumberOfRepeatedLeadingItems()

		def HowManyRepeatedLeadingItems()
			return This.NumberOfRepeatedLeadingItems()

		def HowManyRepeatedLeadingItem()
			return This.NumberOfRepeatedLeadingItems()

		def HowManyLeadingRepeatedItems()
			return This.NumberOfRepeatedLeadingItems()

		def HowManyLeadingRepeatedItem()
			return This.NumberOfRepeatedLeadingItems()

		def HowManyLeadingItems()
			return This.NumberOfRepeatedLeadingItems()

		def HowManyLeadingItem()
			return This.NumberOfRepeatedLeadingItems()

		#>

	def RepeatedLeadingItemIs(pItem)
		if This.HasRepeatedLeadingItems() and This.FirstItemQ().IsEqualTo(pItem)
			return TRUE
		else
			return FALSE
		ok

		def LeadingRepeatedItemIs(pItem)
			return This.RepeatedLeadingItemIs(pItem)

		def LeadingItemIs(pItem)
			return This.RepeatedLeadingItemIs(pItem)
	
	  #-----------------------------#
	 #   REPEATED TRAILING ITEMS   #
	#-----------------------------#

	def RepeatedTrailingItem()
		if This.HasRepeatedTrailingItems()
			return This.LastItem()
		ok

		def RepeatedTrailingItemQ()
			return Q(This.RepeatedTrailingItem())

		def TrailingRepeadtedItem()
			return This.RepeatedTrailingItem()

			def TrailingRepeatedItemQ()
				return Q(This.TrailingRepeadtedItem())

		def TrailingItem()
			return This.RepeatedTrailingItem()

			def TrailingItemQ()
				return Q(This.TrailingItem())
	
	def RepeatedTrailingItems()
		aResult = This.Copy().ReverseQ().RepeatedLeadingItems()
		return aResult

		def RepeatedTrailingItemsQ()
			return new stzList(This.RepeatedTrailingItems())
	
		def TrailingRepeatedItems()
			return This.RepeatedTrailingItems()

			def TrailingRepeatedItemsQ()
				return new stzList(This.TrailingRepeatedItems())
	
		def TrailingItems()
			return This.RepeatedTrailingItems()

			def TrailingItemsQ()
				return new stzList(This.TrailingItems())

	def NumberOfRepeatedTrailingItems()
		if This.HasRepeatedTrailingItems()
			return stzListQ( This.RepeatedTrailingItems() ).NumberOfItems()
		else
			return 0
		ok

		#< @FunctionAlternativeForms

		def NumberOfTrailingRepeatedItems()
			return This.NumberOfRepeatedTrailingItems()

		def NumberOfTrailingItems()
			return This.NumberOfRepeatedTrailingItems()

		def CountRepeatedTrailingItems()
			return This.NumberOfRepeatedTrailingItems()

		def CountTrailingRepeatedItems()
			return This.NumberOfRepeatedTrailingItems()

		def CountTrailingItems()
			return This.NumberOfRepeatedTrailingItems()

		def HowManyRepeatedTrailingItems()
			return This.NumberOfRepeatedTrailingItems()

		def HowManyRepeatedTrailingItem()
			return This.NumberOfRepeatedTrailingItems()

		def HowManyTrailingRepeatedItems()
			return This.NumberOfRepeatedTrailingItems()

		def HowManyTrailingRepeatedItem()
			return This.NumberOfRepeatedTrailingItems()

		def HowmanyTrailingItems()
			return This.NumberOfRepeatedTrailingItems()

		def HowmanyTrailingItem()
			return This.NumberOfRepeatedTrailingItems()

		#>
	
	def RepeatedTrailingItemIs(pItem)
		if This.HasRepeatedLeadingItems() and This.LastItemQ().IsEqualTo(pItem)
			return TRUE
		else
			return FALSE
		ok

		def TrailingRepeatedItemIs(pItem)
			return This.RepeatedTrailingItemIs(pItem)

		def TrailingItemIs(pItem)
			return This.RepeatedTrailingItemIs(pItem)
	
	  #-------------------------------------#
	 #   REMOVING REPEATED LEADING ITEMS   #
	#-------------------------------------#

	def RemoveRepeatedLeadingItems()
		if This.HasRepeatedLeadingItems()
			This.RemoveFirstNItems( This.NumberOfRepeatedLeadingItems() )
		ok

		def RemoveRepeatedLeadingItemsQ()
			This.RemoveRepeatedLeadingItems()
			return This

		def RemoveLeadingRepeatedItems()
			This.RemoveRepeatedLeadingItems()

			def RemoveLeadingRepeatedItemsQ()
				This.RemoveLeadingRepeatedItems()
				return This
	
		def RemoveLeadingItems()
			This.RemoveRepeatedLeadingItems()

			def RemoveLeadingItemsQ()
				This.RemoveLeadingItems()
				return This
	
	def RepeatedLeadingItemsRemoved()
		aResult = This.Copy().RemoveRepeatedLeadingItemsQ().Content()
		return aResult

		def LeadingRepeatedItemsRemoved()
			return This.RepeatedLeadingItemsRemoved()

		def LeadingItemsRemoved()
			return This.RepeatedLeadingItemsRemoved()
	
	def RemoveRepeatedLeadingItem(pItem)
		if This.RepeatedLeadingItemQ().IsEqualTo(pItem)
			return This.RemoveRepeatedLeadingItems()
		ok

		def RemoveRepeatedLeadingItemQ(pItem)
			This.RemoveRepeatedLeadingItem(pItem)
			return This

		def RemoveLeadingRepeatedItem(pItem)
			This.RemoveRepeatedLeadingItem(pItem)

			def RemoveLeadingRepeatedItemQ(pItem)
				This.RemoveLeadingRepeatedItem(pItem)
				return This
	
		def RemoveLeadingItem(pItem)
			This.RemoveRepeatedLeadingItem(pItem)

			def RemoveLeadingItemQ(pItem)
				This.RemoveLeadingItem(pItem)
				return This
	
	def RepeatedLeadingItemRemoved(pItem)
		aResult = This.Copy().RemoveRepeatedLeadingItemQ(pItem).Content()
		return aResult

		def LeadingRepeatedItemRemoved(pItem)
			return This.RepeatedLeadingItemRemoved(pItem)

		def LeadingItemRemoved(pItem)
			return This.RepeatedLeadingItemRemoved(pItem)

	  #--------------------------------------#
	 #   REMOVING REPEATED TRAILING ITEMS   #
	#--------------------------------------#

	def RemoveRepeatedTrailingItems()
		if This.HasRepeatedTrailingItems()
			This.RemoveLastNItems( This.NumberOfRepeatedTrailingItems() )
		ok

		def RemoveRepeatedTrailingItemsQ()
			This.RemoveRepeatedTrailingItems()
			return This
	
		def RemoveTrailingRepeatedItems()
			This.RemoveRepeatedTrailingItems()

			def RemoveTrailingRepeatedItemsQ()
				This.RemoveTrailingRepeatedItems()
				return This
	
		def RemoveTrailingItems()
			This.RemoveRepeatedTrailingItems()

			def RemoveTrailingItemsQ()
				This.RemoveTrailingItems()
				return This
	
	def RepeatedTrailingItemsRemoved()
		aResult = This.Copy().RemoveRepeatedTrailingItemsQ().Content()
		return aResult

		def TrailingRepeatedItemsRemoved()
			This.RepeatedTrailingItemsRemoved()

		def TrailingItemsRemoved()
			This.RepeatedTrailingItemsRemoved()
	
	def RemoveRepeatedTrailingItem(pItem)
		if This.RepeatedTrailingItemQ().IsEqualTo(pItem)
			This.RemoveRepeatedTrailingItems()
		ok

		def RemoveRepeatedTrailingItemQ(pItem)
			This.RemoveRepeatedTrailingItem(pItem)
			return This
	
		def RemoveTrailingRepeatedItem(pItem)
			This.RemoveRepeatedTrailingItem(pItem)

			def RemoveTrailingRepeatedItemQ(pItem)
				This.RemoveTrailingRepeatedItem(pItem)
				return This
	
		def RemoveTrailingItem(pItem)
			This.RemoveRepeatedTrailingItem(pItem)

			def RemoveTrailingItemQ(pItem)
				This.RemoveTrailingItem(pItem)
				return This
	
	def RepeatedTrailingItemRemoved(pItem)
		aResult = This.Copy().RemoveRepeatedTrailingItemQ(pItem).Content()
		return aResult

		def TrailingRepeatedItemRemoved(pItem)
			return This.RepeatedTrailingItemRemoved(pItem)

		def TrailingItemRemoved(pItem)
			return This.RepeatedTrailingItemRemoved(pItem)
	
	  #--------------------------------------------------#
	 #   REMOVING REPEATED LEADING AND TRAILING ITEMS   #
	#--------------------------------------------------#

	def RemoveRepeatedLeadingItemAndTrailingItem(pItem1, pItem2)
		This.RemoveRepeatedLeadingItem(pItem1)
		This.RemoveRepeatedTrailingItem(pItem2)

		def RemoveRepeatedLeadingcharAndTrailingItemQ(pItem1, pItem2)
			This.RemoveRepeatedLeadingItemAndTrailingItem(pItem1, pItem2)
			return This

		def RemoveLeadingItemAndTrailingItem(pItem1, pItem2)
			This.RemoveRepeatedLeadingItemAndTrailingItem(pItem1, pItem2)

			def RemoveLeadingItemAndTrailingItemQ(pItem1, pItem2)
				This.RemoveLeadingItemAndTrailingItem(pItem1, pItem2)
				return This
	
		def RemoveTrailingItemAndLeadingItem(pItem1, pItem2)
			This.RemoveRepeatedLeadingItemAndTrailingItem(pItem1, pItem2)

			def RemoveTrailingItemAndLeadingItemQ(pItem1, pItem2)
				This.RemoveTrailingItemAndLeadingItem(pItem1, pItem2)
				return This
	
	def RepeatedLeadingItemAndTrailingItemRemoved(pItem1, pItem2)
		aResult = This.Copy().RemoveRepeatedLeadingItemAndTrailingItemQ(pItem1, pItem2).Content()
		return aResult

		def RepeatedTrailingItemAndLeadingItemRemoved(pItem1, pItem2)
			return This.RepeatedLeadingItemAndTrailingItemRemoved(pItem1, pItem2)

		def LeadingItemAndTrailingItemRemoved(pItem1, pItem2)
			return This.RepeatedLeadingItemAndTrailingItemRemoved(pItem1, pItem2)

		def TrailingItemAndLeadingItemRemoved(pItem1, pItem2)
			return This.RepeatedLeadingItemAndTrailingItemRemoved(pItem1, pItem2)
	
	def RemoveRepeatedLeadingAndTrailingItems()
		This.RemoveRepeatedLeadingItems()
		This.RemoveRepeatedTrailingItems()

		def RemoveRepeatedLeadingAndTrailingItemsQ()
			This.RemoveRepeatedLeadingAndTrailingItems()
			return This
	
		def RemoveLeadingAndTrailingRepeatedItems()
			This.RemoveRepeatedLeadingAndTrailingItems()

			def RemoveLeadingAndTrailingRepeatedItemsQ()
				This.RemoveLeadingAndTrailingRepeatedItems()
				return This
	
	def RepeadtedLeadingAndTrailingItemsRemoved()
		aResult = This.Copy().RemoveRepeatedLEadingAndTrailingItems()
		return aResult

		def RepeadtedTrailingAndLeadingItemsRemoved()
			return This.RepeadtedLeadingAndTrailingItemsRemoved()

		def LeadingAndTrailingItemsRemoved()
			return This.RepeadtedLeadingAndTrailingItemsRemoved()

		def TrailingAndLeadingItemsRemoved()
			return This.RepeadtedLeadingAndTrailingItemsRemoved()
	
	  #-----------------------------#
	 #   REPLACING LEADING ITEMS   #
	#-----------------------------#

	def ReplaceRepeatedLeadingItem(pItem)
		/* Example:

		StzListQ([ '_', '_', '_', 'V', 'A', 'R', '-', '-', '-' ]).ReplaceRepeatedLeadingItem(:With = "-")

		--> Gives: [ '-', '-', '-', 'V', 'A', 'R', '-', '-', '-' ]
		*/

		if isList(pItem) and Q(pItem).IsWithOrByNamedParam()
			pItem = pItem[2]
		ok

		if This.HasRepeatedLeadingItems()
			n = This.NumberOfRepeatedLeadingItems()

			for i = 1 to n
				This.ReplaceItemAtPosition(i, pItem)
			next

		ok

		#< @FunctionFluentForm

		def ReplaceRepeatedLeadingItemQ(pItem)
			This.ReplaceRepeatedLeadingItem(pItem)
			return This
			
		#>
	
		#< @FunctionAlternativeForms
	
		def ReplaceLeadingRepeatedItem(pItem)
			This.ReplaceRepeatedLeadingItem(pItem)

			def ReplaceLeadingRepeatedItemQ(pItem)
				This.ReplaceLeadingRepeatedItem(pItem)
				return This
	
		def ReplaceLeadingItem(pItem)
			This.ReplaceRepeatedLeadingItem(pItem)

			def ReplaceLeadingItemQ(pItem)
				This.ReplaceLeadingItem(pItem)
				return This

		#-- Same functions with ...Items in plural

		def ReplaceRepeatedLeadingItems(pItem)
			This.ReplaceRepeatedLeadingItem(pItem)

			def ReplaceRepeatedLeadingItemsQ(pItem)
				This.ReplaceRepeatedLeadingItems(pItem)
				return This

		def ReplaceLeadingRepeatedItems(pItem)
			This.ReplaceRepeatedLeadingItem(pItem)

			def ReplaceLeadingRepeatedItemsQ(pItem)
				This.ReplaceLeadingRepeatedItems(pItem)
				return This
	
		def ReplaceLeadingItems(pItem)
			This.ReplaceRepeatedLeadingItem(pItem)

			def ReplaceLeadingItemsQ(pItem)
				This.ReplaceLeadingItems(pItem)
				return This

		#>

	def RepeatedLeadingItemReplaced(pItem)
		aResult = This.Copy().ReplaceRepeatedLeadingItemQ(pItem).Content()
		return aResult

		#< @FunctionAlternativeForms
	
		def LeadingRepeatedItemReplaced(pItem)
			return This.RepeatedLeadingItemReplaced(pItem)
	
		def LeadingItemReplaced(pItem)
			return This.RepeatedLeadingItemReplaced(pItem)

		#-- Same functions with ...Items in plural

		def RepeatedLeadingItemsReplaced(pItem)
			return This.RepeatedLeadingItemReplaced(pItem)

		def LeadingRepeatedItemsReplaced(pItem)
			return This.RepeatedLeadingItemReplaced(pItem)
	
		def LeadingItemsReplaced(pItem)
			return This.RepeatedLeadingItemReplaced(pItem)

		#>
				
	  #------------------------------#
	 #   REPLACING TRAILING ITEMS   #
	#------------------------------#

	def ReplaceRepeatedTrailingItem(pItem)
		/* Example:

		stzListQ([ "_","_","_","V","A","R","-","-","-" ]).ReplaceRepeatedTrailingItemBy("_")

		Gives --> [ "_","_","_","V","A","R","_","_","_" ]
		*/

		if isList(pItem) and Q(pItem).IsWithOrByNamedParam()
			pItem = pItem[2]
		ok

		if This.HasRepeatedTrailingItems()
			n = This.NumberOfRepeatedTrailingItems()

			n = This.NumberOfItems() - n + 1
			for i = n to This.NumberOfItems()
				This.ReplaceItemAtPosition(i, pItem)
			next

		ok

		#< @FunctionFluentForm

		def ReplaceRepeatedTrailingItemQ(pItem)
			This.ReplaceRepeatedTrailingItem(pItem)
			return This
			
		#>
	
		#< @FunctionAlternativeForms
	
		def ReplaceTrailingRepeatedItem(pItem)
			This.ReplaceRepeatedTrailingItem(pItem)

			def ReplaceTrailingRepeatedItemQ(pItem)
				This.ReplaceTrailingRepeatedItem(pItem)
				return This
	
		def ReplaceTrailingItem(pItem)
			This.ReplaceRepeatedTrailingItem(pItem)

			def ReplaceTrailingItemQ(pItem)
				This.ReplaceTrailingItem(pItem)
				return This

		#-- Same functions with ...Items in plural

		def ReplaceRepeatedTrailingItems(pItem)
			This.ReplaceRepeatedTrailingItem(pItem)

			def ReplaceRepeatedTrailingItemsQ(pItem)
				This.ReplaceRepeatedTrailingItems(pItem)
				return This

		def ReplaceTrailingRepeatedItems(pItem)
			This.ReplaceRepeatedTrailingItem(pItem)

			def ReplaceTrailingRepeatedItemsQ(pItem)
				This.ReplaceTrailingRepeatedItems(pItem)
				return This
	
		def ReplaceTrailingItems(pItem)
			This.ReplaceRepeatedTrailingItem(pItem)

			def ReplaceTrailingItemsQ(pItem)
				This.ReplaceTrailingItems(pItem)
				return This

		#>

	def RepeatedTrailingItemReplaced(pItem)
		aResult = This.Copy().ReplaceRepeatedTrailingItemQ(pItem).Content()
		return aResult

		#< @FunctionAlternativeForms
	
		def TrailingRepeatedItemReplaced(pItem)
			return This.RepeatedTrailingItemReplaced(pItem)
	
		def TrailingItemReplaced(pItem)
			return This.RepeatedTrailingItemReplaced(pItem)

		#-- Same functions with ...Items in plural

		def RepeatedTrailingItemsReplaced(pItem)
			return This.RepeatedTrailingItemReplaced(pItem)

		def TrailingRepeatedItemsReplaced(pItem)
			return This.RepeatedTrailingItemReplaced(pItem)
	
		def TrailingItemsReplaced(pItem)
			return This.RepeatedTrailingItemReplaced(pItem)

		#>
	
	  #---------------------------------------------------#
	 #   REPLACING REPEATED LEADING AND TRAILING ITEMS   #
	#---------------------------------------------------#

	def ReplaceRepeatedLeadingItemAndTrailingItem(pItem1, pItem2)
		This.ReplaceRepeatedLeadingItemWith(pItem1)
		This.ReplaceRepeatedTrailingItemWith(pItem2)

		def ReplaceRepeatedLeadingItemAndTrailingItemQ(pItem1, pItem2)
			This.ReplaceRepeatedLeadingItemAndTrailingItem(pItem1, pItem2)
			return This

		def ReplaceRepeatedTrailingItemAndLeadingItem(pItem1, pItem2)
			This.ReplaceRepeatedLeadingItemAndTrailingItem(pItem1, pItem2)

			def ReplaceRepeatedTrailingItemAndLeadingItemQ(pItem1, pItem2)
				This.ReplaceRepeatedTrailingItemAndLeadingItem(pItem1, pItem2)
				return This
	
		def ReplaceLeadingItemAndTrailingItem(pItem1, pItem2)
			This.ReplaceRepeatedLeadingItemAndTrailingItem(pItem1, pItem2)

			def ReplaceLeadingItemAndTrailingItemQ(pItem1, pItem2)
				This.ReplaceLeadingItemAndTrailingItem(pItem1, pItem2)
				return This
	
		def ReplaceTrailingItemAndLeadingItem(pItem1, pItem2)
			This.ReplaceRepeatedLeadingItemAndTrailingItem(pItem1, pItem2)

			def ReplaceTrailingItemAndLeadingItemQ(pItem1, pItem2)
				This.ReplaceTrailingItemAndLeadingItem(pItem1, pItem2)
				return This
	
	def RepeatedLeadingcharAndTrailingItemReplaced(pItem1, pItem2)
		aResult = This.Copy().ReplaceRepeatedLeadingItemAndTrailingItemQ(pItem1, pItem2).Content()
		return aResult
	
		def RepeadtedTrailingItemAndLeadingItemReplaced(pItem1, pItem2)
			This.RepeatedLeadingcharAndTrailingItemReplaced(pItem1, pItem2)
	
		def TrailingItemAndLeadingItemReplaced(pItem1, pItem2)
			This.RepeatedLeadingcharAndTrailingItemReplaced(pItem1, pItem2)
	
	def ReplaceRepeatedLeadingAndTrailingItems(pItem)
		This.ReplaceRepeatedLeadingItem(pItem)
		This.ReplaceRepeatedTrailingItem(pItem)

		def ReplaceRepeatedLeadingAndTrailingItemsQ(pItem)
			This.ReplaceRepeatedLeadingAndTrailingItems(pItem)
			return This
	
		def ReplaceLeadingAndTrailingItems(pItem)
			This.ReplaceRepeatedLeadingAndTrailingItems(pItem)

			def ReplaceLeadingAndTrailingItemsQ(pItem)
				This.ReplaceLeadingAndTrailingItems(pItem)
				return This
	
		def ReplaceRepeatedTrailingAndLeadingItems(pItem)
			This.ReplaceRepeatedLeadingAndTrailingItems(pItem)

			def ReplaceRepeatedTrailingAndLeadingItemQ(pItem)
				This.ReplaceRepeatedTrailingAndLeadingItems(pItem)
				return This
	
		def ReplaceTrailingAndLeadingItems(pItem)
			This.ReplaceRepeatedLeadingAndTrailingItems(pItem)

			def ReplaceTrailingAndLeadingItemsQ(pItem)
				This.ReplaceTrailingAndLeadingItems(pItem)
				return This
	
	def RepeatedLeadingAndTrailingItemsReplaced(pItem)
		aResult = This.Copy().ReplaceRepeatedLeadingAndTrailingItemsQ(pItem).Content()
		return aResult

		def RepeatedTrailingAndLeadingItemsReplaced(pItem)
			return This.RepeatedLeadingAndTrailingItemsReplaced(pItem)

		def LeadingAndTrailingItemsReplaced(pItem)
			return This.RepeatedLeadingAndTrailingItemsReplaced(pItem)
	
		def TrailingAndLeadingItemsReplaced(pItem)
			return This.RepeatedLeadingAndTrailingItemsReplaced(pItem)

	  #==============================#
	 #     OPERATORS OVERLOADING    #
	#==============================#

	/*
		TODO: Operators should adopt same semantics in all classes...
	*/

	def operator(pcOp, pValue)
		
		if pcOp = "[]"

			if isNumber(pValue)
				return This.Item(pValue)

			but isString(pValue)
				oStr = new stzString(pValue)
			
				if oStr.NumberOfOccurrenceQ(":").IsEither(1, 2) and
				    oStr.Copy().RemoveQ(":").IsNumberInString()

					/* EXAMPLES

					? Q(1:5)['::-1']
					#--> [ 5, 4, 3, 2, 1 ]

					? Q(1:10)['2:8:2']
					#--> [ 2, 4, 6, 8 ]

					*/

					acNumbers = oStr.SplitAt(":")
					nLen = len(acNumbers)

					n1 = 1
					if acNumbers[1] != NULL
						n1 = 0+ acNumbers[1]
					ok

					n2 = This.NumberOfItems()
					if acNumbers[2] != NULL
						n2 = 0+ acNumbers[2]
					ok

					nStep = 1
					if nLen = 3
						nStep = 0+ acNumbers[3]
					ok

					aContent = This.Content()
					aResult = []

					if nStep < 0
						nTemp = n1
						n1 = n2
						n2 = nTemp
					ok

					for i = n1 to n2 step nStep
						aResult + aContent[i]
					next

					return aResult

				but oStr.TrimQ().IsBoundedBy([ "{", "}" ])

					pcCondition = StzStringQ(pValue).TrimQ().BoundsRemoved([ "{", "}" ])
					anResult = []
	
					@i = 0
					for @item in This.List()
						@i++
						cCode = 'if ( ' + pcCondition + ' )' + NL +
							'	anResult + @i' + NL +
							'ok'
						eval(cCode)
					next
	
					return anResult
				ok

			else
				return This.FindAll(pValue)
			ok

		// Add an item at the beginning of the list
		but pcOp = "<<"
			This.InsertBeforePosition(1)

		// Add an item at the end of the list
		but pcOp = ">>"
			This.Add(pValue)

		but pcOp = "="
			return This.IsEqualTo(pValue)

		but pcOp = "=="
			return This.IsStrictlyEqualTo(pValue)

		// Divides the list on pValue sublists (a list of lists)
		but pcOp = "/" 

			if isNumber(pValue)
				return This.SplittedToNParts(pValue)

			but @IsStzNumber(pValue)
				This.SplitToNParts(pValue.NumericValue())
				return This

			but isList(pValue)
				return This.DistributedOver(pValue)

			but @IsStzList(pValue)
				This.DistributeOver(pValue.Content())
				return This
			ok

		but pcOp = "-"
			if isList(pValue)

				if _bMany
					aResult = This.Copy().ManyRemoved(pValue)
					_Many = FALSE # Resets the global flag
				else
					aResult = This.Copy().ItemRemoved(pValue)
				ok

				return aResult
			
			but @IsStzList(pValue) or @IsStzString(pValue)
				if _bMany
					This.RemoveMany(pValue.Content())
					_Many = FALSE  # Resets the global flag
				else
					This.RemoveItem(pValue.Content())
				ok

				return This
			
			but @IsStzNumber(pValue)	
				anPositions = This.FindAll(pValue.NumericValue())
				This.RemoveItemsAtPositions(anPositions)

			else
				anPositions = This.FindAll(pValue)
				aResult = This.Copy().RemoveItemsAtPositions(anPositions)
				return aResult
			ok

		but pcOp = "*"
			if @IsStzString(pValue) or @IsStzList(pValue)
				This.MultiplyBy(pValue.Content())
				return This

			but @IsStzNumber(pValue)
				This.MultiplyBy(pValue.NumericValue())
				return This

			else
				aResult = This.Copy().MultiplyByQ(pValue).Content()
				return aResult
			ok

		but pcOp = "+"

			if @IsStzString(pValue) or @IsStzList(pValue)
				This.AddItem(pValue.Content())
				return This

			but @IsStzNumber(pValue)
				This.AddItem(pValue.NumericValue())

			else
				aResult = This.Copy().AddItemQ(pValue).Content()
				return aResult
			ok
		ok

	  #------------------------------#
	 #     CALCULATION OPERATORS    #
	#------------------------------#

	def MultiplyBy(p)
		switch ring_type(p)
		on "NUMBER"
			aContent = This.Content()
			nLen = len(aContent)

			aResult = []

			for i = 1 to p
				for j = 1 to nLen
					aResult + aContent[j]
				next
			next

			This.Update( aResult )

		on "STRING"
			for item in This.List()
				if isString(item)
					item += p

				but isNumber(item)
					for i = 1 to p-1
						item += item
					next

				but isList(item)
					item = StzListQ(item) * p
				ok
			next

		on "LIST"
			// TODO: Produces a list of lists (matrix)
			StzRaise("Unavailable feature!")


		other
			StzRaise("Unsupported type!")
		off

		#< @FunctionFluentForm

		def MultiplyByQ(p)
			This.MultiplyBy(p)
			return This

		#>

		#< @FunctionAlternativeForm

		def Multiply(p)
			This.MultiplyWith(p)

		#>

	def ItemsInPositions(panPositions)
		aResult = []
		for n in panPositions
			aResult + This.Item(n)
		next

		return aResult

		def ItemsInPositionsQ(panPositions)
			return new stzList( This.ItemsInPositions(panPositions) ) 

	def Minus(paOtherList)
		/*
		Example:
		o1 = new stzList([ "a", "b", "b", "b", "c" ])
		? o1 - [ "b", "b" ] -->  [ "a", "b", "c" ]
		*/
		aTempList = This.List()
		for item in paOtherList
			del(aTempList, ring_find(aTempList, item))
		next

		This.Update( aTempList )

		def MinusQ(paOtherList)
			This.Minus(paOtherList)
			return This

	  #===========================================#
	 #  EXTENDING THE LIST WITH THE GIVEN ITEMS  #
	#===========================================#

	def ExtendWith(paItems)
		if NOT isList(paItems)
			StzRaise("Incorrect param type! paItems must be a list.")
		ok

		nLen = len(paItems)

		for i = 1 to nLen
			@aContent + paItems[i]
			# NOTE
			# Using This.Add() is better then using @aContent directly,
			# but I do it to gain performance on large lists

		next

		#< @FunctionFluentForm

		def ExtendWithQ(paItems)
			This.ExtendWith(paItems)
			return This

		#>

		#< @FunctionAlternativeForm

		def ExtendWithItems(paItems)
			This.ExtendWith(paItems)

			def ExtendWithItemsQ(paItems)
				This.ExtendWithItems(paItems)
				return This

		#>

	def ExtendedWith(paItems)
		aResult = This.Copy().ExtendWithQ(paItems).Content()
		return aResult

		def ExtendedWithItems(paItems)
			return This.ExtendedWith(paItems)

	  #-------------------------------------#
	 #  EXTENDINF THE LIST TO N POSITIONS  #
	#-------------------------------------#

	def ExtendToPosition(n)

		if NOT isNumber(n)
			StzRaise("Incorrect param type! n must be a number.")
		ok

		nLen = This.NumberOfItems()

		if n > nLen

			value = ""
			if This.IsListOfNumbers()
				value = 0
			ok

			nExtend = n - nLen
			for i = 1 to nExtend
				@aContent + value
			next
		ok
		
		#< @FunctionFluentForm

		def ExtendToPositionQ(n)
			This.ExtendToPosition(n)
			return This

		#>

		#< @FunctionAlternativeForm

		def ExtendTo(n)
			if isList(n) and
			   ( Q(n).IsPositionNamedParam() or Q(n).IsToNItemsNamedParam() )

				n = n[2]
			ok
	
			This.ExtendToPosition(n)
			
			def ExtendToQ(n)
				This.ExtendTo(n)
				return This

		def ExtendToNItems(n)
			This.ExtendToPosition(n)
			
			def ExtendToNItemsQ(n)
				This.ExtendToNItems(n)
				return This

		def Extend(n)
			if isList(n) and Q(n).IsOneOfTheseNamedParams([ :To, :ToPosition, :ToNItems ])
				n = n[2]
			ok
	
			This.ExtendToPosition(n)
			
			def ExtendQ(n)
				This.Extend(n)
				return This

		#>

	def ExtendedToPosition(n)
		aResult = This.Copy().ExtendToPositionQ(n).Content()
		return aResult

		#< @FunctionAlternativeForms

		def ExtendedTo(n)
			cResult = This.Copy().ExtendToQ(n).Content()
			return cResult

		def Extended(n)
			cResult = This.Copy().ExtendQ(n).Content()
			return cResult

		def ExtendedToNItems(n)
			return This.ExtendedToPosition(n)

		#>

	  #-------------------------------------------------------------#
	 #  EXTENDING THE LIST TO A GIVEN POSITION WITH A GIVEN VALUE  #
	#-------------------------------------------------------------#

	def ExtendToPositionWith(n, pValue)

		if isString(pValue) and pValue = :ItemsRepeated
			This.ExtendToPositionWithItemsRepeadted(n)
			return
		ok

		if NOT isNumber(n)
			StzRaise("Incorrect param type! n must be a number.")
		ok

		nLen = This.NumberOfItems()

		if n > nLen

			nExtend = n - nLen
			for i = 1 to nExtend
				@aContent + pValue
			next
		ok

		#< @FunctionFluentForm

		def ExtendToPositionWithQ(n, pValue)
			This.ExtendToPositionWith(n, pValue)
			return This

		#>

		#< @FunctionAlternativeForm

		def ExtendToWith(n, pValue)
			This.ExtendToPositionWith(n, pValue)

			def ExtendToWithQ(n, pValue)
				This.ExtendToWith(n, pValue)
				return This

		#>

	def ExtendedToPositionWith(n, pValue)
		aResult = This.Copy().ExtendToPositionWithQ(n, pValue).Content()
		return aResult

		def ExtendedToWith(n, pValue)
			return This.ExtendedToPositionWith(n, pValue)

		#-- Misspelled

		def ExtendtedToWith(n, pValue)
			return This.ExtendedToPositionWith(n, pValue)

	  #----------------------------------------------------------------------#
	 #  EXTENDING THE LIST TO A GIVEN POSITION BY REPEATING THE LIST ITEMS  #
	#----------------------------------------------------------------------#
	
	def ExtendToPositionWithItemsRepeated(n)
		This.ExtendToPositionWithItemsIn(n, This.List())

		#< @FunctionFluentForm

		def ExtendToPositionWithItemsRepeatedQ(n)
			This.ExtendToPositionWithItemsRepeated(n)
			return This

		#>

		#< @FunctionAlternativeForms

		def ExtendToWithItemsRepeated(n)
			This.ExtendToPositionWithItemsRepeated(n)

			def ExtendToWithItemsRepeatedQ(n)
				This.ExtendToWithItemsRepeated(n)
				return This

		def ExtendToByRepeatingItems(n)
			This.ExtendToPositionWithItemsRepeated(n)

			def ExtendtoByRepeatingItemsQ(n)
				This.ExtendtoByRepeatingItems(n)
				return This

		#>

		#< @FunctionMisspelledForms

		def ExtendToWithItemsRepeadted(n)
			This.ExtendToPositionWithItemsRepeated(n)

		def ExtendToPositionWithItemsRepeadted(n)
			This.ExtendToPositionWithItemsRepeated(n)

		#>

	def ExtendedToPositionWithItemsRepeated(n)
		aResult = This.Copy().ExtendToPositionWithItemsRepeatedQ(n).Content()
		return aResult

		#< @FunctionAlternativeForm

		def ExtendedToWithItemsRepeated(n)
			return This.ExtendedToPositionWithItemsRepeated(n)

		def ExtendedToByRepeatingItems(n)
			return This.ExtendedToPositionWithItemsRepeated(n)

		#>

		#< @FunctionMisspelledForm

		def ExtendedToWithItemsRepeadted(n)
			return This.ExtendedToPositionWithItemsRepeated(n)

		def ExtendtedToWithItemsRepeadted(n)
			return This.ExtendedToPositionWithItemsRepeated(n)

		def ExtendtedToWithItemsRepeated(n)
			return This.ExtendedToPositionWithItemsRepeated(n)

		#>

	  #----------------------------------------------------------------------#
	 #  EXTENDING THE LIST TO A GIVEN POSITION BY REPEATING THE LIST ITEMS  #
	#----------------------------------------------------------------------#

	def ExtendToPositionWithItemsIn(n, paItems)
		if NOT isNumber(n)
			StzRaise("Incorrect param type! n must be a number.")
		ok

		if NOT isList(paItems)
			StzRaise("Incorrect param type! paItems must be a list.")
		ok

		nLen = len(paItems)
		nTemp = n - nLen
		aTemp = []

		if nTemp > 0
			j = 0
			for i = 1 to nTemp
				j++
				if j > nLen
					j = 1
				ok

				aTemp + paItems[j]
			next
		ok

		This.ExtendWith(aTemp)

		#< @FunctionFluentForm

		def ExtendToPositionWithItemsInQ(n, paItems)
			This.ExtendToPositionWithItemsIn(n, paItems)
			return This

		#>

		#< @FunctionAlternativeForm

		def ExtendToWithItemsIn(n, paItems)
			return This.ExtendToPositionWithItemsIn(n, paItems)

			def ExtendToWithItemsInQ(n, paItems)
				This.ExtendToWithItemsIn(n, paItems)
				return This

		#>

	def ExtendedToPositionWithItemsIn(n, paItems)
		aResult = This.Copy().ExtendToPositionWithItemsInQ(n, paItems).Content()
		return aResult

		def ExtendedToWithItemsIn(n, paItems)
			return This.ExtendedToPositionWithItemsIn(n, paItems)

		#-- Misspelled

		def ExtendtedToWithItemsIn(n, paItems)
			return This.ExtendedToPositionWithItemsIn(n, paItems)

	  #------------------------------------------------#
	 #  EXTENDING THE LIST - A GENERAL EXTENDED FORM  #
	#------------------------------------------------#

	def ExtendXT(n, pWith)
		/*
		EXAMPLE 1

		o1 = new stzList([ "A", "B", "C" ])
		o1.ExtendXT( :List, :With = ["D", "E"])
		o1.Show()
		#--> [ "A", "B", "C", "D", "E" ])

		EXAMPLE 2

		o1 = new stzList([ "A", "B", "C" ])
		o1.ExtendXT( :List, :ToPosition = 5 )
		o1.Show()
		#--> [ "A", "B", "C", "", "" ]

		EXAMPLE 3

		o1 = new stzList([ "A", "B", "C" ])
		o1.ExtendXT( :ToPosition = 5, :With = :ItemsRepeadted )
		# Or: o1.ExtendXT( :ToPosition = 5, :ByRepeatingItems )
		o1.Show()
		#--> [ "A", "B", "C", "A", "B" ])

		EXAMPLE 4

		o1 = new stzList([ "A", "B", "C" ])
		o1.ExtendXT( :ToPosition = 5, :With = "*" )
		o1.Show()
		#--> [ "A", "B", "C", "*", "*" ]

		EXAMPLE 5

		o1 = new stzList([ "A", "B", "C" ])
		o1.ExtendXT( :ToPostion = 5, :WithItemsIn = [ "D", "E" ])
		o1.Show()
		#--> [ "A", "B", "C", "D", "E" ]

		*/

		if isString(n) and n = :List

			# Case 1: o1.ExtendXT( :List, :With = ["D", "E"])
			if isList(pWith) and Q(pWith).IsWithOrByOrUsingNamedParam()
				This.ExtendWith(pWith[2])
				return

			# Case 2: o1.ExtendXT( :List, :ToPosition = 5 )
			but isList(pWith) and Q(pWith).IsToOrToPositionNamedParam()
				This.ExtendToPosition(pWith[2])
				return

			ok

		but isList(n) and Q(n).IsToOrToPositionNamedParam()

			if isList(pWith) and Q(pWith).IsWithOrUsingOrByNamedParam() 

				# Case 3: o1.ExtendXT( :ToPosition = 5, :With = :ItemsRepeated )
				if isString(pWith[2]) and
				   ( pWith[2] = :ItemsRepeated or pWith[2] = :RepeatingItems )

					This.ExtendToPositionWithItemsRepeadted(n[2])
					# Note this is a misspelled form --> ...Repea(d)ted()
					return
	
				# Case 4: o1.ExtendXT( :ToPosition = 5, :With = "*" )
				else
					This.ExtendToPositionWith(n[2], pWith[2])
					return
				ok

			but isString(pWith) and
			    Q(pWith).IsOneOfThese([
				:ByRepeatingItems, :WithItemsRepeated, :ByItemsRepeated ] )

				if isList(n) and Q(n).IsToOrToPositionNamedParam()
					n = n[2]
				ok

				This.ExtendToPositionWithItemsRepeadted(n)
				return

			# Case 5: o1.ExtendXT( :ToPostion = 5, :WithItemsIn = [ "D", "E" ])
			but Q(pWith).IsWithItemsInNamedParam()
				This.ExtendToPositionWithItemsIn(n[2], pWith[2])
				return

			ok
		ok

		StzRaise("Unsupported syntax!")

		#< @FunctionFluentForm

		def ExtendXTQ(n, pWith)
			This.ExtendXT(n, pWith)
			return This

		#>

	def ExtendedXT(n, pWith)
		aResult = This.Copy().ExtendXTQ(n, pWith).Content()
		return aResult

		#< @FunctionMisspelledForm

		def ExtendtedXT(n, pWith)
			return This.ExtendedXT(n, pWith)

	  #------------------------------------------#
	 #  SHRINKING THE LIST TO A GIVEN POSITION  #
	#==========================================#

	def ShrinkTo(n)
		if isList(n) and Q(n).IsPositionNamedParam()
			n = n[2]
		ok

		if NOT isNumber(n)
			StzRaise("Incorrect param type! n must be a number.")
		ok

		nLen = This.NumberOfItems()
		if n < nLen
			This.RemoveItemsAtPositions( (n+1) : nLen )
		ok

		#< @FunctionFluentForm

		def ShrinkToQ(n)
			This.ShrinkTo(n)
			return This

		#>

		#< @FunctionAlternativeForm

		def ShrinkToPosition(n)
			This.ShrinkTo(n)

			def ShrinkToPositionQ(n)
				This.ShrinkToPosition(n)
				return This

		def ShrinkToNItems(n)
			if NOT isNumber(n)
				StzRaise("Incorrect param type! n must be a number.")
			ok

			This.ShrinkToPosition(n)

			def ShrinkToNItemsQ(n)
				This.ShrinkToNItems(n)
				return This

		def Shrink(n)
			if isList(n) and
			   ( Q(n).IsToOrToPositionNamedParam() or
			     Q(n).IsToNCharsNamedParam() )

				n = n[2]
			ok

			This.ShrinkTo(n)

			def ShrinkQ(n)
				This.Shrink(n)
				return This
		#>

	def ShrinkedTo(n)
		aResult = This.Copy().ShrinkToQ(n).Content()
		return aResult

		#< @FunctionAlternativeForms

		def ShrinkedToPosition(n)
			return This.ShrinkedTo(n)

		def ShrinkedToNItems(n)
			if NOT isNumber(n)
				StzRaise("Incorrect param type! n must be a number.")
			ok

			return Thus.ShrinkedToPosition(n)

		def Shrinked(n)
			return This.ShrinkedTo(n)

		#>

	  #===============================================#
	 #  MERGING THE LIST - IF IT IS A LIST OF LISTS  #
	#===============================================#

	def Merge()

		aContent = This.Content()
		nLen = This.NumberOfItems()

		aResult = []

		for i = 1 to nLen
			if isList(aContent[i])
				nLenList = len(aContent[i])
				for j = 1 to nLenList
					aResult + aContent[i][j]
				next
			else
				aResult + aContent[i]
			ok
		next

		This.Update(aResult)


		def MergeQ()
			This.Merge()
			return This

	def Merged()
		aResult = This.Copy().MergeQ().Content()
		return aResult

	  #-----------------------------------------#
	 #   MERGING THE LIST WITH AN OTHER LIST   #
	#-----------------------------------------#

	def MergeWith(paOtherList)
		if NOT isList(paOtherList)
			StzRaise("Incorrect param! paOtherList must be a list.")
		ok

		nLen = len(paOtherList)

		for i = 1 to nLen
			This.Add(paOtherList[i])
		next

		def MergeWithQ(paOtherList)
			This.MergeWith(paOtherList)
			return This

	def MergedWith(paOtherList)
		aResult = This.Copy().MergeWithQ(paOtherList).Content()
		return aResult

	  #----------------------------#
	 #     FLATTENING THE LIST    #
	#----------------------------#
	
	def Flatten() 
		/* EXAMPLE

		o1 = new stzList([ "A", [ "]B[", "C" ], "D", [ [ "E", "F" ] ] ]
		? o1.Flatten()

		#--> [ "A", "B", "C", "D" ]

		*/

		aContent = This.Content()
		nLen = This.NumberOfItems()
		
		aResult = []
		aTemp = []

		for i = 1 to nLen

			if isList(aContent[i])

				aTemp = Q(aContent[i]).Flattened()
				nLenTemp = len(aTemp)

				for j = 1 to nLenTemp
					aResult + aTemp[j]
				next
			else
				aResult + aContent[i]
			ok
		next
		
		This.Update(aResult)

		#< @FunctionFluentForm

		def FlattenQ()
			This.Flatten()
			return This

		def FlattenQR(pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			if NOT ( isString(pcReturnType) and Q(pcReturnType).IsStzClassName() )
				StzRaise("Incorrect param type! pcReturnType must be a string containing a Softanza class name.")
			ok

			switch pcReturnType
				on :stzList
					return new stzList( This.Flattened() )
				on :stzListOfStrings
					return new stzListOfStrings( This.Flattened() )

				on :stzListOfNumbers
					return new stzListOfNumbers( This.Flattened() )

				on :stzListOfLists
					return new stzListOfLists( This.Flattened() )

				on :stzListOfPairs
					return new stzListOfPairs( This.Flattened() )

				on :stzListOfObjects
					return new stzListOfObjects( This.Flattened() )

				other
					StzRaise("Unsupported return type!")
				off
		#>
	
	def Flattened()
		aResult = This.Copy().FlattenQ().Content()
		return aResult

	  #----------------------#
	 #     FROM/TO LIST     #
	#----------------------#
	# TODO: Do it for all Softanza classes()

	def ToStzSet()
		return new stzSet( This.ToSet() )

	def ToStzListOfNumbers()
		return new stzListOfNumbers( This.Content() )

	def ToStzListOfLists()
		return new stzListOfLists(This.Content())

	def ToStzListOfPairs()
		return new stzListOfPairs(This.Content())

	def ToStzListOfStrings()
		return new stzListOfStrings(This.Content())

	def ToStzHashList()
		return new stzHashList( This.List() )

	  #-----------------------------------------------------#
	 #     NUMBER OF OCCURRENCE OF AN ITEM IN THE LIST     #
	#-----------------------------------------------------#
	
	def NumberOfOccurrenceCS(pItem, pCaseSensitive)
		if isList(pItem) and StzListQ(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		oListInStr = new stzString( This.ToCodeQ().LastNCharsRemoved(2) + ", ]" )

		nResult = len( oListInStr.SplitCS( " " + @@(pItem) + ",", pCaseSensitive) ) - 1
		return nResult


		#< @FunctionAlternativeForms

		def NumberOfOccurrencesCS(pItem, pCaseSensitive)
			return This.NumberOfOccurrenceCS(pItem, pCaseSensitive)

		def CountCS(pItem, pCaseSensitive)
			return NumberOfOccurrenceCS(pItem, pCaseSensitive)

		def HowManyCS(pItem, pCaseSensitive)
			return NumberOfOccurrenceCS(pItem, pCaseSensitive)

		def ItemOccursNTimesCS(n, pItem, pCaseSensitive)
			return NumberOfOccurrenceCS(pItem, pCaseSensitive)

		#>

		#< @FunctionMisspelledForm

		def NumberOfOccurenceCS(pItem, pCaseSensitive)
			return This.NumberOfOccurrenceCS(pItem, pCaseSensitive)

		#

	#-- WITHOUT CASESENSITIVITY

	def NumberOfOccurrence(pItem)
		return This.NumberOfOccurrenceCS(pItem, :CaseSensitive = TRUE)

		#< @FucntionAlternativeForms

		def NumberOfOccurrences(pItem)
			return This.NumberOfOccurrence(pItem)

		def Count(pItem)
			return NumberOfOccurrence(pItem)

		def HowMany(pItem)
			return NumberOfOccurrence(pItem)

		def ItemOccursNTimes(n, pItem)
			return NumberOfOccurrence(pItem)

		#>
	
		#< @FunctionMisspelledForm

		def NumberOfOccurence(pItem)
			return This.NumberOfOccurrence(pItem)

		#

	  #--------------------------------------------------------------#
	 #  FINDING THE OCCURRENCES OF EACH ITEM CONTAINED IN THE LIST  #
	#==============================================================#
	# NOTE: for performance reason, the items are stringified.

	def FindItemsCS(pCaseSensitive) # TODO: Is it a kind of Index() ?
		/* EXAMPLE

		o1 = new stzList([ "Ab", "Im", "Ab", "Cf", "Fd", "Ab", "Cf" ])

		? @@( o1.FindItems() ) # Or PositionsOfEachItem()

		#--> [
		#	[ "Ab", [ 1, 3, 6 ] ],
		#	[ "Im", [ 2 ] ],
		#	[ "Cf", [ 4, 7 ] ],
		#	[ "Fd", [ 5 ] ]
		# ]

		*/

		# Checking params

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( pCaseSensitive = TRUE or pCaseSensitive = FALSE )
			StzRais("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		nLen = This.NumberOfItems()
		if nLen < 2
			return []
		ok

		aContent = []

		# We stringify the list (all items are becoming strings)

		if pCaseSensitive = TRUE

			aContent = This.Copy().
					StringifyAndReplaceQ(",", "*").
					Content()

		else // pCaseSensitive = FALSE

			aContent = This.Copy().
					StringifyLowercaseAndReplaceQ(",", "*").
					Content()
		ok


		acItems = []
		anOccur = []

		for i = 1 to nLen

			cCurrentItem = aContent[i]
			nPos = ring_find(acItems, cCurrentItem)

			if nPos = 0
				acItems + cCurrentItem
				anOccur + [i]

			else
				n = ring_find(acItems, cCurrentItem)
				anOccur[n] + i
			ok

		next

		aResult = []
		nLen = len(acItems)

		for i = 1 to nLen
			aResult + [ acItems[i], anOccur[i] ]
		next

		return aResult 

		#< @FunctionFluentForms

		def FindItemsCSQ(pCaseSensitive)
			return This.FindItemsCSQR(pCaseSensitive, :stzList)

		def FindItemsCSQR(pCaseSensitive, pcReturnType)

			switch pcReturnType
			on :stzList
				return new stzList( This.FindItemsCS(pCaseSensitive) )

			on :stzHashList
				return new stzHashList( This.FindItemsCS(pCaseSensitive) )

			on :stzListOfPairs
				return new stzListOfPairs( This.FindItemsCS(pCaseSensitive) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForm

		def PositionsOfEachItemCS(pCaseSensitive)
			return This.FindItemsCS(pCaseSensitive)

			def PositionsOfEachItemCSQ(pCaseSensitive)
				return This.PositionsOfEachItemCSQ(pCaseSensitive)

			def PositionsOfEachItemCSQR(pCaseSensitive, pcReturnType)
				return This.PositionsOfEachItemCSQR(pCaseSensitive, pcReturnType)

		#>

	#-- WITHOUT CASESENSITIVE

	def FindItems()
		return This.FindItemsCS(:CaseSensitive = TRUE)
			
		#< @FunctionFluentForms

		def FindItemsQ()
			return This.FindItemsCSQ(:CaseSensitive = TRUE)

		def FindItemsQR(pcReturnType)
			return This.FindItemsCSQR(:CaseSensitive = TRUE, pcReturnType)

		#>

		#< @FunctionAlternativeForm

		def PositionsOfEachItem()
			return This.FindItems()

			def PositionsOfEachItemQ()
				return This.FindItemsQ()

			def PositionsOfEachItemQR(pcReturnType)
				return This.FindItemsQR(pcReturnType)

		#>

	  #==================================================#
	 #  CHECKING IF AN ITEM IS DUPPLICATED IN THE LIST  #
	#==================================================#

	def ItemIsDuplicatedCS(pItem, pCaseSensitive)

		nFirstPos = This.FindFirstCS(pItem, pCaseSensitive)

		nFindBefore = This.FindPreviousCS(pItem, :StartingAt = nFirstPos, pCaseSensitive)
		if nFindBefore != 0
			return TRUE
		ok

		nFindAfter = This.FindNext(pItem, :StartingAt = nFirstPos, pCaseSensitive)
		if nFindAfter != 0
			return TRUE
		ok

		return FALSE

		#< @FunctionAlternativeForms

		def ItemIsDuplicateCS(pItem, pCaseSensitive)
			return This.IsDuplicatedCS(pItem, pCaseSensitive)

		def ItemIsADuplicateCS(pItem, pCaseSensitive)
			return This.IsDuplicatedCS(pItem, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def ItemIsDuplicated(pItem)
		return This.ItemIsDuplicatedCS(pItem, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ItemIsDuplicate(pItem)
			return This.IsDuplicated(pItem)

		def ItemIsADuplicate(pItem)
			return This.IsDuplicated(pItem)

		#>

	  #-----------------------------------------------------#
	 #  CHECKING IF MANY ITEMS ARE DUPLICATED IN THE LIST  #
	#-----------------------------------------------------#

	def ItemsAreDuplicatedCS(paItems, pCaseSensitice)
		if NOT isList(paItems)
			StzRaise("Incorrect param type! paItems must be a list.")
		ok

		nLen = len(paItems)
		bResult = TRUE

		for i = 1 to nLen
			if NOT This.ItemIsDuplicatedCS(pItem, pCaseSensitive)
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def ItemsAreDuplicatesCS(paItems, pCaseSensitive)
			return This.ItemsAreDuplicatedCS(paItems, pCaseSensitice)

	#-- WITHOUT CASESENSITIVITY

	def ItemsAreDuplicated(paItems)
		return This.ItemsAreDuplicatedCS(paItems, :CaseSensitice = TRUE)
		
		def ItemsAreDuplicates(paItems)
			return This.ItemsAreDuplicated(paItems)

	  #----------------------------------------------------#
	 #   CHECKING IF THE LIST CONTAINS DUPLICATED ITEMS   #
	#----------------------------------------------------#

	# WARNING: As implemented currently, duplication is performed
	# in a reasonable performance when the size of the list does
	# not exceed 30K items!

	def ContainsDuplicatesCS(pCaseSensitive)

		# Checking params

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( pCaseSensitive = TRUE or pCaseSensitive = FALSE )
			StzRais("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return FALSE
		ok

		acStr = []

		# We duplicate the code because we need to manage casesensitivty
		# while relying on the performant native ring_find()

		# We start by stringifying the list (casting all the items in to strings)
		# so we can find not onlu numbers and strings, but also lists,
		# and get relatively beeter performance on larger lists (up to 30K items)


		if pCaseSensitive = TRUE

			for i = 1 to nLen

				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])

				ok

				# Memorising the stringified items so we can used them later
	
				acStr + cItem
			next

		else // pCaseSensitive = FALSE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])
					
				ok
	
				# Memorising the stringified items so we can used them later
	
				acStr + Q(cItem).Lowercased()
			next

		ok

		# Checking if an item is a duplicate

		bResult = FALSE
		acSeen = []

		for i = 1 to nLen

			n = ring_find( acSeen, acStr[i] )
			if n = 0
				acSeen + acStr[i]
			else
				bResult = TRUE
				exit
			ok

		next

		return bResult
			
		#< @FunctionAlternativeForms

		def ContainsDuplicatedItemsCS(pCaseSensitive)
			return This.ContainsDuplicatesCS(pCaseSensitive)

		def ContainsDuplicationsCS(pCaseSensitive)
			return This.ContainsDuplicatesCS(pCaseSensitive)

		def ContainsDuplicationCS(pCaseSensitive)
			return This.ContainsDuplicatesCS(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def ContainsDuplicates()
		return This.ContainsDuplicatesCS(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ContainsDuplicatedItems()
			return This.ContainsDuplicates()

		def ContainsDuplications()
			return This.ContainsDuplicates()

		def ContainsDuplication()
			return This.ContainsDuplicates()

		#>

	  #-----------------------------------------------------#
	 #   CHECHKING IF A GIVEN ITEM IS DUPLICATED N-TIMES   #
	#-----------------------------------------------------#

	def ItemIsDuplicatedNTimesCS(n, pItem, pCaseSensitive)
		if This.NumberOfDuplicatesOfItemCS(pItem, pCaseSensitive) = n
			return TRUE
		else
			return FALSE
		ok

	#-- WITHOUT CASESENSITIVITY

	def ItemIsDuplicatedNTimes(n, pItem)
		return This.ItemIsDuplicatedNTimesCS(n, pItem, :CaseSensitive = TRUE)

	  #----------------------------------------------------#
	 #  CHECKING IF ALL ITEMS IN THE LIST ARE DUPLICATED  #
	#----------------------------------------------------#

	def AllItemsAreDuplicatedCS(pCaseSensitive)

		# Checking params

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( pCaseSensitive = TRUE or pCaseSensitive = FALSE )
			StzRais("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return FALSE
		ok

		acStr = []

		# We duplicate the code because we need to manage casesensitivty
		# while relying on the performant native ring_find()

		# We start by stringifying the list (casting all the items in to strings)
		# so we can find not onlu numbers and strings, but also lists,
		# and get relatively beeter performance on larger lists (up to 30K items)


		if pCaseSensitive = TRUE

			for i = 1 to nLen

				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])

				ok

				# Memorising the stringified items so we can used them later
	
				acStr + cItem
			next

		else // pCaseSensitive = FALSE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])			
				ok
	
				# Memorising the stringified items so we can used them later
	
				acStr + Q(cItem).Lowercased()
			next

		ok

		# Checking if an item is a duplicate

		bResult = TRUE
		acSeen = []
		acNonDuplicated = []

		for i = 1 to nLen

			n = ring_find( acSeen, acStr[i] )
			if n = 0
				acSeen + acStr[i]
				acNonDuplicated + acStr[i]
			else
				nPos = ring_find( acNonDuplicated, acStr[i] )
				if nPos > 0
					ring_del(acNonDuplicated, nPos)
				ok
	
			ok

		next

		if len(acNonDuplicated) > 0
			bResult = FALSE
		ok

		return bResult

	#-- WITHOUT CASESENSITIVITY

	def AllItemsAreDuplicated()
		return This.AllItemsAreDuplicatedCS(:CaseSensitive = TRUE)

	  #-------------------------------------------------------------------#
	 #  CHECKING IF THE LIST IS A SET (CONTAINS NO DUPLICATIONS AT ALL)  #
	#===================================================================#

	def ContainsNoDuplicatesCS(pCaseSensitive) # Alternative of IsSet()

		# Checking params

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( pCaseSensitive = TRUE or pCaseSensitive = FALSE )
			StzRais("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return FALSE
		ok

		acStr = []

		# We duplicate the code because we need to manage casesensitivty
		# while relying on the performant native ring_find()

		# We start by stringifying the list (casting all the items in to strings)
		# so we can find not onlu numbers and strings, but also lists,
		# and get relatively beeter performance on larger lists (up to 30K items)

		if pCaseSensitive = TRUE

			for i = 1 to nLen

				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])

				ok

				# Memorising the stringified items so we can used them later
	
				acStr + cItem
			next

		else // pCaseSensitive = FALSE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])
				
				ok
	
				# Memorising the stringified items so we can used them later
	
				acStr + Q(cItem).Lowercased()
			next

		ok

		# Checking if an item is a duplicate

		bResult = TRUE
		acSeen = []
		acNonDuplicated = []

		for i = 1 to nLen

			n = ring_find( acSeen, acStr[i] )
			if n = 0
				acSeen + acStr[i]
				acNonDuplicated + acStr[i]
			else
				nPos = ring_find( acNonDuplicated, acStr[i] )
				if nPos > 0
					bResult = FALSE
					exit
				ok
	
			ok

		next

		return bResult

		#< @FunctionAlterativeForms

		def ContainsNoDuplicatesAtAllCS(pCaseSensitive)
			return This.ContainsNoDuplicatesCS(pCaseSensitive)

		def ContainsNoDuplicatedItemsCS(pCaseSensitive)
			return This.ContainsNoDuplicatesCS(pCaseSensitive)

		def ContainsNoDuplicatedItemsAtAllCS(pCaseSensitive)
			return This.ContainsNoDuplicatesCS(pCaseSensitive)

		def ContainsNoDuplicationsCS(pCaseSensitive)
			return This.ContainsNoDuplicatesCS(pCaseSensitive)

		def ContainsNoDuplicationsAtAllCS(pCaseSensitive)
			return This.ContainsNoDuplicatesCS(pCaseSensitive)

		def ContainsNoDuplicationCS(pCaseSensitive)
			return This.ContainsNoDuplicatesCS(pCaseSensitive)

		def ContainsNoDuplicationAtAllCS(pCaseSensitive)
			return This.ContainsNoDuplicatesCS(pCaseSensitive)

		def NoItemsAreDuplicatedCS(pCaseSensitive)
			return This.ContainsNoDuplicatesCS(pCaseSensitive)

		def NoItemsAreDuplicatesCS(pCaseSensitive)
			return This.ContainsNoDuplicatesCS(pCaseSensitive)

		def NoItemsAreDuplicatedAtAllCS(pCaseSensitive)
			return This.ContainsNoDuplicatesCS(pCaseSensitive)

		def NoItemsAreDuplicatesAtAllCS(pCaseSensitive)
			return This.ContainsNoDuplicatesCS(pCaseSensitive)

		def IsSetCS(pCaseSensitive)
			return This.ContainsNoDuplicatesCS(pCaseSensitive)

		def IsASetCS(pCaseSensitive)
			return This.ContainsNoDuplicatesCS(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def ContainsNoDuplicates()
		return This.ContainsNoDuplicatesCS(:CaseSensitive = TRUE)

		#< @FunctionAlterativeForms

		def ContainsNoDuplicatesAtAll()
			return This.ContainsNoDuplicates()

		def ContainsNoDuplicatedItems()
			return This.ContainsNoDuplicates()

		def ContainsNoDuplicatedItemsAtAll()
			return This.ContainsNoDuplicates()

		def ContainsNoDuplications()
			return This.ContainsNoDuplicates()

		def ContainsNoDuplicationsAtAll()
			return This.ContainsNoDuplicates()

		def ContainsNoDuplication()
			return This.ContainsNoDuplicates()

		def ContainsNoDuplicationAtAll()
			return This.ContainsNoDuplicates()

		def NoItemsAreDuplicated()
			return This.ContainsNoDuplicates()

		def NoItemsAreDuplicates()
			return This.ContainsNoDuplicates()

		def NoItemsAreDuplicatedAtAll()
			return This.ContainsNoDuplicates()

		def NoItemsAreDuplicatesAtAll()
			return This.ContainsNoDuplicates()

		def IsSet()
			return This.ContainsNoDuplicates()

		def IsASet()
			return This.ContainsNoDuplicates()

		#>

	  #--------------------------#
	 #   NUMBER OF DUPLICATES   #
	#==========================#

	def NumberOfDuplicatesCS(pCaseSensitive)
		nResult = len( This.FindDuplicatesCS(pCaseSensitive) )
		return nResult

		#< @FunctionAlternativeForm

		def NumberOfDuplicatedItemsCS(pCaseSensitive)
			return This.NumberOfDuplicatesCS(pCaseSensitive)

		def NumberOfDuplicationsCS(pCaseSensitive)
			return This.NumberOfDuplicatesCS(pCaseSensitive)

		def NumberOfDuplicationCS(pCaseSensitive)
			return This.NumberOfDuplicatesCS(pCaseSensitive)

		#--

		def HowManyDuplicatesCS(pCaseSensitive)
			return This.NumberOfDuplicatesCS(pCaseSensitive)

		def HowManyDuplicateCS(pCaseSensitive)
			return This.NumberOfDuplicatesCS(pCaseSensitive)

		def HowManyDuplicatedItemsCS(pCaseSensitive)
			return This.NumberOfDuplicatesCS(pCaseSensitive)

		def HowManyDuplicatedItemCS(pCaseSensitive)
			return This.NumberOfDuplicatesCS(pCaseSensitive)

		def HowManyDuplicationsCS(pCaseSensitive)
			return This.NumberOfDuplicatesCS(pCaseSensitive)

		def HowManyDuplicationCS(pCaseSensitive)
			return This.NumberOfDuplicatesCS(pCaseSensitive)

		#>

		#< @FunctionMisspelledForm

		def HowManuDuplicatesCS(pCaseSensitive)
			return This.NumberOfDuplicatesCS(pCaseSensitive)

		def HowManuDuplicateCS(pCaseSensitive)
			return This.NumberOfDuplicatesCS(pCaseSensitive)


		#>

	#-- WITHOUT CASESENSITIVITY

	def NumberOfDuplicates()
		return This.NumberOfDuplicatesCS(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def NumberOfDuplicatedItems()
			return This.NumberOfDuplicates()

		def NumberOfDuplications()
			return This.NumberOfDuplicates()

		def NumberOfDuplication()
			return This.NumberOfDuplicates()

		#--

		def HowManyDuplicates()
			return This.NumberOfDuplicates()

		def HowManyDuplicate()
			return This.NumberOfDuplicates()

		def HowManyDuplicatedItems()
			return This.NumberOfDuplicates()

		def HowManyDuplicatedItem()
			return This.NumberOfDuplicates()

		def HowManyDuplications()
			return This.NumberOfDuplicates()

		def HowManyDuplication()
			return This.NumberOfDuplicates()

		#>

		#< @FunctionMisspelledForm

		def HowManuDuplicates()
			return This.NumberOfDuplicates()

		def HowManuDuplicate()
			return This.NumberOfDuplicates()

		#>

	  #------------------------------------------#
	 #  GETTING DUPLICATES AND THEIR POSITIONS  #
	#------------------------------------------#

	def DuplicatesCSZ(pCaseSensitive)

		# Checking params

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( pCaseSensitive = TRUE or pCaseSensitive = FALSE )
			StzRais("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return []
		ok

		acSeen = []
		acStr = []

		# We duplicate the code because we need to manage casesensitivty
		# while relying on the performant native ring_find()

		# We start by stringifying the list (casting all the items in to strings)
		# so we can find not onlu numbers and strings, but also lists,
		# and get relatively beeter performance on larger lists (up to 30K items)

		if pCaseSensitive = TRUE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])
				ok

				# Memorising the stringified items so we can used them later
	
				acStr + cItem
			next

		else // pCaseSensitive = FALSE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])
			
				ok
	
				# Memorising the stringified items so we can used them later
	
				acStr + Q(cItem).Lowercased()
			next


		ok

		# Finding duplicates positions

		acSeen = [ acStr[1] ]
		anPos = [ [] ]

		for i = 1 to nLen

			n = ring_find(acSeen, acStr[i])

			if n = 0
				acSeen + acStr[i]
				anPos + [ i ]
			else
				anPos[ n ] + i
			ok

		next

		# Composing the association of items and their positions

		aResult = []
		nLen = len(acSeen)

		for i = 1 to nLen
			del(anPos[i], 1)
			if len(anPos[i]) > 0
				aResult + [ aContent[anPos[i][1]], anPos[i] ]
			ok
		next
		

		return aResult


		#< @FunctionAlternativeForm

		def DuplicatesAndTheirPositionsCS(pCaseSensitive)
			return This.DuplicatesCSZ(pCaseSensitive)

		def DuplicatedItemsAndTheirPositionsCS(pCaseSensitive)
			return This.DuplicatesCSZ(pCaseSensitive)

		def DuplicatedItemsCSZ(pCaseSensitive)
			return This.DuplicatesCSZ(pCaseSensitive)

		def DuplicationsAndTheirPositionsCS(pCaseSensitive)
			return This.DuplicatesCSZ(pCaseSensitive)

		def DuplicationsCSZ(pCaseSensitive)
			return This.DuplicatesCSZ(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def DuplicatesZ()
		return This.DuplicatesCSZ(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def DuplicatesAndTheirPositions()
			return This.DuplicatesZ()

		def DuplicatedItemsAndTheirPositions()
			return This.DuplicatesZ()

		def DuplicatedItemsZ()
			return This.DuplicatesZ()

		def DuplicationsAndTheirPositions()
			return This.DuplicatesZ()

		def DuplicationsZ()
			return This.DuplicatesZ()

		#>

	  #----------------------------------#
	 #   FINDING DUPLICATES POSITIONS   #
	#----------------------------------#
	# NOTE 1 : The first occurrence of an item is not considered as a duplicate
	# 	   --> If you want to get also the first occurrence then you can
	# 		use FindDuplicatesXT() # TODO

	# NOTE 2 : We use a part of the code of DuplicatesZ(). There is a duplication
	# but this is better for performance then calling DuplicatesZ(), because it
	# performs extra work not needed here!

	def FindDuplicatesCS(pCaseSensitive)

		# Checking params

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( pCaseSensitive = TRUE or pCaseSensitive = FALSE )
			StzRais("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return []
		ok

		acSeen = []
		acStr = []

		# We duplicate the code because we need to manage casesensitivty
		# while relying on the performant native ring_find()

		# We start by stringifying the list (casting all the items in to strings)
		# so we can find not onlu numbers and strings, but also lists,
		# and get relatively beeter performance on larger lists (up to 30K items)

		if pCaseSensitive = TRUE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])

				ok

				# Memorising the stringified items so we can used them later
	
				acStr + cItem
			next

		else // pCaseSensitive = FALSE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])
					
				ok
	
				# Memorising the stringified items so we can used them later
	
				acStr + Q(cItem).Lowercased()
			next


		ok

		# Finding duplicates positions

		acSeen = []
		anPos = []

		for i = 1 to nLen

			n = ring_find(acSeen, acStr[i])

			if n = 0
				acSeen + acStr[i]

			else
				anPos + i
			ok

		next

		return anPos

		#< @FunctionAlternativeForms

		def FindDuplicationsCS(pCaseSensitive)
			return This.FindDuplicatesCS(pCaseSensitive)

		def FindDuplicationCS(pCaseSensitive)
			return This.FindDuplicatesCS(pCaseSensitive)

		def FindDuplicatedItemsCS(pCaseSensitive)
			return This.FindDuplicatesCS(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindDuplicates()
		return This.FindDuplicatesCS(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindDuplications()
			return This.FindDuplicates()

		def FindDuplication()
			return This.FindDuplicates()

		def FindDuplicatedItems()
			return This.FindDuplicates()

		#>

	  #------------------------------------------------------#
	 #  GETTING DUPLICATES AND THEIR POSITIONS -- EXTENDED  #
	#------------------------------------------------------#
	# Positions of first duplicates are also returned

	def DuplicatesCSXTZ(pCaseSensitive)

		# Checking params

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( pCaseSensitive = TRUE or pCaseSensitive = FALSE )
			StzRais("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return []
		ok

		acSeen = []
		acStr = []

		# We duplicate the code because we need to manage casesensitivty
		# while relying on the performant native ring_find()

		# We start by stringifying the list (casting all the items in to strings)
		# so we can find not onlu numbers and strings, but also lists,
		# and get relatively beeter performance on larger lists (up to 30K items)

		if pCaseSensitive = TRUE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])
				ok
	
				# Memorising the stringified items so we can used them later
	
				acStr + cItem
			next

		else // pCaseSensitive = FALSE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])

				ok
	
				# Memorising the stringified items so we can used them later
	
				acStr + Q(cItem).Lowercased()
			next


		ok

		# Finding duplicates positions

		acSeen = []
		anSeen = []

		anPos = []
		aResult = []

		for i = 1 to nLen

			n = ring_find(acSeen, acStr[i])

			if n = 0
				acSeen + acStr[i]
				anSeen + i
				aResult + [ aContent[i], [i] ]
			else
				if ring_find(anPos, anSeen[n]) = 0
					anPos + anSeen[n]
				ok
				anPos + i

				aResult[n][2] + i
				
			ok

		next

		return aResult

		#< @FunctionAlternativeForm

		def DuplicatesAndTheirPositionsCSXT(pCaseSensitive)
			return This.DuplicatesCSXTZ(pCaseSensitive)

		def DuplicatedItemsAndTheirPositionsCSXT(pCaseSensitive)
			return This.DuplicatesCSXTZ(pCaseSensitive)

		def DuplicatedItemsCSXTZ(pCaseSensitive)
			return This.DuplicatesCSXTZ(pCaseSensitive)

		def DuplicationsAndTheirPositionsCSXT(pCaseSensitive)
			return This.DuplicatesCSZ(pCaseSensitive)

		def DuplicationsCSXTZ(pCaseSensitive)
			return This.DuplicatesCSXTZ(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def DuplicatesXTZ()
		return This.DuplicatesCSXTZ(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def DuplicatesAndTheirPositionsXT()
			return This.DuplicatesXTZ()

		def DuplicatedItemsAndTheirPositionsXT()
			return This.DuplicatesXTZ()

		def DuplicatedItemsXTZ()
			return This.DuplicatesXTZ()

		def DuplicationsAndTheirPositionsXT()
			return This.DuplicatesXTZ()

		def DuplicationsXTZ()
			return This.DuplicatesXTZ()

		#>

	  #----------------------------------------#
	 #   FINDING DUPLICATES POSITIONS -- XT   #
	#----------------------------------------#
	# FinDuplicates() returns the positions of the duplicated items.
	# Hence, the first occurrences of those items are not returned.
	# To return them, use this eXTended version of the function

	def FindDuplicatesCSXT(pCaseSensitive)

		# Checking params

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( pCaseSensitive = TRUE or pCaseSensitive = FALSE )
			StzRais("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return []
		ok

		acSeen = []
		acStr = []

		# We duplicate the code because we need to manage casesensitivty
		# while relying on the performant native ring_find()

		# We start by stringifying the list (casting all the items in to strings)
		# so we can find not onlu numbers and strings, but also lists,
		# and get relatively beeter performance on larger lists (up to 30K items)

		if pCaseSensitive = TRUE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])
				ok

				# Memorising the stringified items so we can used them later
	
				acStr + cItem
			next

		else // pCaseSensitive = FALSE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])				
				ok
	
				# Memorising the stringified items so we can used them later
	
				acStr + Q(cItem).Lowercased()
			next


		ok

		# Finding duplicates positions

		acSeen = []
		anSeen = []

		anPos = []

		for i = 1 to nLen

			n = ring_find(acSeen, acStr[i])

			if n = 0
				acSeen + acStr[i]
				anSeen + i
			else
				if ring_find(anPos, anSeen[n]) = 0
					anPos + anSeen[n]
				ok
				anPos + i
			ok

		next

		anPos = ring_sort(anPos)
		return anPos

		#< @FunctionAlternativeForms

		def FindDuplicationsCSXT(pCaseSensitive)
			return This.FindDuplicatesCSXT(pCaseSensitive)

		def FindDuplicationCSXT(pCaseSensitive)
			return This.FindDuplicatesCSXT(pCaseSensitive)

		def FindDuplicatedItemsCSXT(pCaseSensitive)
			return This.FindDuplicatesCSXT(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindDuplicatesXT()
		return This.FindDuplicatesCSXT(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindDuplicationsXT()
			return This.FindDuplicatesXT()

		def FindDuplicationXT()
			return This.FindDuplicatesXT()

		def FindDuplicatedItemsXT()
			return This.FindDuplicatesXT()

		#>

	  #----------------------------------------------------#
	 #  FINDING FIRST OCCURRENCE OF EACH DUPLICATED ITEM  #
	#----------------------------------------------------#

	def FindFirstDuplicatesCS(pCaseSensitive)

		# Checking params

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( pCaseSensitive = TRUE or pCaseSensitive = FALSE )
			StzRais("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return []
		ok

		acSeen = []
		acStr = []

		# We duplicate the code because we need to manage casesensitivty
		# while relying on the performant native ring_find()

		# We start by stringifying the list (casting all the items in to strings)
		# so we can find not onlu numbers and strings, but also lists,
		# and get relatively beeter performance on larger lists (up to 30K items)

		if pCaseSensitive = TRUE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])
				ok

				# Memorising the stringified items so we can used them later
	
				acStr + cItem
			next

		else // pCaseSensitive = FALSE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])				
				ok
	
				# Memorising the stringified items so we can used them later
	
				acStr + Q(cItem).Lowercased()
			next


		ok

		# Finding first duplicates positions

		acSeen = []
		anSeen = []
		anPos = []

		anResult = []

		for i = 1 to nLen

			n = ring_find(acSeen, acStr[i])

			if n = 0
				acSeen + acStr[i]
				anSeen + i
			else
				if ring_find(anPos, anSeen[n]) = 0
					anPos + anSeen[n]
					anResult + anSeen[n]
				ok
				anPos + i
			ok

		next

		return anResult

		#< @FunctionAlternativeForms

		def FindFirstDuplicatedItemsCS(pCaseSensitive)
			return This.FindFirstDuplicatesCS(pCaseSensitive)

		def FindFirstDuplicationsCS(pCaseSensitive)
			return This.FindFirstDuplicatesCS(pCaseSensitive)

		def FindFirstOccurrenceOfEachDuplicatedItemCS(pCaseSensitive)
			return This.FindFirstDuplicatesCS(pCaseSensitive)

		def FindFirstOccurrenceOfEachDuplicateCS(pCaseSensitive)
			return This.FindFirstDuplicatesCS(pCaseSensitive)

		def FindFirstOccurrenceOfEachDuplicationCS(pCaseSensitive)
			return This.FindFirstDuplicatesCS(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindFirstDuplicates()
		return This.FindFirstDuplicatesCS(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindFirstDuplicatedItems()
			return This.FindFirstDuplicates()

		def FindFirstDuplications()
			return This.FindFirstDuplicates()

		def FindFirstOccurrenceOfEachDuplicatedItem()
			return This.FindFirstDuplicates()

		def FindFirstOccurrenceOfEachDuplicate()
			return This.FindFirstDuplicates()

		def FindFirstOccurrenceOfEachDuplication()
			return This.FindFirstDuplicates()

		#>

	  #----------------------------------#
	 #  GETTING THE LIST OF DUPLICATES  #
	#----------------------------------#

	def DuplicatesCS(pCaseSensitive)
		# Checking params

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( pCaseSensitive = TRUE or pCaseSensitive = FALSE )
			StzRais("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return []
		ok

		acSeen = []
		acStr = []

		# We duplicate the code because we need to manage casesensitivty
		# while relying on the performant native ring_find()

		# We start by stringifying the list (casting all the items in to strings)
		# so we can find not onlu numbers and strings, but also lists,
		# and get relatively beeter performance on larger lists (up to 30K items)

		if pCaseSensitive = TRUE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])
				ok

				# Memorising the stringified items so we can used them later
	
				acStr + cItem
			next

		else // pCaseSensitive = FALSE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])
				ok
	
				# Memorising the stringified items so we can used them later
	
				acStr + Q(cItem).Lowercased()
			next


		ok

		# Finding duplicated items

		acSeen = [ acStr[1] ]
		anPos = [ [] ]

		for i = 1 to nLen

			n = ring_find(acSeen, acStr[i])

			if n = 0
				acSeen + acStr[i]
				anPos + [ i ]
			else
				anPos[ n ] + i
			ok

		next

		# Constructing the list of items that are duplicated in the list

		aResult = []
		nLen = len(acSeen)

		for i = 1 to nLen
			if len(anPos[i]) > 1
				aResult + aContent[anPos[i][1]]
			ok
		next
		

		return aResult

		#< @FunctionFluentForm

		def DuplicatesCSQ(pCaseSensitive)
			return new stzList(This.DuplicatesCS(pCaseSensitive))

		#>

		#< @FunctionAlternativeForm

		def DuplicatedItemsCS(pCaseSensitive)
			return This.DuplicatesCS(pCaseSensitive)

			def DuplicatedItemsCSQ(pCaseSensitive)
				return This.DuplicatesCSQ(pCaseSensitive)

		def DuplicationsCS(pCaseSensitive)
			return This.DuplicatesCS(pCaseSensitive)

			def DuplicationsCSQ(pCaseSensitive)
				return This.DuplicatesCSQ(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def Duplicates()
		return This.DuplicatesCS(:CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def DuplicatesQ()
			return new stzList(This.Duplicates())

		#>

		#< @FunctionAlternativeForm

		def DuplicatedItems()
			return This.Duplicates()

			def DuplicatedItemsQ()
				return This.DuplicatesQ()

		def Duplications(pCaseSensitive)
			return This.Duplicates(pCaseSensitive)

			def DuplicationsQ(pCaseSensitive)
				return This.DuplicatesQ(pCaseSensitive)

		#>

	  #----------------------------------------#
	 #   FINDING DUPLICATES OF A GIVEN ITEM   #
	#----------------------------------------#

	def FindDuplicatesOfItemCS(pItem, pCaseSensitive)
		anPos = This.FindAllCS(pItem, pCaseSensitive)
		nLen = len(anPos)

		anResult = []

		if nLen > 1
			anResult = Q(anPos).FirstItemRemoved()
		ok

		return anResult
		
		#< @FunctionAlternativeForms

		def FindDuplicatesOfCS(pItem, pCaseSensitive)
			return This.FindDuplicatesOfItemCS(pItem, pCaseSensitive)

		#--

		def PositionsOfDuplicatesOfItemCS(pItem, pCaseSensitive)
			return This.FindDuplicatesOfItemCS(pItem, pCaseSensitive)

		def PositionsOfDuplicatesOfCS(pItem, pCaseSensitive)
			return This.FindDuplicatesOfItemCS(pItem, pCaseSensitive)

		#--

		def FindDuplicationsOfItemCS(pItem, pCaseSensitive)
			return This.FindDuplicatesOfItemCS(pItem, pCaseSensitive)

		def FindDuplicationsOfCS(pItem, pCaseSensitive)
			return This.FindDuplicatesOfItemCS(pItem, pCaseSensitive)

		def FindDuplicationOfItemCS(pItem, pCaseSensitive)
			return This.FindDuplicatesOfItemCS(pItem, pCaseSensitive)

		def FindDuplicationOfCS(pItem, pCaseSensitive)
			return This.FindDuplicatesOfItemCS(pItem, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindDuplicatesOfItem(pItem)
		return This.FindDuplicatesOfItemCS(pItem, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindDuplicatesOf(pItem)
			return This.FindDuplicatesOfItem(pItem)

		#--

		def PositionsOfDuplicatesOfItem(pItem)
			return This.FindDuplicatesOfItem(pItem)

		def PositionsOfDuplicatesOf(pItem)
			return This.FindDuplicatesOfItem(pItem)

		#--

		def FindDuplicationsOfItem(pItem)
			return This.FindDuplicatesOfItem(pItem)

		def FindDuplicationsOf(pItem)
			return This.FindDuplicatesOfItem(pItem)

		def FindDuplicationOfItem(pItem)
			return This.FindDuplicatesOfItem(pItem)

		def FindDuplicationOf(pItem)
			return This.FindDuplicatesOfItem(pItem)

		#>

	  #---------------------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS ITEMS THAT ARE NOR DUPLICTAED  #
	#===============================================================#

	def ContainsNonDuplicatedItemsCS(pCaseSensitive)
		
		anPos = This.FindDuplicatesCSXT(pCaseSensitive)
		nLenPos = len(anPos)

		nLen = This.NumberOfItems()

		if NOT Q(anPos).IsEqualTo(1:nLen)
			return TRUE
		else
			return FALSE
		ok

		# Checking params

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( pCaseSensitive = TRUE or pCaseSensitive = FALSE )
			StzRais("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return FALSE
		ok

		#< @FunctionAlternativeForms

		def ContainsItemsThatAreNotDuplicatedCS(pCaseSensitive)
			return This.ContainsNonDuplicatedItemsCS(pCaseSensitive)

		def ContainsItemsNotDuplicatedCS(pCaseSensitive)
			return This.ContainsNonDuplicatedItemsCS(pCaseSensitive)

		def ContainsItemsNonDuplicatedCS(pCaseSensitive)
			return This.ContainsNonDuplicatedItemsCS(pCaseSensitive)

		def ContainsAtLeastOneNonDuplicatedItemsCS(pCaseSensitive)
			return This.ContainsNonDuplicatedItemsCS(pCaseSensitive)

		def ContainsAtLeastOneItemNonDuplicatedCS(pCaseSensitive)
			return This.ContainsNonDuplicatedItemsCS(pCaseSensitive)

		def ContainsAtLeastOneItemNotDuplicatedCS(pCaseSensitive)
			return This.ContainsNonDuplicatedItemsCS(pCaseSensitive)

		def ContainsAtLeastOneItemThatIsNonDuplicatedCS(pCaseSensitive)
			return This.ContainsNonDuplicatedItemsCS(pCaseSensitive)

		def ContainsAtLeastOneItemThatIsNotDuplicatedCS(pCaseSensitive)
			return This.ContainsNonDuplicatedItemsCS(pCaseSensitive)

		def ContainsAtLeastOneNonDuplicatedItemCS(pCaseSensitive)
			return This.ContainsNonDuplicatedItemsCS(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def ContainsNonDuplicatedItems()
		return This.ContainsItemsThatAreNotDuplicatedCS(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ContainsItemsThatAreNotDuplicated()
			return This.ContainsNonDuplicatedItems()

		def ContainsItemsNotDuplicated()
			return This.ContainsNonDuplicatedItems()

		def ContainsItemsNonDuplicated()
			return This.ContainsNonDuplicatedItems()

		def ContainsAtLeastOneNonDuplicatedItems()
			return This.ContainsNonDuplicatedItems()

		def ContainsAtLeastOneItemNonDuplicated()
			return This.ContainsNonDuplicatedItems()

		def ContainsAtLeastOneItemNotDuplicated()
			return This.ContainsNonDuplicatedItems()

		def ContainsAtLeastOneItemThatIsNonDuplicated()
			return This.ContainsNonDuplicatedItems()

		def ContainsAtLeastOneItemThatIsNotDuplicated()
			return This.ContainsNonDuplicatedItems()

		def ContainsAtLeastOneNonDuplicatedItem()
			return This.ContainsNonDuplicatedItems()

		#>

	  #--------------------------------------------#
	 #  GETTING THE LIST OF NON DUPLICATED ITEMS  #
	#--------------------------------------------#

	def NonDuplicatedItemsCS(pCaseSensitive)

		# Checking params

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( pCaseSensitive = TRUE or pCaseSensitive = FALSE )
			StzRais("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return FALSE
		ok

		
		acStr = []

		# We duplicate the code because we need to manage casesensitivty
		# while relying on the performant native ring_find()

		# We start by stringifying the list (casting all the items in to strings)
		# so we can find not onlu numbers and strings, but also lists,
		# and get relatively beeter performance on larger lists (up to 30K items)


		if pCaseSensitive = TRUE

			for i = 1 to nLen

				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])
				ok

				# Memorising the stringified items so we can used them later
	
				acStr + cItem
			next

		else // pCaseSensitive = FALSE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])
					
				ok
	
				# Memorising the stringified items so we can used them later
	
				acStr + Q(cItem).Lowercased()
			next

		ok

		# Doing the job

		acSeen = []
		acResult = []
		anPos = []

		for i = 1 to nLen

			n = ring_find(acSeen, acStr[i])

			if n = 0
				acSeen + acStr[i]
				acResult + acStr[i]
				anPos + i

			else
				nPos = ring_find(acResult, acStr[i])

				if nPos > 0
					ring_del(acResult, nPos)
					ring_del(anPos, nPos)
				ok

			ok

		next

		aResult = []
		nLen = len(anPos)

		for i = 1 to nLen
			aResult + aContent[anPos[i]]
		next

		return aResult


		#< @FunctionAlternativeForms

		def NonDuplicatesCS(pCaseSensitive)
			return This.NonDuplicatedItemsCS(pCaseSensitive)

		def UnduplicatedItemsCS(pCaseSensitive)
			return This.NonDuplicatedItemsCS(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def NonDuplicatedItems()
		return This.NonDuplicatedItemsCS(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def NonDuplicates()
			return This.NonDuplicatedItems()

		def UnduplicatedItems()
			return This.NonDuplicatedItems()

		#>

	  #----------------------------------#
	 #  NUMBER OF NON DUPLICATED ITEMS  #
	#----------------------------------#

	def NumberOfNonDuplicatedItemsCS(pCaseSensitive)
		nResult = len(This.NonDuplicatedItemsCS(pCaseSensitive))
		return nResult

		#< @FunctionAlternativeForms

		def NumberOfNonDuplicatesCS(pCaseSensitive)
			return This.NumberOfNonDuplicatedItemsCS(pCaseSensitive)

		def NumberOfUnduplicatedItemsCS(pCaseSensitive)
			return This.NumberOfNonDuplicatedItemsCS(pCaseSensitive)

		#--

		def HowManyNonDuplicatedItemCS(pCaseSensitive)
			return This.NumberOfNonDuplicatedItemsCS(pCaseSensitive)

		def HowManyNonDuplicatedItemsCS(pCaseSensitive)
			return This.NumberOfNonDuplicatedItemsCS(pCaseSensitive)

		#--

		def HowManyNonDuplicatesCS(pCaseSensitive)
			return This.NumberOfNonDuplicatedItemsCS(pCaseSensitive)

		def HowManyNonDuplicateCS(pCaseSensitive)
			return This.NumberOfNonDuplicatedItemsCS(pCaseSensitive)

		#--

		def HowManyUnduplicatedItemsCS(pCaseSensitive)
			return This.NumberOfNonDuplicatedItemsCS(pCaseSensitive)

		def HowManyUnduplicatedItemCS(pCaseSensitive)
			return This.NumberOfNonDuplicatedItemsCS(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def NumberOfNonDuplicatedItems()
		return This.NumberOfNonDuplicatedItemsCS(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def NumberOfNonDuplicates()
			return This.NumberOfNonDuplicatedItems()

		def NumberOfUnduplicatedItems()
			return This.NumberOfNonDuplicatedItems()

		#--

		def HowManyNonDuplicatedItem()
			return This.NumberOfNonDuplicatedItems()

		def HowManyNonDuplicatedItems()
			return This.NumberOfNonDuplicatedItems()

		#--

		def HowManyNonDuplicates()
			return This.NumberOfNonDuplicatedItems()

		def HowManyNonDuplicate()
			return This.NumberOfNonDuplicatedItems()

		#--

		def HowManyUnduplicatedItems()
			return This.NumberOfNonDuplicatedItems()

		def HowManyUnduplicatedItem()
			return This.NumberOfNonDuplicatedItems()

		#>

	  #--------------------------------#
	 #  FINDING NON DUPLICATED ITEMS  #
	#--------------------------------#

	def FindNonDuplicatedItemsCS(pCaseSensitive)

		# Checking params

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( pCaseSensitive = TRUE or pCaseSensitive = FALSE )
			StzRais("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return FALSE
		ok


		acStr = []

		# We duplicate the code because we need to manage casesensitivty
		# while relying on the performant native ring_find()

		# We start by stringifying the list (casting all the items in to strings)
		# so we can find not onlu numbers and strings, but also lists,
		# and get relatively beeter performance on larger lists (up to 30K items)


		if pCaseSensitive = TRUE

			for i = 1 to nLen

				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])

				ok

				# Memorising the stringified items so we can used them later
	
				acStr + cItem
			next

		else // pCaseSensitive = FALSE

			for i = 1 to nLen
	
				# Stringifying the item
	
				if isNumber(aContent[i])
					cItem = ""+ aContent[i]
	
				but isString(aContent[i])
					cItem = @@(aContent[i])
	
				but isList(aContent[i])
					cItem = @@(aContent[i])
					
				but isObject(aContent[i])
					cItem = @ObjectVarName(aContent[i])
					
				ok
	
				# Memorising the stringified items so we can used them later
	
				acStr + Q(cItem).Lowercased()
			next

		ok

		# Doing the job

		acSeen = []
		acResult = []
		anResult = []

		for i = 1 to nLen

			n = ring_find(acSeen, acStr[i])

			if n = 0
				acSeen + acStr[i]
				acResult + acStr[i]
				anResult + i

			else
				nPos = ring_find(acResult, acStr[i])

				if nPos > 0
					ring_del(acResult, nPos)
					ring_del(anResult, nPos)
				ok

			ok

		next

		return anResult

		#< @FunctionAlternativeForms

		def FindUndiplicatedItemsCS(pCaseSensitive)
			return This.FindNonDuplicatedItemsCS(pCaseSensitive)

		def FindNonDuplicatesCS(pCaseSensitive)
			return This.FindNonDuplicatedItemsCS(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindNonDuplicatedItems()
		return This.FindNonDuplicatedItemsCS(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindUndiplicatedItems()
			return This.FindNonDuplicatedItems()

		def FindNonDuplicates()
			return This.FindNonDuplicatedItems()

		#>

	  #--------------------------------------------#
	 #  NON DUPLICATED ITEMS AND THEIR POSITIONS  #
	#--------------------------------------------#

	def NonDuplicatedItemsAndTheirPositionsCS(pCaseSensitive)

		aNonDuplicated = This.NonDuplicatedItemsCS(pCaseSensitive)
		nLen = len(aNonDuplicated)

		aResult = []
		for i = 1 to nLen
			# By definition, a non duplicated items appears once
			nPos = This.FindFirstCS(aNonDuplicated[i], pCaseSensitive)
			aResult + [ aNonDuplicated[i], nPos ]
		next

		return aResult

		#< @FunctionAlternativeForms

		def NonDuplicatedItemsCSZ(pCaseSensitive)
			return This.NonDuplicatedItemsAndTheirPositionsCS(pCaseSensitive)

		def UndiplicatedItemsAndTheirPositionsCS(pCaseSensitive)
			return This.NonDuplicatedItemsAndTheirPositionsCS(pCaseSensitive)

		def UndiplicatedItemsCSZ(pCaseSensitive)
			return This.NonDuplicatedItemsAndTheirPositionsCS(pCaseSensitive)

		def NonDuplicatesAndTheirPositionsCS(pCaseSensitive)
			return This.NonDuplicatedItemsAndTheirPositionsCS(pCaseSensitive)

		def NonDuplicatesCSZ(pCaseSensitive)
			return This.NonDuplicatedItemsAndTheirPositionsCS(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def NonDuplicatedItemsAndTheirPositions()
		return This.NonDuplicatedItemsAndTheirPositionsCS(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def NonDuplicatedItemsZ()
			return This.NonDuplicatedItemsAndTheirPositions()

		def UndiplicatedItemsAndTheirPositions()
			return This.NonDuplicatedItemsAndTheirPositions()

		def UndiplicatedItemsZ()
			return This.NonDuplicatedItemsAndTheirPositions()

		def NonDuplicatesAndTheirPositions()
			return This.NonDuplicatedItemsAndTheirPositions()

		def NonDuplicatesZ()
			return This.NonDuplicatedItemsAndTheirPositions()

		#>

	  #-----------------------------------------#
	 #   REMOVING ALL DUPLICATES IN THE LIST   #
	#=========================================#

	def RemoveDuplicatesCS(pCaseSensitive)

		anPos = This.FindDuplicatesCS(pCaseSensitive)
		This.RemoveItemsAtPositions(anPos)

		#< @FunctionAlternativeForms

		def RemoveDuplicatesCSQ(pCaseSensitive)
			This.RemoveDuplicatesCS(pCaseSensitive)
			return This

		def RemoveDuplicatedItemsCS(pCaseSensitive)
			This.RemoveDuplicatesCS(pCaseSensitive)

			def RemoveDuplicatedItemsCSQ(pCaseSensitive)
				This.RemoveDuplicatedItemsCS(pCaseSensitive)
				return This

		def RemoveDuplicationsCS(pCaseSensitive)
			This.RemoveDuplicatesCS(pCaseSensitive)

			def RemoveDuplicationsCSQ(pCaseSensitive)
				This.RemoveDuplicationsCS(pCaseSensitive)
				return This

		def RemoveDuplicationCS(pCaseSensitive)
			This.RemoveDuplicatesCS(pCaseSensitive)

			def RemoveDuplicationCSQ(pCaseSensitive)
				This.RemoveDuplicationCS(pCaseSensitive)
				return This

		#>

	def DuplicatesRemovedCS(pCaseSensitive)
		aResult = This.Copy().RemoveDuplicatesCSQ(pCaseSensitive).Content()
		return aResult

		#< @FunctionAlternativeForms

		def ToSetCS(pCaseSensitive)
			return This.DuplicatesRemovedCS(pCaseSensitive)

		def ToSetOfItemsCS(pCaseSensitive)
			return This.DuplicatesRemovedCS(pCaseSensitive)

		def UniqueItemsCS(pCaseSensitive)
			return This.DuplicatesRemovedCS(pCaseSensitive)

		def ItemsUCS(pCaseSensitive)
			return This.DuplicatesRemovedCS(pCaseSensitive)

		def ItemsWithoutDuplicationCS(pCaseSensitive)
			return This.DuplicatesRemovedCS(pCaseSensitive)

		def DuplicatedItemsRemovedCS(pCaseSensitive)
			return This.DuplicatesRemovedCS(pCaseSensitive)

		def DuplicationsRemovedCS(pCaseSensitive)
			return This.DuplicatesRemovedCS(pCaseSensitive)

		def DuplicationRemovedCS(pCaseSensitive)
			return This.DuplicatesRemovedCS(pCaseSensitive)


		#>

	#-- WITHOUT CASESENSITIVITY

	def RemoveDuplicates()
		This.RemoveDuplicatesCS(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def RemoveDuplicatesQ()
			This.RemoveDuplicates()
			return This

		def RemoveDuplicatedItems()
			This.RemoveDuplicates()

			def RemoveDuplicatedItemsQ()
				This.RemoveDuplicatedItems()
				return This

		def RemoveDuplications()
			This.RemoveDuplicates()

			def RemoveDuplicationsQ()
				This.RemoveDuplications()
				return This

		def RemoveDuplication()
			This.RemoveDuplicates()

			def RemoveDuplicationQ()
				This.RemoveDuplications()
				return This


		#>

	def DuplicatesRemoved()
		aResult = This.Copy().RemoveDuplicatesQ().Content()
		return aResult

		#< @FunctionAlternativeForms

		def ToSet()
			return This.DuplicatesRemoved()

			def ToSetQ()
				return This.ToSetQR(:stzList)
			
			def ToSetQR(pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.ToSet() )

				on :stzSet
					return new stzSet( This.ToSet() )

				other
					StzRaise("Unsupported return type!")
				off

		def ToSetOfItems()
			return This.DuplicatesRemoved()

			def ToSetOfItemsQ()
				return This.ToSetQR(:stzList)
			
			def ToSetOfItemsQR(pcReturnType)
				return This.ToSetQR(pcReturnType)

		def UniqueItems()
			return This.DuplicatesRemoved()

			def UniqueItemsQ()
				return This.ToSetQR(:stzList)
			
			def UniqueItemsQR(pcReturnType)
				return This.ToSetQR(pcReturnType)

		def ItemsU()
			return This.DuplicatesRemoved()

			def ItemsUQ()
				return This.ToSetQR(:stzList)
			
			def ItemsUQR(pcReturnType)
				return This.ToSetQR(pcReturnType)

		def WithoutDuplicates()
			return This.DuplicatesRemoved()

		def WithoutDuplication()
			return This.DuplicatesRemoved()

			def WithoutDuplicationQ()
				return This.ToSetQR(:stzList)

			def WithoutDuplicationQR(pcReturnType)
				return This.ToSetQR(pcReturnType)

		def WithoutDuplications()
			return This.DuplicatesRemoved()

			def WithoutDuplicationsQ()
				return This.ToSetQR(:stzList)

			def WithoutDuplicationsQR(pcReturnType)
				return This.ToSetQR(pcReturnType)

		def ItemsWithoutDuplication()
			return This.DuplicatesRemoved()

			def ItemsWithoutDuplicationQ()
				return This.ToSetQR(:stzList)

			def ItemsWithoutDuplicationQR(pcReturnType)
				return This.ToSetQR(pcReturnType)

		def ItemsWithoutDuplications()
			return This.DuplicatesRemoved()

			def ItemsWithoutDuplicationsQ()
				return This.ToSetQR(:stzList)

			def ItemsWithoutDuplicationsQR(pcReturnType)
				return This.ToSetQR(pcReturnType)

		def DuplicatedItemsRemoved()
			return This.DuplicatesRemoved()

			def DuplicatedItemsRemovedQ()
				return This.ToSetQR(:stzList)

			def DuplicatesItemsRemovedQR(pcReturnType)
				return This.ToSetQR(pcReturnType)

		def DuplicationsRemoved()
			return This.DuplicatesRemoved()

			def DuplicationsRemovedQ()
				return This.ToSetQR(:stzList)

			def DuplicationsRemovedQR(pcReturnType)
				return This.ToSetQR(pcReturnType)

		def DuplicationRemoved()
			return This.DuplicatesRemoved()

			def DuplicationRemovedQ()
				return This.ToSetQR(:stzList)

			def DuplicationRemovedQR(pcReturnType)
				return This.ToSetQR(pcReturnType)

		#>

  	  #-----------------------------------------#
	 #   REMOVING DUPLICATES OF A GIVEN ITEM   #
	#-----------------------------------------#

	def RemoveDuplicatesOfItemCS(pItem, pCaseSensitive)
		anPositions = This.FindDuplicatesOfItemCS(pItem, pCaseSensitive)
		This.RemoveItemsAtPositions(anPositions)

		#< @FunctionFluentForm

		def RemoveDuplicatesOfItemCSQ(pItem, pCaseSensitive)
			This.RemoveDuplicatesOfItemCS(pItem, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForm

		def RemoveDuplicatesOfThisItemCS(pItem, pCaseSensitive)
			This.RemoveDuplicatesOfItemCS(pItem, pCaseSensitive)

			def RemoveDuplicatesOfThisItemCSQ(pItem, pCaseSensitive)
				This.RemoveDuplicatesOfThisItemCS(pItem, pCaseSensitive)
				return This

		def RemoveDuplicationsOfItemCS(pItem, pCaseSensitive)
			This.RemoveDuplicatesOfItemCS(pItem, pCaseSensitive)

			def RemoveDuplicationsOfItemCSQ(pItem, pCaseSensitive)
				This.RemoveDuplicationsOfItemCS(pItem, pCaseSensitive)
				return This

		def RemoveDuplicationOfItemCS(pItem, pCaseSensitive)
			This.RemoveDuplicatesOfItemCS(pItem, pCaseSensitive)

			def RemoveDuplicationOfItemCSQ(pItem, pCaseSensitive)
				This.RemoveDuplicationsOfItemCS(pItem, pCaseSensitive)
				return This

		def RemoveDuplicatesOfCS(pItem, pCaseSensitive)
			if isList(pItem)
				This.RemoveDuplicatesOfItemsCS(pItem, pCaseSensitive)

			else
				This.RemoveDuplicatesOfItemCS(pItem, pCaseSensitive)
			ok

			def RemoveDuplicatesOfCSQ(pItem, pCaseSensitive)
				This.RemoveDuplicatesOfCS(pItem, pCaseSensitive)
				return This

		def RemoveDuplicationsOfCS(pItem, pCaseSensitive)
			This.RemoveDuplicatesOfCS(pItem, pCaseSensitive)

			def RemoveDuplicationsOfCSQ(pItem, pCaseSensitive)
				This.RemoveDuplicationsOfCS(pItem, pCaseSensitive)
				return This

		def RemoveDuplicationOfCS(pItem, pCaseSensitive)
			This.RemoveDuplicatesOfCS(pItem, pCaseSensitive)

			def RemoveDuplicationOfCSQ(pItem, pCaseSensitive)
				This.RemoveDuplicationsOfCS(pItem, pCaseSensitive)
				return This

		#>

	def DuplicatesOfItemRemovedCS(pItem, pCaseSensitive)

		aResult = This.Copy().
				RemoveDuplicatesOfItemCSQ(pItem, pCaseSensitive).
				Content()

		return aResult

		#< @FunctionAlternativeForm

		def DuplicatesOfThisItemRemovedCS(pItem, pCaseSensitive)
			return This.DuplicatesOfItemRemovedCS(pItem, pCaseSensitive)

		def DuplicationsOfItemRemovedCS(pItem, pCaseSensitive)
			return This.DuplicatesOfItemRemovedCS(pItem, pCaseSensitive)

		def DuplicationsOfThisItemRemovedCS(pItem, pCaseSensitive)
			return This.DuplicatesOfItemRemovedCS(pItem, pCaseSensitive)

		def DuplicationOfItemRemovedCS(pItem, pCaseSensitive)
			return This.DuplicatesOfItemRemovedCS(pItem, pCaseSensitive)

		def DuplicationOfThisItemRemovedCS(pItem, pCaseSensitive)
			return This.DuplicatesOfItemRemovedCS(pItem, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def RemoveDuplicatesOfItem(pItem)
		This.RemoveDuplicatesOfItemCS(pItem, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RemoveDuplicatesOfItemQ(pItem)
			This.RemoveDuplicatesOfItem(pItem)
			return This

		#>

		#< @FunctionAlternativeForm

		def RemoveDuplicatesOfThisItem(pItem)
			This.RemoveDuplicatesOfItem(pItem)

			def RemoveDuplicatesOfThisItemQ(pItem)
				This.RemoveDuplicatesOfThisItem(pItem)
				return This

		def RemoveDuplicationsOfItem(pItem)
			This.RemoveDuplicatesOfItem(pItem)

			def RemoveDuplicationsOfItemQ(pItem)
				This.RemoveDuplicationsOfItem(pItem)
				return This

		def RemoveDuplicatesOf(pItem)
			This.RemoveDuplicatesOfCS(pItem, :CaseSensitive = TRUE)

			def RemoveDuplicatesOfQ(pItem)
				This.RemoveDuplicatesOf(pItem)
				return This

		def RemoveDuplicationsOf(pItem)
			This.RemoveDuplicatesOf(pItem)

			def RemoveDuplicationsOfQ(pItem)
				This.RemoveDuplicationsOf(pItem)
				return This

		def RemoveDuplicationOf(pItem)
			This.RemoveDuplicatesOf(pItem)

			def RemoveDuplicationOfQ(pItem)
				This.RemoveDuplicationsOf(pItem)
				return This

		#>

	def DuplicatesOfItemRemoved(pItem)
		return This.DuplicatesOfItemRemovedCS(pItem, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def DuplicatesOfThisItemRemoved(pItem)
			return This.DuplicatesOfItemRemoved(pItem)

		def DuplicationsOfItemRemoved(pItem)
			return This.DuplicatesOfItemRemoved(pItem)

		def DuplicationsOfThisItemRemoved(pItem)
			return This.DuplicatesOfItemRemoved(pItem)

		def DuplicationOfItemRemoved(pItem)
			return This.DuplicatesOfItemRemoved(pItem)

		def DuplicationOfThisItemRemoved(pItem)
			return This.DuplicatesOfItemRemoved(pItem)


		#>

	  #---------------------------------------------#
	 #   REMOVING DUPLICATES OF MANY GIVEN ITEMS   #
	#---------------------------------------------#

	def RemoveDuplicatesOfItemsCS(paItems, pCaseSensitive)

		if NOT isList(paItems)
			StzRaise("Incorrect param! paItems must be a list.")
		ok

		nLen = len(paItems)

		for i = 1 to nLen
			This.RemoveDuplicatesOfItemCS(paItems[i], pCaseSensitive)
		next

		#< @FuntionFluentForm

		def RemoveDuplicatesOfItemsCSQ(paItems, pCaseSensitive)
			This.RemoveDuplicatesOfItemsCS(paItems, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForms

		def  RemoveDuplicatesOfTheseItemsCS(paItems, pCaseSensitive)
			This.RemoveDuplicatesOfItemsCS(paItems, pCaseSensitive)

			def RemoveDuplicatesOfTheseItemsCSQ(paItems, pCaseSensitive)
				This.RemoveDuplicatesOfTheseItemsCS(paItems, pCaseSensitive)
				return This

		def  RemoveDuplicationsOfItemsCS(paItems, pCaseSensitive)
			This.RemoveDuplicatesOfItemsCS(paItems, pCaseSensitive)

			def RemoveDuplicationsOfItemsCSQ(paItems, pCaseSensitive)
				This.RemoveDuplicationsOfItemsCS(paItems, pCaseSensitive)
				return This

		def  RemoveDuplicationsOfTheseItemsCS(paItems, pCaseSensitive)
			This.RemoveDuplicatesOfItemsCS(paItems, pCaseSensitive)

			def RemoveDuplicationsOfTheseItemsCSQ(paItems, pCaseSensitive)
				This.RemoveDuplicationsOfTheseItemsCS(paItems, pCaseSensitive)
				return This

		def  RemoveDuplicationOfItemsCS(paItems, pCaseSensitive)
			This.RemoveDuplicatesOfItemsCS(paItems, pCaseSensitive)

			def RemoveDuplicationOfItemsCSQ(paItems, pCaseSensitive)
				This.RemoveDuplicationsOfItemsCS(paItems, pCaseSensitive)
				return This

		def  RemoveDuplicationOfTheseItemsCS(paItems, pCaseSensitive)
			This.RemoveDuplicatesOfItemsCS(paItems, pCaseSensitive)

			def RemoveDuplicationOfTheseItemsCSQ(paItems, pCaseSensitive)
				This.RemoveDuplicationsOfTheseItemsCS(paItems, pCaseSensitive)
				return This

		#--

		def  RemoveDuplicatesOfManyItemsCS(paItems, pCaseSensitive)
			This.RemoveDuplicatesOfItemsCS(paItems, pCaseSensitive)

			def RemoveDuplicatesOfManyItemsCSQ(paItems, pCaseSensitive)
				This.RemoveDuplicatesOfManyItemsCS(paItems, pCaseSensitive)
				return This

		def  RemoveDuplicationsOfManyItemsCS(paItems, pCaseSensitive)
			This.RemoveDuplicatesOfItemsCS(paItems, pCaseSensitive)

			def RemoveDuplicationsOfManyItemsCSQ(paItems, pCaseSensitive)
				This.RemoveDuplicationsOfManyItemsCS(paItems, pCaseSensitive)
				return This

		def  RemoveDuplicationOfManyItemsCS(paItems, pCaseSensitive)
			This.RemoveDuplicatesOfItemsCS(paItems, pCaseSensitive)

			def RemoveDuplicationOfManyItemsCSQ(paItems, pCaseSensitive)
				This.RemoveDuplicationsOfManyItemsCS(paItems, pCaseSensitive)
				return This


		#>
		
	def DuplicatesOfItemsRemovedCS(paItems, pCaseSensitive)

		aResult = This.Copy().
				RemoveDuplicatesOfItemsCSQ(paItems, pCaseSensitive).
				Content()

		return aResult

		#< @FunctionAlternativeForm

		def DuplicatesOfTheseItemsRemovedCS(paItems, pCaseSensitive)
			return This.DuplicatesOfItemsRemovedCS(paItems, pCaseSensitive)

		def DuplicationsOfItemsRemovedCS(paItems, pCaseSensitive)
			return This.DuplicatesOfItemsRemovedCS(paItems, pCaseSensitive)

		def DuplicationsOfTheseItemsRemovedCS(paItems, pCaseSensitive)
			return This.DuplicatesOfItemsRemovedCS(paItems, pCaseSensitive)

		def DuplicationOfItemsRemovedCS(paItems, pCaseSensitive)
			return This.DuplicatesOfItemsRemovedCS(paItems, pCaseSensitive)

		def DuplicationOfTheseItemsRemovedCS(paItems, pCaseSensitive)
			return This.DuplicatesOfItemsRemovedCS(paItems, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def RemoveDuplicatesOfItems(paItems)
		This.RemoveDuplicatesOfItemsCS(paItems, :CaseSensitive = TRUE)

		#< @FuntionFluentForm

		def RemoveDuplicatesOfItemsQ(paItems)
			This.RemoveDuplicatesOfItems(paItems)
			return This

		#>

		#< @FunctionAlternativeForms

		def  RemoveDuplicatesOfTheseItems(paItems)
			This.RemoveDuplicatesOfItems(paItems)

			def RemoveDuplicatesOfTheseItemsQ(paItems)
				This.RemoveDuplicatesOfTheseItems(paItems)
				return This

		def  RemoveDuplicationsOfItems(paItems)
			This.RemoveDuplicatesOfItems(paItems)

			def RemoveDuplicationsOfItemsQ(paItems)
				This.RemoveDuplicationsOfItems(paItems)
				return This

		def  RemoveDuplicationsOfTheseItems(paItems)
			This.RemoveDuplicatesOfItems(paItems)

			def RemoveDuplicationsOfTheseItemsQ(paItems)
				This.RemoveDuplicationsOfTheseItems(paItems)
				return This

		def  RemoveDuplicationOfTheseItems(paItems)
			This.RemoveDuplicatesOfItems(paItems)

			def RemoveDuplicationOfTheseItemsQ(paItems)
				This.RemoveDuplicationsOfTheseItems(paItems)
				return This


		#--

		def  RemoveDuplicatesOfManyItems(paItems)
			This.RemoveDuplicatesOfItems(paItems)

			def RemoveDuplicatesOfManyItemsQ(paItems)
				This.RemoveDuplicatesOfManyItems(paItems)
				return This

		def  RemoveDuplicationsOfManyItems(paItems)
			This.RemoveDuplicatesOfItems(paItems)

			def RemoveDuplicationsOfManyItemsQ(paItems)
				This.RemoveDuplicationsOfManyItems(paItems)
				return This

		def  RemoveDuplicationOfManyItems(paItems)
			This.RemoveDuplicatesOfItems(paItems)

			def RemoveDuplicationOfManyItemsQ(paItems)
				This.RemoveDuplicationsOfManyItems(paItems)
				return This

		#>

	def DuplicatesOfItemsRemoved(paItems)
		return This.DuplicatesOfItemsRemovedCS(paItems, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def DuplicatesOfTheseItemsRemoved(paItems)
			return This.DuplicatesOfItemsRemoved(paItems)

		def DuplicationsOfItemsRemoved(paItems)
			return This.DuplicatesOfItemsRemoved(paItems)

		def DuplicationsOfTheseItemsRemoved(paItems)
			return This.DuplicatesOfItemsRemoved(paItems)

		def DuplicationOfItemsRemoved(paItems)
			return This.DuplicatesOfItemsRemoved(paItems)

		def DuplicationOfTheseItemsRemoved(paItems)
			return This.DuplicatesOfItemsRemoved(paItems)

		#>

	  #-----------------------------------------#
	 #   REMOVING NON DUPLICATES IN THE LIST   #
	#=========================================#

	def RemoveNonDuplicatesCS(pCaseSensitive)

		anPos = This.FindNonDuplicatesCS(pCaseSensitive)
		This.RemoveItemsAtPositions(anPos)

		#< @FunctionAlternativeForms

		def RemoveNonDuplicatesCSQ(pCaseSensitive)
			This.RemoveNonDuplicatesCS(pCaseSensitive)
			return This

		def RemoveNonDuplicatedItemsCS(pCaseSensitive)
			This.RemoveNonDuplicatesCS(pCaseSensitive)

			def RemoveNonDuplicatedItemsCSQ(pCaseSensitive)
				This.RemoveNonDuplicatedItemsCS(pCaseSensitive)
				return This

		def RemoveNonDuplicationsCS(pCaseSensitive)
			This.RemoveNonDuplicatesCS(pCaseSensitive)

			def RemoveNonDuplicationsCSQ(pCaseSensitive)
				This.RemoveNonDuplicationsCS(pCaseSensitive)
				return This

		def RemoveNonDuplicationCS(pCaseSensitive)
			This.RemoveNonDuplicatesCS(pCaseSensitive)

			def RemoveNonDuplicationCSQ(pCaseSensitive)
				This.RemoveNonDuplicationCS(pCaseSensitive)
				return This

		#>

	def NonDuplicatesRemovedCS(pCaseSensitive)
		aResult = This.Copy().RemoveNonDuplicatesCSQ(pCaseSensitive).Content()
		return aResult

		#< @FunctionAlternativeForms

		def NonDuplicatedItemsRemovedCS(pCaseSensitive)
			return This.NonDuplicatesRemovedCS(pCaseSensitive)

		def NonDuplicationsRemovedCS(pCaseSensitive)
			return This.NonDuplicatesRemovedCS(pCaseSensitive)

		def NonDuplicationRemovedCS(pCaseSensitive)
			return This.NonDuplicatesRemovedCS(pCaseSensitive)


		#>

	#-- WITHOUT CASESENSITIVITY

	def RemoveNonDuplicates()
		This.RemoveNonDuplicatesCS(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def RemoveNonDuplicatesQ()
			This.RemoveNonDuplicates()
			return This

		def RemoveNonDuplicatedItems()
			This.RemoveNonDuplicates()

			def RemoveNonDuplicatedItemsQ()
				This.RemoveNonDuplicatedItems()
				return This

		def RemoveNonDuplications()
			This.RemoveNonDuplicates()

			def RemoveNonDuplicationsQ()
				This.RemoveNonDuplications()
				return This

		def RemoveNonDuplication()
			This.RemoveNonDuplicates()

			def RemoveNonDuplicationQ()
				This.RemoveNonDuplications()
				return This

		#>

	def NonDuplicatesRemoved()
		aResult = This.Copy().RemoveNonDuplicatesQ().Content()
		return aResult

		#< @FunctionAlternativeForms

		def NonDuplicatedItemsRemoved()
			return This.NonDuplicatesRemoved()

		def NonDuplicationsRemoved()
			return This.NonDuplicatesRemoved()

		def NonDuplicationRemoved()
			return This.NonDuplicatesRemoved()


		#>

	  #====================#
	 #     CONTAINMENT    #
	#====================#
	/*
		Review the function namings and make the same semantics
		here and in stzString class.
	*/

	  #----------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS A GIVEN ITEM  #
	#----------------------------------------------#

	def ContainsCS(pItem, pCaseSensitive)

		if This.FindFirstCS(pItem, pCaseSensitive) > 0
			return TRUE
		else
			return FALSE
		ok

		#< @FunctionAlternativeForm

		def ContainsItemCS(pItem, pCaseSensitive)
			return This.ContainsCS(pItem, pCaseSensitive)

			def ContainsNoItemCS(pItem, pCaseSensitive)
				return NOT This.ContainsItemCS(pItem, pCaseSensitive)
	
		#>

		#< @FunctionNegativeForm
	
		def ContainsNoCS(pItem, pCaseSensitive)
			return NOT This.ContainsCS(pItem, pCaseSensitive)

		def ContainsNoneOfTheseCS(paItems, pCaseSensitive)
			bResult = TRUE
			nLen = len(paItems)
			for i = 1 to nLen
				if This.ContainsCS(paItems[i], pCaseSensitive)
					bResult = FALSE
					exit
				ok
			next
			return bRersult

		def ContainsNeitherCS(pItem1, pItem2, pCaseSensitive)
			if isList(pItem2) and Q(pItem2).IsNorNamedParam()
				pItem2 = pItem2[2]
			ok

			return This.ContainsNoneOfTheseCS([pItem1, pItem2], pCaseSensitive)

		#>

		#< @FunctionMisspelledForm
	
		def CottainsCS(pItem, pCaseSensitive)
			return This.ContainsCS(pItem, pCaseSensitive)

		def ConttainsCS(pItem, pCaseSensitive)
			return This.ContainsCS(pItem, pCaseSensitive)

		#>


	#-- WITHOUT CASESENSITIVITY

	def Contains(pItem)
		return This.ContainsCS(pItem, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def ContainsItem(pItem)
			return This.Contains(pItem)

			def ContainsNoItem(pItem)
				return NOT This.ContainsItem(pItem)
	
		#>

		#< @FunctionNegativeForm
	
		def ContainsNo(pItem)
			return NOT This.Contains(pItem)

		def ContainsNoneOfThese(paItems)
			bResult = TRUE
			nLen = len(paItems)
			for i = 1 to nLen
				if This.Contains(paItems[i])
					bResult = FALSE
					exit
				ok
			next
			return bRersult

		def ContainsNeither(pItem1, pItem2)
			if isList(pItem2) and Q(pItem2).IsNorNamedParam()
				pItem2 = pItem2[2]
			ok

			return This.ContainsNoneOfThese([pItem1, pItem2])

		#>

		#< @FunctionMisspelledForm
	
		def Cottains(pItem)
			return This.Contains(pItem)

		def Conttains(pItem)
			return This.ContainsCS(pItem)

		#>

	  #---------------------------#
	 #  CONDITIONAL CONTAINMENT  #
	#---------------------------#

	def ContainsW(pcCondition)

		cCode = 'bOk = (' + StzCCodeQ(pcCondition).Transpiled() + ')'
		nLen = This.NumberOfItems()

		bResult = FALSE

		for @i = 1 to nLen
			eval(cCode)
			if bOk
				bResult = TRUE
				exit
			ok
		next

		return bResult

	  #-------------------------------------------------------------#
	 #  CHECKING IF THE LIST IS CONTAINED IN A GIVEN LIST OR ITEM  #
	#-------------------------------------------------------------#

	def IsContainedInCS(p, pCaseSensitive)

		bResult = FALSE

		switch ring_type(p)
		on "LIST"	
			bResult = Q(p).ContainsCS( This.List(), pCaseSensitive )

		on "STRING"
			cListStringified = This.Stringified()
			bResult = StzStringQ(p).ContainsCS(cListStringified, pCaseSensitive)

		other
			# For now, number and object type are not concerned
			StzRaise("Unsupported type!")
		off

		return bResult

		#< @FunctionAlternativeForm

		def ExistsInCS(p, pCaseSensitive)
			return This.IsContainedInCS(p, pCaseSensitive)

		def IsIncludedInCS(p, pCaseSensitive)
			return This.IsContainedInCS(p, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def IsContainedIn(p)
		return This.IsContainedInCS(p, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ExistsIn(p)
			return This.IsContainedIn(p)

		def IsIncludedIn(p)
			return This.IsContainedIn(p)

		#>

	  #--------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS BOTH GIVEN ITEMS  #
	#--------------------------------------------------#

	def ContainsBothCS(pItem1, pItem2, pCaseSensitive)
		if isList(pItem2) and Q(pItem2).IsAndNamedParam()
			pItem2 = pItem2[2]
		ok

		return This.ContainsEachCS( [pItem1, pItem2], pCaseSensitive )

	#-- WITHOUT CASESENSITIVITY

	def ContainsBoth(pItem1, pItem2)
		return This. ContainsBothCS(pItem1, pItem2, :CaseSensitive = TRUE)

	  #--------------------------------------------------------------------#
	 #  CHECKING IF EACH ONE OF THE GIVEN ITEMS EXISTS IN THE GIVEN LIST  #
	#--------------------------------------------------------------------#
	
	def EachItemExistsInCS(paOtherList, pCaseSensitive)

		bResult = StzListQ(paOtherList).ContainsEachCS(This.List(), pCaseSensitive)

		return bResult

		#< @FunctionAlternativeForms

		def ItemsExistInCS(paOtherList, pCaseSensitive)
			return This.EachItemExistsInCS(paOtherList, pCaseSensitive)

		def AllItemsExistInCS(paOtherList, pCaseSensitive)
			return This.EachItemExistsIn(paOtherList, pCaseSensitive)

		def EachExistsInCS(paOtherList, pCaseSensitive)
			return This.EachItemExistsInCS(paOtherList, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVI

	def EachItemExistsIn(paOtherList)
		return This.EachItemExistsInCS(paOtherList, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ItemsExistIn(paOtherList)
			return This.EachItemExistsIn(paOtherList)

		def AllItemsExistIn(paOtherList)
			return This.EachItemExistsIn(paOtherList)

		def EachExistsIn(paOtherList)
			return This.EachItemExistsIn(paOtherList)

		#>

	  #------------------------------------------------------------#
	 #  CHECKING IF THE LIST IS ONE OF THE ITEMS OF A GIVEN LIST  #
	#------------------------------------------------------------#

	def IsOneOfTheseCS(paOtherList, pCaseSensitive)
		bResult = StzListQ(paOtherList).ContainsCS( This.List(), pCaseSensitive )
		return bResult

		def IsNotOneOfTheseCS(paOtherList, pCaseSensitive)
			return NOT This.IsOneOfTheseCS(paOtherList, pCaseSensitive)
	
	#-- WITHOUT CASESENSITIVITY

	def IsOneOfThese(paOtherList)
		return This.IsOneOfTheseCS(paOtherList, :CaseSensitive = TRUE)

		def IsNotOneOfThese(paOtherList)
			return NOT This.IsOneOfThese(paOtherList)

	  #------------------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS EACH OF THE PROVIDED ITEMS  #
	#------------------------------------------------------------#

	def ContainsManyCS(paItems, pCaseSensitive)
		
		if NOT isList(paItems)
			StzRaise("Incorrect param type! paItems must be a list.")
		ok

		bResult = TRUE
		aContent = This.Content()
		nLen = len(aContent)

		for i = 1 to nLen
			if NOT This.ContainsCS(aContent[i], pCaseSensitive)
				bResult = FALSE
				exit
			ok
		end

		return bResult

		#< @FunctionAlternativeForms

		def IsMadeOfCS(paSetOfItems, pCaseSensitive)
			return This.ContainsManyCS(paSetOfItems, pCaseSensitive)

		def IsMadeOfTheseCS(paSetOfItems, pCaseSensitive)
			return This.ContainsManyCS(paSetOfItems, pCaseSensitive)

		def ContainsTheseCS(paSetOfItems, pCaseSensitive)
			return This.ContainsManyCS(paSetOfItems, pCaseSensitive)

		def ContainsEachCS(paSetOfItems, pCaseSensitive)
			return This.ContainsManyCS(paSetOfItems, pCaseSensitive)

		def ContainsEachOneOfTheseCS(paItems, pCaseSensitive)
			return This.ContainsManyCS(paSetOfItems, pCaseSensitive)

		def ContainsAllCS(paItems, pCaseSensitive)
			return This.ContainsManyCS(paSetOfItems, pCaseSensitive)

		def ContaisTheseCS(paSetOfItems, pCaseSensitive)
			return This.ContainsManyCS(paSetOfItems, pCaseSensitive)

		def ContaisAllTheseCS(paSetOfItems, pCaseSensitive)
			return This.ContainsManyCS(paSetOfItems, pCaseSensitive)


		#>

		#< @FunctionNagationForm

		def ContainsNoOneCS(paItems, pCaseSensitive)
			return NOT This.ContainsEachCS(paItems, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def ContainsMany(paSetOfItems)
		return This.ContainsManyCS(paSetOfItems, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def IsMadeOf(paSetOfItems)
			return This.ContainsMany(paSetOfItems)

		def IsMadeOfThese(paSetOfItems)
			return This.ContainsMany(paSetOfItems)

		def ContainsThese(paSetOfItems)
			return This.ContainsMany(paSetOfItems)

		def ContainsEach()
			return This.ContainsMany(paSetOfItems)

		def ContainsEachOneOfThese(paItems)
			return This.ContainsMany(paSetOfItems)

		def ContainsAll(paItems)
			return This.ContainsMany(paSetOfItems)

		def ContaisThese(paSetOfItems)
			return This.ContainsMany(paSetOfItems)

		def ContaisAllThese(paSetOfItems)
			return This.ContainsMany(paSetOfItems)


		#>

		#< @FunctionNagationForm

		def ContainsNoOne()
			return NOT This.ContainsEach(paItems)

		#>

	  #------------------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS SOME OF THE PROVIDED ITEMS  #
	#------------------------------------------------------------#

	def ContainsSomeCS(paItems, pCaseSensitive)
		bResult = FALSE

		for item in paItems
			if This.ContainsCS(item, pCaseSensitive)
				bResult = TRUE
				exit
			ok
		next

		return bResult

		#< @FunctionAlternativeForms

		def IsMadeOfSomeCS(paSetOfItems, pCaseSensitive)
			return This.ContainsSomeCS(paSetOfItems, pCaseSensitive)

		def IsMadeOfSomeOfTheseCS(paSetOfItems, pCaseSensitive)
			return This.ContainsSomeCS(paSetOfItems, pCaseSensitive)

		def IsMadeOfOneOrMoreOfTheseCS(paSetOfItems, pCaseSensitive)
			return This.ContainsSomeCS(paSetOfItems, pCaseSensitive)

		def IsMadeOfOneOrMoreOfCS(paSetOfItems, pCaseSensitive)
			return This.ContainsSomeCS(paSetOfItems, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def ContainsSome(paSetOfItems)
		return This.ContainsSomeCS(paSetOfItems, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def IsMadeOfSome(paSetOfItems)
			return This.ContainsSome(paSetOfItems)

		def IsMadeOfSomeOfThese(paSetOfItems)
			return This.ContainsSome(paSetOfItems)

		def IsMadeOfOneOrMoreOfThese(paSetOfItems)
			return This.ContainsSome(paSetOfItems)

		def IsMadeOfOneOrMoreOf(paSetOfItems)
			return This.ContainsSome(paSetOfItems)

		#>

	  #-----------------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS ANY OF THE PROVIDED ITEMS  #
	#-----------------------------------------------------------#

	def ContainsAnyCS(pSetOfItems, pCaseSensitive)
		/*
		Example:

		o1 = new stzList([ :monday, :monday, :monday ])
		? o1.ContainsAny([ :sunday, :monday, :saturday, :wednesday, :thirsday, :friday, :saturday ])
		#--> TRUE

		*/

		bResult = FALSE

		for item in pSetOfItems
			if This.NumberOfOccurrenceCS(item, pCaseSensitive) = This.NumberOfItems()
				bResult = TRUE
				exit
			ok
		next

		return bResult

		#< @FunctionAlternativeForms

		def ContainsOneOfTheseCS(pSetOfItems, pCaseSensitive)
			return This.ContainsAnyCS(pSetOfItems, pCaseSensitive)

		def ContainsAnyOneOfTheseCS(pSetOfItems, pCaseSensitive)
			return This.ContainsAnyCS(pSetOfItems, pCaseSensitive)

		def ContainsAnyOfTheseCS(pSetOfItems, pCaseSensitive)
			return This.ContainsAnyCS(pSetOfItems, pCaseSensitive)

		def IsMadeOfOneOfTheseCS(pSetOfItems, pCaseSensitive)
			return This.ContainsAnyCS(pSetOfItems, pCaseSensitive)

		def IsMadeOfAnyOfTheseCS(pSetOfItems, pCaseSensitive)
			return This.ContainsAnyCS(pSetOfItems, pCaseSensitive)

		def ContainsOneCS(pSetOfItems, pCaseSensitive)
			return This.ContainsAnyCS(pSetOfItems, pCaseSensitive)

		def ContainsOneOfTheCS(pSetOfItems, pCaseSensitive)
			return This.ContainsAnyCS(pSetOfItems, pCaseSensitive)

		def ContainsAnyOfTheCS(pSetOfItems, pCaseSensitive)
			return This.ContainsAnyCS(pSetOfItems, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def ContainsAny(pSetOfItems)
		return This.ContainsAnyCS(pSetOfItems, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ContainsOneOfThese(pSetOfItems)
			return This.ContainsAny(pSetOfItems)

		def ContainsAnyOneOfThese(pSetOfItems)
			return This.ContainsAny(pSetOfItems)

		def ContainsAnyOfThese(pSetOfItems)
			return This.ContainsAny(pSetOfItems)

		def IsMadeOfOneOfThese(pSetOfItems)
			return This.ContainsAny(pSetOfItems)

		def IsMadeOfAnyOfThese(pSetOfItems)
			return This.ContainsAny(pSetOfItems)

		def ContainsOne(pSetOfItems)
			return This.ContainsAny(pSetOfItems)

		def ContainsOneOfThe(pSetOfItems)
			return This.ContainsAny(pSetOfItems)

		def ContainsAnyOfThe(pSetOfItems)
			return This.ContainsAny(pSetOfItems)

		#>

	  #----------------------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS ONLY ONE OF THE PROVIDED ITEMS  #
	#----------------------------------------------------------------#

	def ContainsOnlyOneCS(paItems, pCaseSensitive)
		bResult = FALSE
		for item in paItems
			if This.IsMadeOfItemCS(item, pCaseSensitive)
				bResult = TRUE
				exit
			ok
		next
		return bResult

		#< @FunctionAlternativeForms

		def ContainsOnlyOneOfTheseCS(paItems, pCaseSensitive)
			return This.ContainsOnlyOneCS(paItems, pCaseSensitive)

		def IsMadeOfOnlyOneOfTheseCS(paItems, pCaseSensitive)
			return This.ContainsOnlyOneCS(paItems, pCaseSensitive)

		def ContainsAnItemFromCS(paItems, pCaseSensitive)
			return This.ContainsOnlyOneCS(paItems, pCaseSensitive)

		def ContainsAnItemFromTheseCS(paItems, pCaseSensitive)
			return This.ContainsOnlyOneCS(paItems, pCaseSensitive)

		def ContainsOneItemFromCS(paItems, pCaseSensitive)
			return This.ContainsOnlyOneCS(paItems, pCaseSensitive)

		def ContainsOneItemFromTheseCS(paItems, pCaseSensitive)
			return This.ContainsOnlyOneCS(paItems, pCaseSensitive)

		def ContainsOnlyOneOfTheCS(paItems, pCaseSensitive)
			return This.ContainsOnlyOneCS(paItems, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def ContainsOnlyOne(paItems)
		return This.ContainsOnlyOneCS(paItems, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ContainsOnlyOneOfThese(paItems)
			return This.ContainsOnlyOne(paItems)

		def IsMadeOfOnlyOneOfThese(paItems)
			return This.ContainsOnlyOne(paItems)

		def ContainsAnItemFrom(paItems)
			return This.ContainsOnlyOne(paItems)

		def ContainsAnItemFromThese(paItems)
			return This.ContainsOnlyOne(paItems)

		def ContainsOneItemFrom(paItems)
			return This.ContainsOnlyOne(paItems)

		def ContainsOneItemFromThese(paItems)
			return This.ContainsOnlyOne(paItems)

		def ContainsOnlyOneOfThe(paItems)
			return This.ContainsOnlyOne(paItems)

		#>

	  #---------------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS N OF THE PROVIDED ITEMS  #
	#---------------------------------------------------------#

	def ContainsNCS(n, paItems, pCaseSensitive)
		bResult = FALSE
		m = 0
		for pItem in paItems
			if This.ContainsCS(pItem, pCaseSensitive)
				m++
				if n = m
					bResult = TRUE
					exit
				ok
			ok
		next

		return bResult

		#< @FunctionAlternativeForms

		def ContainsNOccurrencesOfCS(n, paItems, pCaseSensitive)
			return This.ContainsNCS(n, paItems, pCaseSensitive)

		def ContainsNOccurrencesCS(n, paItems, pCaseSensitive)
			if isList(n) and Q(n).IsOfNamedParam()
				n = n[2]
			ok
			return This.ContainsNCS(n, paItems, pCaseSensitive)

		def ContainsExactlyNCS(n, pItems, pCaseSensitive)
			return This.ContainsNCS(n, paItems, pCaseSensitive)

		def ContainsExactlyNOccurrencesOfCS(n, paItems, pCaseSensitive)
			return This.ContainsNCS(n, paItems, pCaseSensitive)

		def ContainsExactlyNOccurrencesCS(n, paItems, pCaseSensitive)
			if isList(n) and Q(n).IsOfNamedParam()
				n = n[2]
			ok
			return This.ContainsNCS(n, paItems, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def ContainsN(n, paItems)
		return This.ContainsNCS(n, paItems, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ContainsNOccurrencesOf(n, paItems)
			return This.ContainsN(n, paItems)

		def ContainsNOccurrences(n, paItems)
			if isList(n) and Q(n).IsOfNamedParam()
				n = n[2]
			ok
			return This.ContainsN(n, paItems)

		def ContainsExactlyN(n, pItems)
			return This.ContainsN(n, paItems)

		def ContainsExactlyNOccurrencesOf(n, paItems)
			return This.ContainsN(n, paItems)

		def ContainsExactlyNOccurrences(n, paItems)
			if isList(n) and Q(n).IsOfNamedParam()
				n = n[2]
			ok
			return This.ContainsN(n, paItems)

		#>

	  #-------------------------------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS MORE THEN N OCCURRENCES OF A GIVEN ITEM  #
	#-------------------------------------------------------------------------#

	def ContainsMoreThenCS(n, pItem, pCaseSensitive)
		if NOT isNumber(n)
			StzRaise("Incorrect param type! n must be a number.")
		ok

		if This.NumberOfOccurrenceCS(pItem, pCaseSensitive) > n
			return TRUE
		else
			return FALSE
		ok

	#-- WITHOUT CASESENSITIVTY

	def ContainsMoreThen(n, pItem)
		return This.ContainsMoreThen(n, pItem)

	  #-------------------------------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS LESS THEN N OCCURRENCES OF A GIVEN ITEM  #
	#-------------------------------------------------------------------------#

	def ContainsLessThenCS(n, pItem, pCaseSensitive)
		if NOT isNumber(n)
			StzRaise("Incorrect param type! n must be a number.")
		ok

		if This.NumberOfOccurrenceCS(pItem, pCaseSensitive) < n
			return TRUE
		else
			return FALSE
		ok

	#-- WITHOUT CASESENSITIVTY

	def ContainsLessThen(n, pItem)
		return This.ContainsLessThen(n, pItem)

	  #--------------------------------------------------#
	 #  ِCHECKING IF EACH ITEM CONTAINS THE GIVEN VALUE  #
	#--------------------------------------------------#

	def EachContainsCS(pItem, pCaseSensitive)

		/* EXAMPLES

		EXAMPLE 1

		o1 = new stzList([ "ee♥ee", "b♥bbb", "ccc♥", "♥♥" ])
		? o1.EachContains("♥")
		#--> TRUE
		
		EXAMPLE 2

		o1 = new stzList([ ["ee","♥","ee"], ["♥", "bb"], "ccc♥", "♥♥" ])
		? o1.EachContains("♥")
		#--> TRUE
		
		EXAMPLE 3

		o1 = new stzList([ "a♥a" ])
		? o1.EachContains("♥")
		#--> TRUE
		
		EXAMPLE 4

		o1 = new stzList([ 0, "a♥a" ])
		? o1.EachContains("♥")
		#--> FALSE

		*/


		bResult = TRUE

		aContent = This.Content()
		nLen = len(aContent)

		for i = 1 to nLen

			if NOT ( isList(aContent[i]) or isString(aContent[i]) )
				bResult = FALSE
				exit

			else
				bResult = Q(aContent[i]).ContainsCS(pItem, pCaseSensitive)
				if bResult = FALSE
					exit
				ok
			ok
		next

		return bResult

		#< @FunctionAlternativeForm

		def EachItemContainsCS(pItem, pCaseSensitive)
			return This.EachContainsCS(pItem, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def EachContains(pItem)
		return This.EachContainsCS(pItem, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def EachItemContains(pItem)
			return This.EachContains(pItem)

		#>

	  #---------------------------------------------------#
	 #  ِCHECKING IF EACH ITEM CONTAINS THE GIVEN STRING  #
	#---------------------------------------------------#

	def EachContainsTheseCS(paItems, pCaseSensitive)

		bResult = TRUE

		aContent = This.Content()
		nLen = len(aContent)

		for i = 1 to nLen

			if NOT ( isList(aContent[i]) or isString(aContent[i]) )
				bResult = FALSE
				exit

			else

				bResult = Q(aContent[i]).ContainsTheseCS(paItems, pCaseSensitive)
				if bResult = FALSE
					exit
				ok
			ok

		next

		return bResult

		#< @FunctionAlternativeForm

		def EachItemContainsTheseCS(paItems, pCaseSensitive)
			return This.EachContainsTheseCS(paItems, pCaseSensitive)

		def EachItemContainsAllTheseCS(paItems, pCaseSensitive)
			return This.EachContainsTheseCS(paItems, pCaseSensitive)

		def EachItemContainsAllOfTheseCS(paItems, pCaseSensitive)
			return This.EachContainsTheseCS(paItems, pCaseSensitive)

		def EachContainsManyCS(paItems, pCaseSensitive)
			return This.EachContainsTheseCS(paItems, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def EachContainsThese(paItems)
		return This.EachContainsTheseCS(paItems, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def EachItemContainsThese(paItems)
			return This.EachContainsThese(paItems)

		def EachItemContainsAllThese(paItems)
			return This.EachContainsThese(paItems)

		def EachItemContainsAllOfThese(paItems)
			return This.EachContainsThese(paItems)

		def EachContainsMany(paItems)
			return This.EachContainsThese(paItems)

		#>

	  #-----------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS NUMBERS  #
	#=========================================#

	def ContainsNumbers()
		bResult = FALSE

		for item in This.List()
			if isNumber(item)
				bResult = TRUE
				exit
			ok
		next

		return bResult

		def ContainsNoNumbers()
			return NOT This.ContainsNumbers()

	  #-----------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS STRINGS  #
	#-----------------------------------------#

	def ContainsStrings()
		bResult = FALSE

		for item in This.List()
			if isString(item)
				bResult = TRUE
				exit
			ok
		next

		return bResult

		def ContainsNoStrings()
			return NOT This.ContainsStrings()

	  #---------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS LISTS  #
	#---------------------------------------#

	def ContainsLists()
		bResult = FALSE

		for item in This.List()
			if isList(item)
				bResult = TRUE
				exit
			ok
		next

		return bResult

		def ContainsNoLists()
			return NOT This.ContainsLists()

	  #-----------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS OBJECTS  #
	#-----------------------------------------#

	def ContainsObjects()
		for item in This.List()
			if isObject(item)
				return TRUE
			ok
		next

	def ContainsNoObjects()
		return NOT This.ContainsObjects()

	def ContainsObjectsAtSomeLevel() // TODO: Review this risky implementation!
		/*
		This solution is build upon the observation that
		list2code() Ring functions generates empty string
		for objects.

		Hence, list2Code([ 1, 2, "C"]) generates '[1,2,"C"]'
		but:
			o1 = new stzString("C")
			? list2code([ 1, 2, o1, "C"]) generates:

			'[1,2,,"C"]'

		As you can see, we can know that an object exists by
		analyzing list2code() for any generated empty string!

		WARNING: if Ring enhances this function to generate the
		name of the object, for example, then the logic used
		here must change accordingly...
		*/

		oCode = StzStringQ( list2code( This.List() ) )

		if oCode[4] = "," or
		   oCode[ oCode.NumberOfChars()-3 ] = "," or
		   oCode.Contains(",,") or
		   oCode.Contains("[,") or
		   oCode.Contains(",]")

			return TRUE
		else
			return FALSE
		ok
	
	def ContainsNoObjectsAtAnyLevel()
		return NOT This.ContainsObjectsAtSomeLevel()

	def ContainsAtAnyLevel(pItem) # TODO
		// TODO

	  #======================#
	 #    LIST STRUCTURE    #
	#======================#

	/*
	TODO:

	- Reveiew this section (its functions and its semantics)
	- Avoid using _ in names of functions

	- Merge with the next sections:
		LEVELS OF THE LIST, and
		SUBLISTS OF THE LIST --> LISTS IN LEVEL 1 OF THE LIST

	- Ensure they are all consistent and correct

	*/

	def ContainsOneOrMoreLists()
		if This.WalkUntilItemIsList() != NULL
			return TRUE
		else
			return FALSE
		ok

	def FirstList()
		If This.WalkUntilItemIsList() != NULL
			return This.LastItemIn( This.WalkUntilItemIsList() )
		ok

		def FirstListQ()
			return new stzList( This.FirstList() )

	def ListsPaths()
		return This.ItemsThatAreLists_AtAnyLevel_TheirPaths() # TODO: Refactor this!

		def ListsPathsQ()
			return new stzList( This.ListsPaths() )

	def ItemsThatAreLists_AtAnyLevel_TheirPaths()
		aResult = []
		aInfo = This.ItemsThatAreLists_AtAnyLevel_XT()
		for info in aInfo
			aResult + info[1][2]	// GetItemByPath(x,y) : Generalize!!!
		next
		
		return aResult

		def ItemsThatAreLists_AtAnyLevel_TheirPathsQ()
			return new stzList( This.ItemsThatAreLists_AtAnyLevel_TheirPaths() )

	def ItemByPath(panPath)
		if This.ContainsItemOnPath(panPath)
			cCode = "Result = "
			cCode += GenerateListAccessCode_FromNameAndPath("This.Content()", panPath)
			eval(cCode)
			return Result
		ok

		def ItemByPathQ(panPath)
			item = This.ItemByPath(panPath)
			switch ring_type( item )
			on "NUMBER"
				return new stzNumer(""+ item)

			on "STRING"
				return new stzString(item)

			on "LIST"
				return new stzList(item)

			on "OBJECT"
				return new stzObject(item)

			other
				StzRaise("Unsupported type!")
			off

	def Paths()
		// TODO

	def ItemsAndTheirPaths()
		// TODO

	def IncludesPath(panPath)
		return StzListQ( This.Paths() ).Contains(panPath)

	def ContainsItemOnPath(panPath)
		# TODO

	def ContainsListOnPath(panPath)
		try
			cCode = "TempItem = "
			cCode += GenerateListAccessCode_FromNameAndPath("This.Content()",panPath)
	
			eval(cCode)
			if isList(TempItem)
				return TRUE
			else
				return FALSE
			ok
		catch
			return FALSE
			// Report Ring bug: catch region does not consider more then 1 line!
		done

		
	def NumberOfLists_AtAnyLevel()
		return len( This.ItemsThatAreLists_AtAnyLevel_XT() )

	def ItemsThatAreLists_AtAnyLevel()
		aResult = []
		
		for anPath in This.ItemsThatAreLists_AtAnyLevel_TheirPaths()
			
			cPath = "aTempList = "
			cPath += GenerateListAccessCode_FromNameAndPath("This.Content()", anPath)

			eval(cPath)
			aResult + aTempList
		next
		return aResult


	def ItemsThatAreLists_InLevel(n)
		// TODO

	def ItemsThatAreLists_InPositionN_AtAnyLevel(n)
		// TODO

	def ItemsInLevel(n)
		// TODO

	def ItemsInPositionN_AtAnyLevel(n)
		// TODO

	// Returns a stzListOfHashlists:
	// for each list: its path, level and position.
	def ItemsThatAreLists_AtAnyLevel_XT()
		
		aResult = []
		aPath = []

		nLevel = -1
		nPosition = -1

		for c in list2code(This.Content())
			if c = "["
				nLevel++
				if nPosition > -1
					aPath + (nPosition+1)
				else
					aPath = []
				ok
				aResult + [ :Path = aPath, :Level = nLevel, :Position = nPosition+1 ]
				
				nPosition = 0

			but c = "]"
				nLevel--
				if len(aPath) > 0
					del(aPath, len(aPath))
				ok

			but c = ","
				nPosition++
				
			ok
			
		next
		oResult = new stzList(aResult)
		return oResult.Section(2, oResult.NumberOfItems())

		def ItemsThatAreLists_AtAnyLevel_XTQ()
			return new stzList( This.ItemsThatAreLists_AtAnyLevel_XT() )

	def NumberOfLevels()
				
		oCopy = @@( Q( This.Content() ).RemoveSectionsBetweenIBQ("]","[") )
		nResult = oCopy.NumberOfOccurrence("[")

		return nResult

		#< @FunctionAlternativeForms

		def CountLevels()
			return This.NumberOfLevels()

		def HowManyLevels()
			return This.NumberOfLevels()

		def HowManyLevel()
			return This.NumberOfLevels()

		#>
	
	def Depth()
		return This.NumberOfLevels()

	def ItemsThatAre_Lists_AtAnyLevel()
		aResult = []
		n = 0
		n1 = 0
		n2 = 0

		oListInString = StzStringQ( list2code(This.Content()) )

		bInsideList = FALSE
		for i = 2 to oListInString.NumberOfChars() - 1

			c = oListInString[i]

			if c = "["
				bInsideList = TRUE
				n1 = i
			ok

			if c = "]" and bInsideList = TRUE
				n2 = i
				cCode = oListInString.Section(n1, n2)
				eval("aTempList = " + cCode)

				aResult + aTempList
				bInsideList = FALSE
			ok
			
		next

		return aResult

		def ItemsThatAre_Lists_AtAnyLevelQ()
			return new stzListOfLists( This.ItemsThatAre_Lists_AtAnyLevel() )
			
	def ListsAtAnyLevel()
		return This.ItemsThatAre_Lists_AtAnyLevel()

		def ListsAtAnyLevelQ()
			return new stzListOfLists( This.ListsAtAnyLevel() )
	
	def SublistsAtAnyLevel()
		return ListsAtAnyLevel()

		def SublistsAtAnyLevelQ()
			return This.ListsAtAnyLevelQ()
	
	def Structure()
		// TODO
		
	def ShowStructure()
		/* Generates a treeview like this:
			LIST[]
			|
			+-- cItem1
			|
			+-- Item2[]
			| |
			| +-- nItem2.1
			| |
                        | +-- oItem2.2
			|
			+-- nItem3
		*/

		StzRaise("Unsupported feature yet!")

	  #---------------------------#
	 #     LEVELS OF THE LIST    #
	#===========================#

	def Levels()
		// TODO
		StzRaise("Unsupported feature yet!")

	def NthLevel(n)
		// TODO
		StzRaise("Unsupported feature yet!")

	def ContentOfLevel(n)
		// TODO
		StzRaise("Unsupported feature yet!")

		def ItemsOfLevel(n)
			return This.ContentOfLevel(n)

	def LevelsAndTheirItems()
		// TODO
		StzRaise("Unsupported feature yet!")

	  #-----------------------------------------------------------#
	 #   SUBLISTS OF THE LIST --> LISTS IN LEVEL 1 OF THE LIST   #
	#-----------------------------------------------------------#

	def Sublists()
		aResult = []
		for item in This.List()
			if isList(item)
				aResult + item
			ok
		next
		return aResult

		#< @FunctionFluentForm

		def SubListsQ()
			return new stzList( This.Sublists() )

		#>

	def SublistsNumberOfItems()
		aResult = []
		for item in This.List()
			if isList(item)
				aResult + len(item)
			ok
		next
		return aResult
		
	def SublistsHaveSameNumberOfItems()
		bResult = TRUE
		for i=2 to len( This.Sublists() )
			if len( This.Sublists()[i] ) != len( This.Sublists()[i-1] )
				bResult = FALSE
			ok
		next
		return bResult

	def SublistsAtAnyLevelHaveSameNumberOfItems()
		bResult = TRUE
		for i=2 to len( This.SublistsAtAnyLevel() )
			if len( This.SublistsAtAnyLevel()[i] ) != len( This.SublistsAtAnyLevel()[i-1] )
				bResult = FALSE
			ok
		next
		return bResult
		
	  #====================#
	 #  SHOWING THE LIST  #
	#====================#

	def Show()
		? @@( This.Content() )

	def ShowShort()
		? @@S( This.Content() )

		def ShowShortCopy()
			This.ShowShort()

	def ShowShortXT(p)
		? @@SXT( This.Content(), p)

		def ShowShortenedXT(p)
			This.ShowShortXT(p)

	def ShowShortN(n)
		? @@SN( This.Content(), n )

	def ShowShortUsing(pcMiddlePart)
		? @@( This.ShortenedUsing(pcMiddlePart) )

	def ShowShortNUsing(n, pcMiddlePart)
		? @@( This.ShortenedNUsing(n, pcMiddlePart) )

	  #------------------------------------------#
	 #   GETTING A SHORTENED COPY OF THE LIST  #
	#==========================================#

	def ToShort()
		return This.ToShortXT(10, 3, "...")

	  #---------------------------------------------------------------------#
	 #   GETTING A SHORTENED COPY OF THE LIST WITH N ITEMS FROM EACH SIDE  #
	#---------------------------------------------------------------------#

	def ToShortN(n)
		return This.ToShortXT(10, n, "...")

	  #-------------------------------------------------------------------#
	 #   GETTING A SHORTENED COPY OF THE LIST USiNG A GIVEN MIDDLE PART  #
	#-------------------------------------------------------------------#

	def ToShortUsing(pcMiddlePart)
		return This.ToShortXT(10, 3, pcMiddlePart)

	  #------------------------------------------------------------------------------------------------#
	 #   GETTING A SHORTENED COPY OF THE LIST USING N ITEMS FROM EACH SIDE AND THE GIVEN MIDDLE PART  #
	#------------------------------------------------------------------------------------------------#

	def ToShortNUsing(n, pcMiddlePart)
		return This.ToShortXT(10, n, pcMiddlePart)

	  #----------------------------------------------------#
	 #  GETTING A SHORTENED COPY OF THE LIST -- EXTENDED  #
	#----------------------------------------------------#

	def ToShortXT(nMinListSize, pNumberOfItemsToShow, pcMiddlePart)
		# nMinListSize : the minimum size to start shortening
		# --> if the size of the list is less than this value,
		#     the list will not be shortened (returned as is)

		# pNumberOfItemsToShow: the number of items to show from
		# both the beginning and end of the list
		# --> the other part of the item (coming in the middle)
		#     will be hided and replaced by pcMiddlePart

		/* EXAMPLES

		? Q([ "1", "2", "3", "4", "5", "6", "7", "8", "9"]).Shortened()
		#--> '[ "1", "2", "3", "...", "7", "8", "9" ]'
		
		? Q([ "1", "2", "3", "4", "5", "6", "7", "8", "9"]).ShortenedN(2)
		#--> '[ "1", "2", "...", "8", "9" ]'
		
		? Q([ "1", "2", "3", "4", "5", "6", "7", "8", "9"]).ShortenedXT(0, 2, "{...}")
		#--> '[ "1", "2", "{...}", "8", "9" ]'

		*/

		nLen = This.NumberOfItems()
		if nLen < nMinListSize
			This.Show()
			return
		ok

		n1 = 0
		n2 = 0

		if isNumber(pNumberOfItemsToShow)
			n1 = pNumberOfItemsToShow
			n2 = pNumberOfItemsToShow

		but isList(p) and Q(pNumberOfItemsToShow).IsPairOfNumbers()
			n1 = pNumberOfItemsToShow[1]
			n2 = pNumberOfItemsToShow[2]

		else
			StzRaise("Incorrect param type! pNumberOfItemsToShow must be a number or pair of numbers.")

		ok

		if n1 = 0 or n2 = 0
			StzRaise("Incorrect value! The number of items to show must be different of zero..")
		ok

		# Doing the job

		aPart1 = This.Section(1, n1)
		aPart2 = This.Section(nLen - n2 + 1, nLen)

		aResult = aPart1
		aResult + pcMiddlePart

		for i = 1 to n2
			aResult + aPart2[i]
		next

		return aResult

	  #-----------------------#
	 #  SHORTENING THE LIST  #
	#=======================#

	def Shorten()
		This.ShortenXT(10, 3, "...")

		def ShortenQ()
			This.Shorten()
			return This

	def Shortened()
		cResult = This.ToShortXT(10, 3, "...")
		return cResult

	  #------------------------------------------------#
	 #  SHORTENING THE LIST TO N ITEMS FROM EACH SIDE #
	#------------------------------------------------#

	def ShortenN(n)
		cShort = This.ShortenedXT(10, n, "...")
		This.UpdateWith(cShort)

		#< @FunctionFluentForm

		def ShortenNQ(n)
			This.ShortenN(n)
			return This

		#>

		#< @FunctionAlternativeForms

		def ShortenToN(n)
			This.ShortenN(n)

			def ShortenToNQ(n)
				This.ShortenToN(n)
				return This

		def ShortenToNItems(n)
			This.ShortenN(n)

			def ShortenToNItemsQ(n)
				This.ShortenToNItems(n)
				return This

		def ShortenToNItemsInEachSide(n)
			This.ShortenN(n)

			def ShortenToNItemsInEachSideQ(n)
				This.ShortenToNItemsInEachSide(n)
				return This

		def ShortenToNItemsFromEachSide(n)
			This.ShortenN(n)

			def ShortenToNItemsFromEachSideQ(n)
				This.ShortenToNItemsFromEachSide(n)
				return This

		def ShortenToNItemsAtEachSide(n)
			This.ShortenN(n)

			def ShortenToNItemsAtEachSideQ(n)
				This.ShortenToNItemsAtEachSide(n)
				return This

		#>

	def ShortenedN(n)
		cResult = This.Copy().ShortenNQ(n).Content()
		return cResult

		#< @FunctionAlternativeForms

		def ShortenedToN(n)
			return This.ShortenedN(n)

		def ShortenedToNItems(n)
			return This.ShortenedN(n)

		def ShortenedToNItemsInEachSide(n)
			return This.ShortenedN(n)

		def ShortenedToNItemsFromEachSide(n)
			return This.ShortenedN(n)

		def ShortenedToNItemsAtEachSide(n)
			return This.ShortenedN(n)

		#>

	  #---------------------------------------------------------------#
	 #  SHORTENING THE LIST USING THE GIVEN STRING AS A MIDDLE ITEM  #
	#---------------------------------------------------------------#

	def ShortenUsing(pcMiddlePart)
		cShort = This.ShortenedXT(10, 3, pcMiddlePart)
		This.UpdateWith(cShort)

		def ShortenUsingQ(pcMiddlePart)
			This.ShortenUsing(pcMiddlePart)
			return This

	def ShortenedUsing(pcMiddlePart)
		cResult = This.Copy().ShortenUsingQ(pcMiddlePart).Content()
		return cResult

	  #------------------------------------------------------------------------------#
	 #  SHORTENING THE LIST USING N ITEMS FROM EACH SIDE AND THE GIVEN MIDDLE PART  #
	#------------------------------------------------------------------------------#

	def ShortenNUsing(n, pcMiddlePart)
		cShort = This.ToShortNUsing(n, pcMiddlePart)
		This.UpdateWith(cShort)

		#< @FunctionFluentForm

		def ShortenNUsingQ(n, pcMiddlePart)
			This.ShortenNUsing(n, pcMiddlePart)
			return This

		#>

		#< @FunctionAlternativeForms

		def ShortenToNUsing(n, pcMiddlePart)
			This.ShortenNUsing(n, pcMiddlePart)

			def ShortenToNUsingQ(n, pcMiddlePart)
				This.ShortenToNUsing(n, pcMiddlePart)
				return This

		def ShortenToNItemsUsing(n, pcMiddlePart)
			This.ShortenNUsing(n, pcMiddlePart)

			def ShortenToNItemsUsingQ(n, pcMiddlePart)
				This.ShortenToNItemsUsing(n, pcMiddlePart)
				return This

		def ShortenToNItemsInEachSideUsing(n, pcMiddlePart)
			This.ShortenNUsing(n, pcMiddlePart)

			def ShortenToNItemsInEachSideUsingQ(n, pcMiddlePart)
				This.ShortenToNItemsInEachSideUsing(n, pcMiddlePart)
				return This

		def ShortenToNItemsFromEachSideUsing(n, pcMiddlePart)
			This.ShortenNUsing(n, pcMiddlePart)

			def ShortenToNItemsFromEachSideUsingQ(n, pcMiddlePart)
				This.ShortenToNItemsFromEachSideUsing(n, pcMiddlePart)
				return This

		def ShortenToNItemsAtEachSideUsing(n, pcMiddlePart)
			This.ShortenNUsing(n, pcMiddlePart)

			def ShortenToNItemsAtEachSideUsingQ(n, pcMiddlePart)
				This.ShortenToNItemsAtEachSideUsing(n, pcMiddlePart)
				return This

		#>

	def ShortenedNUsing(n, pcMiddlePart)
		cResult = This.Copy().ShortenNUsingQ(n, pcMiddlePart).Content()
		return cResult

		#< @FunctionAlternativeForms

		def ShortenedToNUsing(n, pcMiddlePart)
			return This.ShortenedNUsing(n, pcMiddlePart)

		def ShortenedToNItemsUsing(n, pcMiddlePart)
			return This.ShortenedNUsing(n, pcMiddlePart)

		def ShortenedToNItemsInEachSideUsing(n, pcMiddlePart)
			return This.ShortenedNUsing(n, pcMiddlePart)

		def ShortenedToNItemsFromEachSideUsing(n, pcMiddlePart)
			return This.ShortenedNUsing(n, pcMiddlePart)

		def ShortenedToNItemsAtEachSideUsing(n, pcMiddlePart)
			return This.ShortenedNUsing(n, pcMiddlePart)

		#>

	  #-----------------------------------#
	 #  SHORTENING THE LIST -- EXTENDED  #
	#-----------------------------------#

	def ShortenXT(nMinListSize, pNumberOfItemsToShow, pcMiddlePart)
		cShort = This.ToShortXT(nMinListSize, pNumberOfItemsToShow, pcMiddlePart)
		This.UpdateWith(cShort)

		def ShortenXTQ(nMinListSize, pNumberOfItemsToShow, pcMiddlePart)
			This.ShortenXT(nMinListSize, pNumberOfItemsToShow, pcMiddlePart)
			return This

	def ShortenedXT(nMinListSize, pNumberOfItemsToShow, pcMiddlePart)
		cResult = This.Copy().ShortenXTQ(nMinListSize, pNumberOfItemsToShow, pcMiddlePart).Content()
		return cResult

	  #======================================#
	 #  FINDING ALL OCCURRENCES OF AN ITEM  #
	#======================================#

	def FindAllOccurrencesCS(pItem, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzList([ "ring", "php", "ring", "ring", "_" ])
		? o1.Find("ring")

		*/

		if isList(pItem) and StzListQ(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		# Doing the job

		anResult = []

		if isNumber(pItem)
			anNumbersZ = This.NumbersZ()
			nLen = len(anNumbersZ)

			for i = 1 to nLen
				if anNumbersZ[i][1] = pItem
					anResult + anNumbersZ[i][2]
				ok
			next

			return anResult

		but isString(pItem)
			acStringsZ = This.StringsZ()
			nLen = len(acStringsZ)

			for i = 1 to nLen
				if acStringsZ[i][1] = pItem
					anResult + acStringsZ[i][2]
				ok
			next

			return anResult

		but isList(pItem)
			aListsZ = This.ListsZ()
			nLen = len(aListsZ)

			for i = 1 to nLen
				if StzListQ(aListsZ[i][1]).IsEqualToCS(pItem, pCaseSensitive)
					anResult + aListsZ[i][2]
				ok
			next

			return anResult

		else // isObject(pItem)
			aoObjectsZ = This.ObjectsZ()
			nLen = len(aoObjectsZ)

			for i = 1 to nLen
				if StzObjectQ(aoObjectsZ[i][1]).IsEqualTo(pItem)
					anResult + aoObjectsZ[i][2]
				ok
			next

			return anResult
		ok

		#< @FunctionFluentForm

		def FindAllOccurrencesCSQ(pItem, pCaseSensitive)
			return This.FindAllOccurrencesCSQR(pItem, pCaseSensitive, :stzList)

		def FindAllOccurrencesCSQR(pItem, pCaseSensitive, pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindAllCS(pItem, pCaseSensitive) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindAllCS(pItem, pCaseSensitive) )

			on :stzListOfUnicodes
				return new stzListOfUnicodes( This.FindAllCS(pItem, pCaseSensitive) )

			on :stzListOfStrings
				return new stzListOfStrings( This.FindAllCS(pItem, pCaseSensitive) )

			on :stzListOfChars
				return new stzListOfChars( This.FindAllCS(pItem, pCaseSensitive) )

			on :stzListOfLists
				return new stzListOfLists( This.FindAllCS(pItem, pCaseSensitive) )

			on :stzListOfPairs
				return new stzListOfPairs( This.FindAllCS(pItem, pCaseSensitive) )

			on :stzListOfSets
				return new stzListOfSets( This.FindAllCS(pItem, pCaseSensitive) )

			on :stzListOfHashLists
				return new stzListOfHashLists( This.FindAllCS(pItem, pCaseSensitive) )

			on :stzListOfGrids
				return new stzListOfGrids( This.FindAllCS(pItem, pCaseSensitive) )

			on :stzListOfTables
				return new stzListOfTables( This.FindAllCS(pItem, pCaseSensitive) )

			on :stzListOfEntities
				return new stzListOfEntities( This.FindAllCS(pItem, pCaseSensitive) )

			on :stzListOfBytes
				return new stzListOfBytes( This.FindAllCS(pItem, pCaseSensitive) )

			on :stzListOfObjects
				return new stzListOfObjects( This.FindAllCS(pItem, pCaseSensitive) )

			other
				StzRaise("Unsupported type!")
			off

		#>

		#< @FunctionAlternativeForms

		def FindAllCS(pItem, pCaseSensitive)
			return This.FindAllOccurrencesCS(pItem, pCaseSensitive)

			#< @FunctionFluentForm

			def FindAllCSQ(pItem, pCaseSensitive)
				return This.FindAllCSQR(pItem, pCaseSensitive, :stzList)
	
			def FindAllCSQR(pItem, pCaseSensitive, pcReturnType)
				return This.FindAllOccurrencesCSQR(pItem, pCaseSensitive, pcReturnType)
			#>

		def FindItemCS(pItem, pCaseSensitive)
			return This.FindAllOccurrencesCS(pItem, pCaseSensitive)

			#< @FunctionFluentForm

			def FindItemCSQ(pItem, pCaseSensitive)
				return This.FindItemCSQR(pItem, pCaseSensitive, :stzList)
	
			def FindItemCSQR(pItem, pCaseSensitive, pcReturnType)
				return This.FindAllCSQR(pItem, pCaseSensitive, pcReturnType)
			#>

		def PositionsCS(pItem, pCaseSensitive)
			return This.FindAllOccurrencesCS(pItem, pCaseSensitive)

			#< @FunctionFluentForm

			def PositionsCSQ(pItem, pCaseSensitive)
				return This.PositionsCSQR(pItem, pCaseSensitive, :stzList)
	
			def PositionsCSQR(pItem, pCaseSensitive, pcReturnType)
				return This.FindAllCSQR(pItem, pCaseSensitive, pcReturnType)
			#>

		def OccurrencesCS(pItem, pCaseSensitive)
			return This.FindAllOccurrencesCS(pItem, pCaseSensitive)

			#< @FunctionFluentForm

			def OccurrencesCSQ(pItem, pCaseSensitive)
				return This.OccurrencesCSQR(pItem, pCaseSensitive, :stzList)
	
			def OccurrencesCSQR(pItem, pCaseSensitive, pcReturnType)
				return This.FindAllCSQR(pItem, pCaseSensitive, pcReturnType)
			#>

		def FindCS(pItem, pCaseSensitive)
			if isList(pItem) and Q(pItem).IsItemNamedParam()
				pItem = pItem[2]
			ok

			return This.FindAllOccurrencesCS(pItem, pCaseSensitive)

			def FindCSQ(pItem, pCaseSensitive)
				return This.FindCSQR(pItem, pCaseSensitive, :stzList)

			def FindCSQR(pItem, pCaseSensitive, pcReturnType)
				return This.FindAllCSQR(pItem, pCaseSensitive, pcReturnType)

		#>	

	#-- WITHOUT CASESENSITIVITY

	def FindAllOccurrences(pItem)
		aResult = This.FindAllOccurrencesCS(pItem, :CaseSensitive = TRUE)
		return aResult

		#< @FunctionFluentForm

		def FindAllOccurrencesQ(pItem)
			return This.FindAllOccurrencesQR(pItem, :stzList)

		def FindAllOccurrencesQR(pItem, pcReturnType)
			return This.FindAllOccurrencesCSQR(pItem, :CS = TRUE, pcReturnType)
		#>

		#< @FunctionAlternativeForms

		def FindAll(pItem)
			return This.FindAllOccurrences(pItem)

			#< @FunctionFluentForm

			def FindAllQ(pItem)
				return This.FindAllQR(pItem, :stzlist)
	
			def FindAllQR(pItem, pcReturnType)
				return This.FindAllOccurrencesQR(pItem, pcReturnType)
	
			#>

		def FindItem(pItem)
			return This.FindAllOccurrences(pItem)

			#< @FunctionFluentForm

			def FindItemQ(pItem)
				return This.FindItemQR(pItem, :stzList)
	
			def FindItemQR(pItem, pcReturnType)
				return This.FindAllOccurrencesQR(pItem, pcReturnType)
			#>

		def Positions(pItem)
			return This.FindAllOccurrences(pItem)

			#< @FunctionFluentForm

			def PositionsQ(pItem)
				return This.PositionsQR(pItem, :stzList)
	
			def PositionsQR(pItem, pcReturnType)
				return This.FindAllOccurrencesQR(pItem, pcReturnType)
			#>

		def Occurrences(pItem)
			return This.FindAllOccurrences(pItem)

			#< @FunctionFluentForm

			def OccurrencesQ(pItem)
				return This.OccurrencesQR(pItem, :stzList)
	
			def OccurrencesQR(pItem, pcReturnType)
				return This.FindAllOccurrencesQR(pItem, pcReturnType)
			#>

		def Find(pItem)
			if isList(pItem) and Q(pItem).IsItemNamedParam()
				pItem = pItem[2]
			ok

			return This.FindAllOccurrences(pItem)

			#< @FunctionFluentForm

			def FindQ(pItem)
				return This.FindQR(pItem, :stzList)
	
			def FindQR(pItem, pcReturnType)
				return This.FindAllOccurrencesQR(pItem, pcReturnType)
			#>
		#>

	  #-------------------------------------------------------#
	 #    FINDING N OCCURRENCES OF AN ITEM INSIDE THE LIST   #
	#-------------------------------------------------------#

	# Finding works only for numbers and strings

	# TODO : Lists and objects will become findable after
	# designing an overall solution of the Equality problem
	# in SoftanzaLib

	# UPDATE: Lists are now findable (only objects are left for future)

	def FindNthOccurrenceCS(n, pItem, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzList([ 1, 2, "*", 4, 5, "*", 7, 8, "*", 10 ])
		? o1.FindNth(3, "*")
		#--> 9

		*/

		if isString(n)
			if n = :First or n = :FirstOccurrence
				return This.FindfirstCS(pItem, pCaseSensitive)

			but n = :Last or n = :LastOccurrence
				return This.FindLastCS(pItem, pCaseSensitive)
			ok
		ok

		if NOT isNumber(n)
			SrzRaise("Incorrect  param type! n must be a number.")
		ok

		if n = 1
			return This.FirstOccurrenceCS(pItem, pCaseSensitive)

		but n = This.NumberOfOccurrenceCS(pItem, pCaseSensitive)
			return This.LastOccurrenceCS(pItem, pCaseSensitive)
		ok

		if isList(pItem) and StzListQ(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		# Doing the job

		if n = 1
			return This.FirstOccurrenceCS(pItem, pCaseSensitive)

		but n = This.NumberOfItems()
			return This.LastOccurrenceCS(pItem, pCaseSensitive)
		ok

		# TODO

		StzRaise("TODO")

		#< @FunctionAlternativeForms

		def FindNthItemCS(n, pItem, pCaseSensitive)
			return This.FindNthOccurrenceCS(n, pItem, pCaseSensitive)

		def FindNthCS(n, pItem, pCaseSensitive)
			return This.FindNthOccurrenceCS(n, pItem, pCaseSensitive)

		def NthCS(n, pItem, pCaseSensitive)
			return This.FindNthOccurrenceCS(n, pItem, pCaseSensitive)

		def NthOccurrenceCS(n, pItem, pCaseSensitive)
			return This.FindNthOccurrenceCS(n, pItem, pCaseSensitive)

		def ItemPositionByOccurrenceCS(n, pItem, pCaseSensitive)
			return This.FindNthOccurrenceCS(n, pItem, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindNthOccurrence(n, pItem) 
		return This.FindNthOccurrenceCS(n, pItem, :CaseSensitive = TRUE) 

		#< @FunctionAlternativeForms

		def FindNthItem(n, pItem)
			return This.FindNthOccurrence(n, pItem)

		def FindNth(n, pItem)
			return This.FindNthOccurrence(n, pItem)

		def Nth(n, pItem)
			return This.FindNthOccurrence(n, pItem)

		def NthOccurrence(n, pItem)
			return This.FindNthOccurrence(n, pItem)

		def ItemPositionByOccurrence(n, pItem)
			return This.FindNthOccurrence(n, pItem)

		#>

	  #----------------------------------------------------------------#
	 #    FINDING NTH TO LAST OCCURRENCE OF AN ITEM INSIDE THE LIST   #
	#----------------------------------------------------------------#

	def NthToLast(n)
		return This.ItemAtPosition( This.NumberOfItems() - n )

	  #----------------------------------------------------------------#
	 #    FINDING NTH TO LAST OCCURRENCE OF AN ITEM INSIDE THE LIST   #
	#----------------------------------------------------------------#

	def NthToFirst(n)
		return This.ItemAtPosition(n + 1)

	  #---------------------------------------------------#
	 #  FINDING FIRST OCCURRENCE OF AN ITEM IN THE LIST  #
	#---------------------------------------------------#

	def FindFirstOccurrenceCS(pItem, pCaseSensitive)
		if isList(pItem) and Q(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isObject(pItem)
			StzRaise("Can't process! Objects can not be found yet.")
		ok

		# Resolving pCaseSensitive

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if isString(pCaseSensitive)
			if Q(pCaseSensitive).IsOneOfThese([
				:CaseSensitive, :IsCaseSensitive , :CS, :IsCS ])

				pCaseSensitive = TRUE
			
			but Q(pCaseSensitive).IsOneOfThese([
				:CaseInSensitive, :NotCaseSensitive, :NotCS,
				:IsCaseInSensitive, :IsNotCaseSensitive, :IsNotCS ])

				pCaseSensitive = FALSE
			ok

		ok

		if NOT IsBoolean(pCaseSensitive)
			stzRaise("Incorrect param! pCaseSensitive must be 0 or 1 (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		nResult = 0

		if ( This.IsListOfNumbers() or This.IsListOfStrings() ) and
		   ( isNumber(pItem) or isString(pItem) ) and
		   pCaseSensitive = TRUE

			nResult = ring_find( aContent, pItem )
			return nResult
		ok

		cItem = @@(pItem)

		for i = 1 to nLen
	
			if Q(cItem).IsEqualToCS( @@(aContent[i]), pCaseSensitive )
				nResult = i
				exit
			ok
		next

		return nResult

		#< @FunctionAlternativeForms

		def FindFirstCS(pItem, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pItem, pCaseSensitive)

		def FirstOccurrenceCS(pItem, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pItem, pCaseSensitive)

		def FirstCS(pItem, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pItem, pCaseSensitive)

		def PositionOfFirstCS(pItem, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pItem, pCaseSensitive)

		def PositionOfFirstOccurrenceCS(pItem, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pItem, pCaseSensitive)
	
		#>

	#-- WITHOUT CASESENSITIVITY

	def FindFirstOccurrence(pItem)
		return This.FindFirstOccurrenceCS(pItem, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindFirst(pItem)
			return This.FindFirstOccurrence(pItem)

		def FirstOccurrence(pItem)
			return This.FindFirstOccurrence(pItem)

		def First(pItem)
			return This.FindFirstOccurrence(pItem)

		def PositionOfFirst(pItem)
			return This.FindFirstOccurrence(pItem)

		def PositionOfFirstOccurrence(pItem)
			return This.FindFirstOccurrence(pItem)
	
		#>

	  #--------------------------------------------------#
	 #  FINDING LAST OCCURRENCE OF AN ITEM IN THE LIST  #
	#--------------------------------------------------#

	def FindLastOccurrenceCS(pItem, pCaseSensitive)

		# Resolving pCaseSensitive

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if isString(pCaseSensitive)
			oCase = Q(pCaseSensitive)
			if oCase.IsOneOfThese([
				:CaseSensitive, :IsCaseSensitive , :CS, :IsCS ])

				pCaseSensitive = TRUE
			
			but oCase.IsOneOfThese([
				:CaseInSensitive, :NotCaseSensitive, :NotCS,
				:IsCaseInSensitive, :IsNotCaseSensitive, :IsNotCS ])

				pCaseSensitive = FALSE
			ok

		ok

		if NOT IsBoolean(pCaseSensitive)
			stzRaise("Error in param value! pCaseSensitive must be 0 or 1 (TRUE or FALSE).")
		ok

		# Doing the job

		if This.IsListOfNumbersOrStrings() and
		   Q(pITem).IsNumberOrString() and
		   pCaseSensitive = TRUE

			nLen = This.NumberOfItems()
			n = ring_find( ring_reverse(This.List()), pItem )

			if n > 0
				return nLen - n + 1
			else
				return 0
			ok
		ok

		cItem = @@(pItem)
		n = 0
	
		aContent = This.Content()
		nLen = len(aContent)

		nResult = 0

		for i = nLen to 1 step -1
			n++
			if Q(cItem).IsEqualToCS( @@(aContent[i]), pCaseSensitive )
				nResult = nLen - n + 1
				exit
			ok
		next

		return nResult

		#< @FunctionAlternativeForms

		def FindLastCS(pItem, pCaseSensitive)
			return This.FindLastOccurrenceCS(pItem, pCaseSensitive)

		def LastOccurrenceCS(pItem, pCaseSensitive)
			return This.FindLastOccurrenceCS(pItem, pCaseSensitive)

		def LastCS(pItem, pCaseSensitive)
			return This.FindLastOccurrenceCS(pItem, pCaseSensitive)

		def PositionOfLastCS(pItem, pCaseSensitive)
			return This.FindLastOccurrenceCS(pItem, pCaseSensitive)

		def PositionOfLastOccurrenceCS(pItem, pCaseSensitive)
			return This.FindLastOccurrenceCS(pItem, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindLastOccurrence(pItem)

		return This.FindLastOccurrenceCS(pItem, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindLast(pItem)
			return This.FindLastOccurrence(pItem)

		def LastOccurrence(pItem)
			return This.FindLastOccurrenceCS(pItem)

		def Last(pItem)
			return This.FindLastOccurrenceCS(pItem)

		def PositionOfLast(pItem)
			return This.FindLastOccurrence(pItem)

		def PositionOfLastOccurrence(pItem)
			return This.FindLastOccurrence(pItem)

		#>

	  #------------------------------------------#
	 #   FINDING GIVEN OCCURRENCES OF AN ITEM   #
	#------------------------------------------#

	def FindTheseOccurrencesCS(panOccurr, pItem, pCaseSensitive)
		anPositions = This.FindAllCS(pItem, pCaseSensitive)
		return Q(anPositions).ItemsAt(panOccurr)

		def FindOccurrencesCS(panOccurr, pItem, pCaseSensitive)
			return This.FindTheseOccurrencesCS(panOccurr, pItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def FindTheseOccurrences(panOccurr, pItem)
		return This.FindTheseOccurrencesCS(panOccurr, pItem, :CaseSensitive = TRUE)

		def FindOccurrences(panOccurr, pItem)
			return This.FindTheseOccurrences(panOccurr, pItem)

	  #-------------------------------------------------------#
	 #   FINDING THE OCCURRENCES OF MANY ITEMS IN THE LIST   #
	#-------------------------------------------------------#
	
	def FindManyCS(paItems, pCaseSensitive)
		/*
		o1 = new stzList([ :one, :two, :one, :three, :one, :four ])
		? o1.FindMany([ :one, :two, :four ])
		#--> [ 1, 2, 3, 5, 6 ]
		*/

		if CheckParams()
			if NOT isList(paItems)
				StzRaise("Incorrect param type! paItems must be a list.")
			ok
		ok

		aItems = Q(paItems).RemoveDuplicatesQ().Sorted()
		nLen = len(aItems)

		anResult = []

		for i = 1 to nLen
			anPos = This.FindAllCS(aItems[i], pCaseSensitive)
			nLenPos = len(anPos)
			for j = 1 to nLenPos
				anResult + anPos[j]
			next
		next

		anResult = ring_sort(anResult)

		return anResult

		#< @FunctionFluentForm

		def FindManyCSQ(paItems, pCaseSensitive)
			return This.FindManyCSQR(paItems, pCaseSensitive, :stzListOfNumbers)

		def FindManyCSQR(paItems, pCaseSensitive, pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindManyCS(paItems, pCaseSensitive) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindManyCS(paItems, pCaseSensitive) )

			other
				StzRaise("Unsupported return type!")
			off

		#

		#< @FunctionAlternativeForms

		def FindTheseItemsCS(paItems, pCaseSensitive)
			return This.FindManyCS(paItems, pCaseSensitive)

		def FindTheseCS(paItems, pCaseSensitive)
			return This.FindManyCS(paItems, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindMany(paItems)
		return This.FindManyCS(paItems, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def FindManyQ(paItems)
			return This.FindManyQR(paItems, :stzListOfNumbers)

		def FindManyQR(paItems, pcReturnType)
			return This.FindManyCSQR(paItems, :CaseSensitive = TRUE, pcReturnType)

		#>

		#< @FunctionAlternativeForms

		def FindTheseItems(paItems)
			return This.FindMany(paItems)

		def FindThese(paItems)
			return This.FindMany(paItems)

		#>

	  #------------------------------------------------------------------#
	 #   FINDING THE OCCURRENCES OF MANY ITEMS IN THE LIST -- EXTENDED  #
	#------------------------------------------------------------------#

	def TheseItemsCSZ(paItems, pCaseSensitive)
		/*
		o1 = new stzList([ :one, :two, :one, :three, :one, :four ])
		? o1.TheseItemsZZ([ :one, :two, :four ])
		#--> [ :one = [1, 3, 5], :two = [2], :three = [6] ]
		*/

		if CheckParams()
			if NOT isList(paItems)
				StzRaise("Incorrect param type! paItems must be a list.")
			ok
		ok

		nLen = len(paItems)

		aResult = []

		for i = 1 to nLen
			aResult + [ paItems[i], This.FindAllCS(paItems[i], pCaseSensitive) ]
		next

		return aResult

		#< @FunctionFluentForm

		def TheseItemsCSZQ(paItems, pCaseSensitive)
			return new stzList( This.TheseItemsCSZ(paItems, pCaseSensitive) )

		#>

		#< @FunctionAlternativeForm

		def TheseItemsAndTheirPositionsCS(paItems, pCaseSensitive)
			return This.TheseItemsCSZ(paItems, pCaseSensitive)

			def TheseItemsAndTheirPositionsCSQ(paItems, pCaseSensitive)
				return This.TheseItemsCSZQ(paItems, pCaseSensitive)
		#>

	#-- CASESENSITIVITY

	def TheseItemsZ(paItems)
		return This.TheseItemsCSZ(paItems, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def TheseItemsZQ(paItems)
			return new stzList( This.TheseItemsZ(paItems) )

		#>

		#< @FunctionAlternativeForm

		def TheseItemsAndTheirPositions(paItems)
			return This.TheseItemsZ(paItems)

			def TheseItemsAndTheirPositionsQ(paItems)
				return This.TheseItemsZQ(paItems)
		#>

	  #-------------------------------------------#
	 #  FINDING ITEMS OTHER THAN THOSE PROVIDED  #
	#-------------------------------------------#

	def FindItemsOtherThanCS(paItems, pCaseSensitive)
		if CheckParams()

			if NOT isList(paItems)
				aTemp = []
				aTemp + paItems
				paItems = aTemp
			ok

		ok

		anPos = This.FindTheseItemsCS(paItems, pCaseSensitive)

		nLen = This.NumberOfItems()
		anResult = Q( 1 : nLen) - anPos

		return anResult

		#< @FunctionAlternativeForms

		def FindItemsExceptCS(paItems, pCaseSensitive)
			return This.FindItemsOtherThanCS(paItems, pCaseSensitive)

		def FindItemsOtherThanTheseCS(paItems, pCaseSensitive)
			return This.FindItemsOtherThanCS(paItems, pCaseSensitive)

		def FindItemsExceptTheseCS(paItems, pCaseSensitive)
			return This.FindItemsOtherThanCS(paItems, pCaseSensitive)

		def FindOtherThanTheseItemsCS(paItems, pCaseSensitive)
			return This.FindItemsOtherThanCS(paItems, pCaseSensitive)

		def FindOtherThanTheseCS(paItems, pCaseSensitive)
			return This.FindItemsOtherThanCS(paItems, pCaseSensitive)

		#--

		def FindAllExceptCS(paItems, pCaseSensitive)
			return This.FindItemsOtherThanCS(paItems, pCaseSensitive)

		def FindAllExceptTheseCS(paItems, pCaseSensitive)
			return This.FindItemsOtherThanCS(paItems, pCaseSensitive)

		def FindAllItemsExceptCS(paItems, pCaseSensitive)
			return This.FindItemsOtherThanCS(paItems, pCaseSensitive)

		def FindAllItemsExceptTheseCS(paItems, pCaseSensitive)
			return This.FindItemsOtherThanCS(paItems, pCaseSensitive)

		#--

		def FindExceptCS(paItems, pCaseSensitive)
			return This.FindItemsOtherThanCS(paItems, pCaseSensitive)

		def FindOtherThanCS(paItems, pCaseSensitive)
			return This.FindItemsOtherThanCS(paItems, pCaseSensitive)

		#--

		def FindAllButCS(paItems, pCaseSensitive)
			return This.FindItemsOtherThanCS(paItems, pCaseSensitive)

		#>

	#-- WTIHOUT CASESENSITIVITY

	def FindItemsOtherThan(paItems)
		return This.FindItemsOtherThanCS(paItems, :CaseSensitive)

		#< @FunctionAlternativeForms

		def FindItemsExcept(paItems)
			return This.FindItemsOtherThan(paItems)

		def FindItemsOtherThanThese(paItems)
			return This.FindItemsOtherThan(paItems)

		def FindItemsExceptThese(paItems)
			return This.FindItemsOtherThan(paItems)

		def FindOtherThanTheseItems(paItems)
			return This.FindItemsOtherThan(paItems)

		def FindOtherThanThese(paItems)
			return This.FindItemsOtherThan(paItems)

		#--

		def FindAllExcept(paItems)
			return This.FindItemsOtherThan(paItems)

		def FindAllExceptThese(paItems)
			return This.FindItemsOtherThan(paItems)

		def FindAllItemsExcept(paItems)
			return This.FindItemsOtherThan(paItems)

		def FindAllItemsExceptThese(paItems)
			return This.FindItemsOtherThan(paItems)

		#--

		def FindExcept(paItems)
			return This.FindItemsOtherThan(paItems)

		def FindOtherThan(paItems)
			return This.FindItemsOtherThan(paItems)

		#--

		def FindAllBut(paItems)
			return This.FindItemsOtherThan(paItems)

		#>

	  #-------------------------------------------------------------------#
	 #  FINDING ALL OCCURRENCES OF AN ITEM, EXCEPT THE FIRST OCCURRENCE  #
	#-------------------------------------------------------------------#

	def FindAllExceptFirstCS(pItem, pCaseSensitive)
		anResult = This.FindAllCSQ(pItem, pCaseSensitive).Section(2, :LastItem)
		return anResult

		#< @FunctionFluentForm

		def FindAllExceptFirstCSQR(pItem, pcReturnType, pCaseSensitive)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindAllExceptFirstCS(pItem, pCaseSensitive) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindAllExceptFirstCS(pItem, pCaseSensitive) )

			other
				StzRaise("Unsupported return type!")
			off

		def FindAllExceptFirstCSQ(pItem, pCaseSensitive)
			return This.FindAllExceptFirstCSQR(pItem, pCaseSensitive, :stzList)

		#

		#< @FunctionAlternativeForms

		def FindExceptFirstCS(pItem, pCaseSensitive)
			return This.FindAllExceptFirstCS(pItem, pCaseSensitive)

			#< @FunctionFluentForm
	
			def FindExceptFirstCSQR(pItem, pCaseSensitive, pcReturnType)
				return This.FindAllExceptFirstCSQR(pItem, pcReturnType, pCaseSensitive)
	
			def FindExceptFirstCSQ(pItem, pCaseSensitive)
				return This.FindAllExceptFirstCSQR(pItem, pCaseSenstive, :stzList)
	
		def FindFirstExceptCS(pItem, pCaseSensitive)
			return This.FindAllExceptFirstCS(pItem, pCaseSensitive)

		def FindFirstButCS(pItem, pCaseSensitive)
			return This.FindAllExceptFirstCS(pItem, pCaseSensitive)

		def FindAllButFirstCS(pItem, pCaseSensitive)
			return This.FindAllExceptFirstCS(pItem, pCaseSensitive)

		#>

	#-- WITHoUT CASESENSITIVITY

	def FindAllExceptFirst(pItem)
		return This.FindAllExceptFirstCS(pItem, pCaseSensitive)

		#< @FunctionFluentForm

		def FindAllExceptFirstQR(pItem, pcReturnType)
			return This.FindAllExceptFirstCSQR(pItem, pcReturnType, :CaseSensitive = TRUE)

		def FindAllExceptFirstQ(pItem)
			return This.FindAllExceptFirstQR(pItem, :stzList)

		#

		#< @FunctionAlternativeForms

		def FindExceptFirst(pItem)
			return This.FindAllExceptFirst(pItem)

			#< @FunctionFluentForm
	
			def FindExceptFirstQR(pItem, pcReturnType)
				return This.FindExeptFirstCSQR(pItem, pcReturType, :CaseSensitive = TRUE)
	
			def FindExceptFirstQ(pItem)
				return This.FindAllExceptFirstQR(pItem, :stzList)
	
			#>

		def FindFirstExcept(pItem)
			return This.FindAllExceptFirst(pItem)

		def FindFirstBut(pItem)
			return This.FindAllExceptFirst(pItem)

		def FindAllButFirst(pItem)
			return This.FindAllExceptFirst(pItem)

		#>

	  #------------------------------------------------------------------#
	 #  FINDING ALL OCCURRENCES OF AN ITEM, EXCEPT THE LAST OCCURRENCE  #
	#------------------------------------------------------------------#

	def FindAllExceptLastCS(pItem, pCaseSensitive)
		oTemp = new stzList( This.FindAllCS(pItem, pCaseSensitive) )
		return oTemp.Section( 1, oTemp.NumberOfItems()-1 )

		#< @FunctionFluentForm

		def FindAllExceptLastCSQR(pItem, pCaseSensitive, pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindAllExceptLastCS(pItem, pCaseSensitive) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindAllExceptLastCS(pItem, pCaseSensitive) )
			other
				StzRaise("Unsupported return type!")
			off

		def FindAllExceptLastCSQ(pItem, pCaseSensitive)
			return This.FindAllExceptLastCSQR(pItem, pCaseSensitive, :stzList)

		#

		#< @FunctionAlternativeForms

		def FindExceptLastCS(pItem, pCaseSensitive)
			return This.FindAllExceptLastCS(pItem, pCaseSensitive)

			#< @FunctionFluentForm
	
			def FindExceptLastCSQR(pItem, pCaseSensitive, pcReturnType)
				return This.FindAllExceptLastCSQR(pItem, pCaseSensitive, pcReturnType)
	
			def FindExceptLastCSQ(pItem)
				return This.FindAllExceptLastQR(pItem, pCaseSensitive, :stzList)
	
			#>

		def FindLastExceptCS(pItem, pCaseSensitive)
			return This.FindAllExceptLastCS(pItem, pCaseSensitive)

		def FindLastButCS(pItem, pCaseSensitive)
			return This.FindAllExceptLastCS(pItem, pCaseSensitive)

		def FindAllButLastCS(pItem, pCaseSensitive)
			return This.FindAllExceptLastCS(pItem, pCaseSensitive)

		#>
		
	#-- WITHOUT CASESENSITIVITY

	def FindAllExceptLast(pItem)
		return This.FindAllExceptLastCS(pItem, pCaseSensitive)

		#< @FunctionFluentForm

		def FindAllExceptLastQR(pItem, pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindAllExceptLast(pItem) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindAllExceptLast(pItem) )
			other
				StzRaise("Unsupported return type!")
			off

		def FindAllExceptLastQ(pItem)
			return This.FindAllExceptLastQR(pItem, :stzList)

		#

		#< @FunctionAlternativeForm

		def FindExceptLast(pItem)
			return This.FindAllExceptLast(pItem)

			#< @FunctionFluentForm
	
			def FindExceptLastQR(pItem, pcReturnType)
				return This.FindExceptLastCSQR(pItem, pcReturnType, :CaseSensitive = TRUE)
	
			def FindExceptLastQ(pItem)
				return This.FindAllExceptLastQR(pItem, :stzListOfNumbers)
	
			#>

		def FindLastExcept(pItem)
			return This.FindAllExceptLast(pItem)

		def FindLastBut(pItem)
			return This.FindAllExceptLast(pItem)

		def FindAllButLast(pItem)
			return This.FindAllExceptLast(pItem)

		#>

	  #======================================================#
	 #  CHECKING IF THE LIST CONTAINS AN ITEM AT ANY LEVEL  #
	#======================================================#

	def DeepContainsCS(pItem, pCaseSensitive)
		
		cList = @@( This.List() )

		cItem = @@(pItem)
		if isString(pItem)
			cItem = Q(cItem).FirstAndLastCharsRemoved()
		ok

		bResult = Q(cList).ContainsCS(cItem, pCaseSensitive)

		return bResult

	#-- WITHOUT CASESENSITIVITY

	def DeepContains(pItem)
		return This.DeepContainsCS(pItem, :CaseSensitive = TRUE)

	  #-----------------------------------------------------------------------------#
	 #  CHECKING IF THE PROVIDED ITEMS ARE ALL CONTAINED IN THE LIST AT ANY LEVEL  #
	#-----------------------------------------------------------------------------#

	def DeepContainsManyCS(paItems, pCaseSensitive)
		bResult = TRUE
		nLen = len(paItems)

		for i = 1 to nLen

			if NOT This.DeepContainsCS(paItems[i], pCaseSensitive)
				bResult = FALSE
				exit
			ok

		next

		return bResult

		def DeepContainsEachCS(paItems, pCaseSensitive)
			return This.DeepContainsManyCS(paItems, pCaseSensitive)

		def DeepContaisEachOneOfTheseCS(paItems, pCaseSensitive)
			return This.DeepContainsManyCS(paItems, pCaseSensitive)

		def DeepContaisEachOfTheseCS(paItems, pCaseSensitive)
			return This.DeepContainsManyCS(paItems, pCaseSensitive)

		def DeepContaisAllOfTheseCS(paItems, pCaseSensitive)
			return This.DeepContainsManyCS(paItems, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def DeepContainsMany(paItems)
		return This.DeepContainsManyCS(paItems, :CaseSensitive = TRUE)

		def DeepContainsEach(paItems)
			return This.DeepContainsMany(paItems)

		def DeepContaisEachOneOfThese(paItems)
			return This.DeepContainsMany(paItems)

		def DeepContaisEachOfThese(paItems)
			return This.DeepContainsMany(paItems)

		def DeepContaisAllOfThese(paItems)
			return This.DeepContainsMany(paItems)

	  #-------------------------------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS BOTH OF THE PROVIDED ITEMS AT ANY LEVEL  #
	#-------------------------------------------------------------------------#

	def DeepContainsBothCS(pItem1, pItem2, pCaseSensitive)
		if isList(pItem2) and Q(pItem2).IsAndNamedParam()
			pItem2 = pItem2[2]
		ok

		return This.DeepContainsEachCS([ pItem1, pItem2 ], pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def DeepContainsBoth(pItem1, pItem2)
		return This.DeepContainsBothCS(pItem1, pItem2, :CaseSensitive = TRUE)

	  #--------------------------------------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS AT LEAST ONE OF THE PROVIDED ITEMS AT ANY LEVEL  #
	#--------------------------------------------------------------------------------#

	def DeepContainsOneOfTheseCS(paItems, pCaseSensitive)
		bResult = FALSE

		for i = 1 to len(paItems)
			if This.DeepContainsCS(paItems[i], pCaseSensitive)
				bResult = TRUE
				exit
			ok
		next

		return bResult

	#-- WITHOUT CASESENSITIVITY

	def DeepContainsOneOfThese(paItems)
		return This.DeepContainsOneOfTheseCS(paItems, :CaseSensitive = TRUE)

	  #--------------------------------------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS AT LEAST N OF THE PROVIDED ITEMS AT ANY LEVEL  #
	#--------------------------------------------------------------------------------#

	def DeepContainsNOfTheseCS(n, paItems, pCaseSensitive)
		bResult = FALSE
		v = 0

		for i = 1 to len(paItems)
			if This.DeepContainsCS(paItems[i], pCaseSensitive)
				v++
				if v = n
					bResult = TRUE
					exit
				ok
			ok
		next

		return bResult

		def DeepContainsNItemsOfTheseCS(n, paItems, pCaseSensitive)
			return This.DeepContainsNOfTheseCS(n, paItems, pCaseSensitive)


	#-- WITHOUT CASESENSITIVITY

	def DeepContainsNOfThese(n, paItems)
		return This.DeepContainsNOfTheseCS(n, paItems, :CaseSensitive = TRUE)

		def DeepContainsNItemsOfThese(n, paItems)
			return This.DeepContainsNOfThese(n, paItems)

	  #================================#
	 #  FINDING AN ITEM AT ANY LEVEL  #
	#================================#

	/*
	TODO: Harmonize this section with  "LIST STRUCTURE" section
	--> There are some TODOs their, review them.
	*/

	// Finding pItem at any level of the list
	def DeepFindCS(pItem, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzList([
			"you",
			"other",
			[ "other", "you", [ "you" ], "other" ],
			"other",
			"you"
		])

		o1.DeepFind("you")
		#--> "you" is found in the following positions
		[
			[ [1, 1], [1, 5] ],	# positions 1 and 5 in the level [1, 1]
			[ [3, 1], [ 2 ]  ],	# positon 2 in the level [3, 1]
			[ [3, 2], [ 1 ]  ],	# position 1 in the level [3, 2]
		]
		*/

		oListStr = new stzString( @@(This.Content()) )
		cItem = @@(pItem)

		anPos = oListStr.FindCS(cItem, pCaseSensitive) #--> [21, 52]
		nLenPos = len(anPos)
	
		aResult = []

		for i = 1 to nLenPos
			nPos = anPos[i]
		
			oSection = oListStr.SectionQ(1, nPos)
		
			anPosBound1 = oSection.Find("[")
			anPosBound2 = oSection.Find("]")
		
			nLevel = len(anPosBound1) - len(anPosBound2)
		
			n1 = oListStr.FindFirstPrevious("[", :StartingAt = nPos)
			n2 = oListStr.FindFirstNext("]", :StartingAt = nPos)
		
			nPosition = oListStr.SectionQ(n1, nPos).NumberOfOccurrence(",") + 1
			
			aResult + [nLevel, nPosition]
		next

		return aResult

	#-- WITHOUT CASESENSITIVITY

	def DeepFind(pItem)
		return This.DeepFindCS(pItem, :CaseSensitive = TRUE)

	  #-----------------------------------------------------#
	 #  FINDING THE LIST ITEMS IN AN OTHER LIST OR ITEM  #
	#-----------------------------------------------------#

	def FindInCS(pOtherListOrStr, pCaseSensitive)
		/* 
		EXAMPLE 1:

		o1 = new stzList([ "11", "22", "33" ])
		? o1.FindIn([ "11", "_", "22", "_", "33" ])
		#--> [ 1, 3, 4 ]

		EXAMPLE 2:

		o1 = new stzList([ "11", "22", "33" ])
		? o1.FindIn("**11**22**33**")
		#--> [ 3, 7, 11 ]

		*/

		if isList(pOtherListOrStr) and Q(pOtherListOrStr).IsListNamedParam()
			pOtherListOrStr = pOtherListOrStr[2]

			if NOT isList(paOtherListOrStr)
				StzRaise("Incorrect param type! pOtherListOrStr must be a list.")
			ok
		ok

		if isList(pOtherListOrStr) and Q(pOtherListOrStr).IsStringNamedParam()
			pOtherListOrStr = pOtherListOrStr[2]

			if NOT isString(paOtherListOrStr)
				StzRaise("Incorrect param type! pOtherListOrStr must be a string.")
			ok
		ok

		if NOT (isList(pOtherListOrStr) or isString(pOtherListOrStr))
			StzRaise("Incorrect param type! pOtherListOrStr must be a list or string.")
		ok

		anResult = Q(pOtherListOrStr).FindManyCS(This.Content(), pCaseSensitive)
		return anResult

		#< @FunctionAlternativeForm

		def FindItemsInCS(pOtherListOrStr, pCaseSensitive)
			return This.FindInCS(pOtherListOrStr, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindIn(pOtherListOrStr)
		return FindInCS(pOtherListOrStr, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def FindItemsIn(pOtherListOrStr)
			return FindIn(pOtherListOrStr)

		#>

	  #-------------------------------------------#
	 #  FINDING THE LIST ITEMS IN AN OTHER LIST  #
	#-------------------------------------------#

	def FindInListCS(paOtherList, pCaseSensitive)
		if NOT isList(paOtherList)
			StzRaise("Incorrect param type! paOtherList must be a list.")
		ok

		return This.FindInCS(paOtherList, pCaseSensitive)

		#< @FunctionAlternativeForm

		def FindItemsInListCS(paOtherList, pCaseSensitive)
			return This.FindInListCS(paOtherList, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindInList(paOtherList)
		return This.FindInListCS(paOtherList, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def FindItemsInList(paOtherList)
			return This.FindInList(paOtherList)

		#>

	  #---------------------------------------------#
	 #  FINDING THE LIST ITEMS IN AN GIVEN ITEM  #
	#---------------------------------------------#

	def FindInStringCS(pcStr, pCaseSensitive)
		if NOT isString(pcStr)
			StzRaise("Incorrect param type! pcStr must be a string.")
		ok

		return This.FindInCS(pcStr, pCaseSensitive)

		#< @FunctionAlternativeForm

		def FindItemsInStringCS(pcStr, pCaseSensitive)
			return This.FindInStringCS(pcStr, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindInString(pcStr)
		return This.FindInStringCS(pcStr, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def FindItemsInString(pcStr)
			return This.FindInString(pcStr)

		#>

	  #=======================================================#
	 #    VISUALLY FINDING ALL OCCURRENCES OF A GIVEN ITEM   #
	#=======================================================#

	# NOTE: Works only if items are chars (string of 1 char each)
	# TODO: Implement a more general solution for longer items

	def VizFindAllOccurrencesCS(pItem, pCaseSensitive)
		
		cResult = This.ToCodeQ().Simplified()
		anPositions = Q(cResult).FindAllCS( @@(pItem), pCaseSensitive )

		nLen = StzStringQ(cResult).NumberOfChars()

		cViz = " "
		for i = 1 to nLen - 2
			
			if StzNumberQ(i).IsOneOfThese(anPositions)
				cViz += "^"
			else
				cViz += "-"
			ok

		next

		cResult += (NL + cViz)

		return cResult

		#< @FunctionFluentForm

		def VizFindAllOccurrencesCSQ(pItem, pCaseSensitive)
			return new stzString( This.VizFindAllOccurrencesCS(pItem, pCaseSensitive) )

		#>

		#< @FunctionAlternativeForms

		def VizFindAllCS(pItem, pCaseSensitive)
			return This.VizFindAllOccurrencesCS(pItem, pCaseSensitive)

			def VizFindAllCSQ(pItem, pCaseSensitive)
				return new stzString(This.VizFindAllCS(pItem, pCaseSensitive))
	

		def VizFindCS(pItem, pCaseSensitive)
			return This.VizFindAllOccurrencesCS(pItem, pCaseSensitive)

			def VizFindCSQ(pItem, pCaseSensitive)
				return new stzString(This.VizFindCS(pItem, pCaseSensitive))
		#>

	#-- WITHOUT CASESENSITIVITY

	def VizFindAllOccurrences(pItem)
		return This.VizFindAllOccurrencesCS(pItem, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def VizFindAllOccurrencesQ(pItem)
			return new stzString( This.VizFindAllOccurrences(pItem) )

		#>

		#< @FunctionAlternativeForms

		def VizFindAll(pItem)
			return This.VizFindAllOccurrences(pItem)

			def VizFindAllQ(pItem)
				return new stzString(This.VizFindAll(pItem))
	

		def VizFind(pItem)
			return This.VizFindAllOccurrences(pItem)

			def VizFindQ(pItem)
				return new stzString(This.VizFind(pItem))
		#>

	   #-------------------------------------------------#
	  #      FINDING NTH NEXT OCCURRENCE OF AN ITEM     #
	 #      STARTING AT A GIVEN POSITION               #
	#-------------------------------------------------#

	def FindNthNextOccurrenceCS( n, pItem, pnStartingAt, pCaseSensitive )
/*
		if (isString(n) and (n = :First or n = :FirstOccurrence)) or
		   (isNumber(n) and n = 1)

			return This.FindNextOccurrenceCS(pItem, nStart, pCaseSensitive)

		ok

		if (isString(n) and (n = :Last or n = :LastOccurrence))

			return This.FindLastOccurrenceCS(pItem, nStart, pCaseSensitive)

		ok

		if isList(pItem) and Q(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pnStartingAt) and Q(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if NOT Q([ n, pnStartingAt]).BothAreNumbers()
			StzRaise("Incorrect param type! n and pnStartingAt must be numbers.")
		ok

		# Early checks (gains performance for large strings)

		if NOT This.ContainsCS(pItem, pCaseSensitive)
			return 0
		ok

		nLen = This.NumberOfItems()

		if (NOT Q(n).IsBetween(1, nLen - pnStartingAt)) or
		   (NOT Q(pnStartingAt).IsBetween(1, nLen - n))

			return 0
		ok

		if n = nLen and
		   This.LastItemQ().IsEqualToCS(pItem, pCaseSensitive)
			return nLen
		ok

		# Doing the job

		nResult  = This.SectionQ(pnStartingAt, nLen).
				FindNthCS(n, pItem, pCaseSensitive)

		if nResult != 0
			nResult += pnStartingAt - 1
		ok

		return nResult


*/
		if isList(pItem) and Q(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pnStartingAt) and Q(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		# Doing the job

		nResult = This.SectionQ(pnStartingAt + 1, This.NumberOfItems()).
			FindNthCS(n, pItem, pCaseSensitive) + pnStartingAt

		return nResult

		#< @FunctionAlternativeForms

		def FindNextNthOccurrenceCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthNextOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def NthNextOccurrenceCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthNextOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def NextNthOccurrenceCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthNextOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def FindNextNthCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthNextOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def FindNthNextCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthNextOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		#--

		def FindNthNextOccurrenceSCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthNextOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def FindNextNthOccurrenceSCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthNextOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def NthNextOccurrenceSCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthNextOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def NextNthOccurrenceSCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthNextOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def FindNextNthSCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthNextOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def FindNthNextSCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthNextOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindNthNextOccurrence( n, pItem, nStart )
		return This.FindNthNextOccurrenceCS( n, pItem, nStart, :CaseSensitive = TRUE )

		#< @FunctionAlternativeForms

		def FindNextNthOccurrence( n, pItem, nStart )
			return This.FindNthNextOccurrence( n, pItem, nStart )

		def NthNextOccurrence( n, pItem, nStart )
			return This.FindNthNextOccurrence( n, pItem, nStart )

		def NextNthOccurrence( n, pItem, nStart )
			return This.FindNthNextOccurrence( n, pItem, nStart )

		def FindNextNth( n, pItem, nStart )
			return This.FindNthNextOccurrence( n, pItem, nStart )

		def FindNthNext( n, pItem, nStart )
			return This.FindNthNextOccurrence( n, pItem, nStart )

		#--

		def FindNthNextOccurrenceS( n, pItem, nStart )
			return This.FindNthNextOccurrence( n, pItem, nStart )

		def FindNextNthOccurrenceS( n, pItem, nStart )
			return This.FindNthNextOccurrence( n, pItem, nStart )

		def NthNextOccurrenceS( n, pItem, nStart )
			return This.FindNthNextOccurrence( n, pItem, nStart )

		def NextNthOccurrenceS( n, pItem, nStart )
			return This.FindNthNextOccurrence( n, pItem, nStart )

		def FindNextNthS( n, pItem, nStart )
			return This.FindNthNextOccurrence( n, pItem, nStart )

		def FindNthNextS( n, pItem, nStart )
			return This.FindNthNextOccurrence( n, pItem, nStart )

		#>

	   #-----------------------------------------------------#
	  #      FINDING NTH PREVIOUS OCCURRENCE OF AN ITEM     #
	 #      STARTING AT A GIVEN POSITION                   #
	#-----------------------------------------------------#

	def FindNthPreviousOccurrenceCS(n, pItem, nStart, pCaseSensitive)

		# Resolving params

		if isList(pItem) and Q(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(nStart) and Q(nStart).IsStartingAtNamedParam()
			nStart = nStart[2]
		ok

		# Resolving params

		if isList(pItem) and Q(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(nStart) and Q(nStart).IsStartingAtNamedParam()
			nStart = nStart[2]
		ok

		if NOT Q([n, nStart]).BothAreNumbers()
			StzRaise("Incorrect param type! n and nStart must be numbers.")
		ok

		# Early checks (gains performance for large strings)
		# Very quick on small to medium lists (thousands of item)
		# Takes half a second on a list of +150K hybrid items

		if NOT This.ContainsCS(pItem, pCaseSensitive)
			return 0
		ok

		nLen = This.NumberOfItems()

		if (NOT Q(n).IsBetween(1, nLen - 1)) or
		   (NOT Q(nStart).IsBetween(n + 1, nLen))

			return 0
		ok

		# The following check is very quick, even for
		# large lists (less then 0.01s)

		if n = nLen and
		   This.FirstItemQ().IsEqualToCS(pItem, pCaseSensitive)
			return nLen
		ok

		# Doing full check

		# Until this point, elapsed time approches 0.80 second
		# in parsing a list of +150K hynrid items

		# For the same list, the following check take about 2.76 seconds

		nPos = This.SectionQ(nStart, 1).ReverseQ().
			    FindNthCS(n, pItem, pCaseSensitive)

		if nPos != 0
			nResult = (1 + nStart) - nPos
		else
			nResult = 0
		ok

		return nResult

		#< @FunctionAlternativeForms

		def FindPreviousNthOccurrenceCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthPreviousOccurrenceCS( n, pItem, nStart, pCaseSensitive )
	
		def PreviousNthOccurrenceCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthPreviousOccurrenceCS( n, pItem, nStart, pCaseSensitive )
	
		def NthPreviousOccurrenceCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthPreviousOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def FindPreviousNthCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthPreviousOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def FindNthPreviousCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthPreviousOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		#--

		def FindNthPreviousOccurrenceSCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthPreviousOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def FindPreviousNthOccurrenceSCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthPreviousOccurrenceCS( n, pItem, nStart, pCaseSensitive )
	
		def PreviousNthOccurrenceSCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthPreviousOccurrenceCS( n, pItem, nStart, pCaseSensitive )
	
		def NthPreviousOccurrenceSCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthPreviousOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def FindPreviousNthSCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthPreviousOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		def FindNthPreviousSCS( n, pItem, nStart, pCaseSensitive )
			return This.FindNthPreviousOccurrenceCS( n, pItem, nStart, pCaseSensitive )

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindNthPreviousOccurrence(n, pItem, nStart)
		return This. FindNthPreviousOccurrenceCS(n, pItem, nStart, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindPreviousNthOccurrence( n, pItem, nStart )
			return This.FindNthPreviousOccurrence( n, pItem, nStart )
	
		def PreviousNthOccurrence( n, pItem, nStart )
			return This.FindNthPreviousOccurrence( n, pItem, nStart )
	
		def NthPreviousOccurrence( n, pItem, nStart )
			return This.FindNthPreviousOccurrence( n, pItem, nStart )

		def FindPreviousNth( n, pItem, nStart )
			return This.FindNthPreviousOccurrence( n, pItem, nStart )

		def FindNthPrevious( n, pItem, nStart )
			return This.FindNthPreviousOccurrence( n, pItem, nStart )

		#--

		def FindNthPreviousOccurrenceS( n, pItem, nStart )
			return This.FindNthPreviousOccurrence( n, pItem, nStart )

		def FindPreviousNthOccurrenceS( n, pItem, nStart )
			return This.FindNthPreviousOccurrence( n, pItem, nStart )
	
		def PreviousNthOccurrenceS( n, pItem, nStart )
			return This.FindNthPreviousOccurrence( n, pItem, nStart )
	
		def NthPreviousOccurrenceS( n, pItem, nStart )
			return This.FindNthPreviousOccurrence( n, pItem, nStart )

		def FindPreviousNthS( n, pItem, nStart )
			return This.FindNthPreviousOccurrence( n, pItem, nStart )

		def FindNthPreviousS( n, pItem, nStart )
			return This.FindNthPreviousOccurrence( n, pItem, nStart )


		#>

	   #---------------------------------------------#
	  #      FINDING NEXT OCCURRENCE OF AN ITEM     #
	 #      STARTING AT A GIVEN POSITION           #
	#---------------------------------------------#

	def FindNextOccurrenceCS(pItem, pnStartingAt, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzList([ 1, 2, 3, "*", 5, 6, "*", 8, 9 ])
		? o1.FindNext("*", :StartingAt = 4)
		#--> 7

		*/

		if isList(pItem) and Q(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pnStartingAt) and Q(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		nResult = This.SectionQ(pnStartingAt + 1, :Last).
			FindFirstCS(pItem, pCaseSensitive)

		if nResult != 0
			nResult += pnStartingAt
		ok

		return nResult

		#< @FunctionAlternativeForms

		def FindNextCS( pItem, nStart, pCaseSensitive )
			return This.FindNextOccurrenceCS(pItem, nStart, pCaseSensitive)

		def NextOccurrenceCS( pItem, nStart, pCaseSensitive )
			return This.FindNextOccurrenceCS(pItem, nStart, pCaseSensitive)

		#--

		# Here I use _ to distinguish the function with FindNextOccurrencesCS(panPos,CS)
		def FindNextOccurrence_SCS(pItem, nStart, pCaseSensitive)
			return This.FindNextOccurrenceCS(pItem, nStart, pCaseSensitive)

		def FindNextSCS( pItem, nStart, pCaseSensitive )
			return This.FindNextOccurrenceCS(pItem, nStart, pCaseSensitive)

		def NextOccurrence_SCS( pItem, nStart, pCaseSensitive )
			return This.FindNextOccurrenceCS(pItem, nStart, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindNextOccurrence(pItem, nStart)
		nResult = This.FindNextOccurrenceCS(pItem, nStart, :CaseSensitive = TRUE)
		return nResult

		#< @FunctionAlternativeForms

		def FindNext( pItem, nStart )
			return This.FindNextOccurrence(pItem, nStart)

		def NextOccurrence( pItem, nStart )
			return This.FindNextOccurrence(pItem, nStart)

		#--

		# Here I use _ to distinguish the function with FindNextOccurrences(panPos)
		def FindNextOccurrence_S(pItem, nStart)
			return This.FindNextOccurrence(pItem, nStart)

		def FindNextS( pItem, nStart )
			return This.FindNextOccurrence(pItem, nStart)

		def NextOccurrence_S( pItem, nStart )
			return This.FindNextOccurrence(pItem, nStart)

		#>

	   #-------------------------------------------------#
	  #      FINDING PREVIOUS OCCURRENCE OF AN ITEM     #
	 #      STARTING FROM A GIVEN POSITION N           #
	#-------------------------------------------------#

	def FindPreviousOccurrenceCS(pItem, pnStartingAt, pCaseSensitive)

		/* EXAMPLE

		o1 = new stzList([ 1, 2, 3, "*", 5, 6, "*", 8, 9 ])
		? o1.FindPrevious("*", :StartingAt = 7)
		#--> 7

		*/


		if isList(pItem) and Q(pItem).IsOfNamedParam()
			pItem = pItem[2]
		ok

		if isList(pnStartingAt) and Q(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		nResult = This.SectionQ(1, pnStartingAt - 1).
			FindLastCS(pItem, pCaseSensitive)

		return nResult

		#< @FunctionAlternativeForms

		def FindPreviousCS( pItem, nStart, pCaseSensitive )
			return This.FindPreviousOccurrenceCS(pItem, nStart, pCaseSensitive)

		def PreviousOccurrenceCS( pItem, nStart, pCaseSensitive )
			return This.FindPreviousOccurrenceCS(pItem, nStart, pCaseSensitive)

		#--

		def FindPreviousOccurrence_SCS(pItem, nStart, pCaseSensitive)
			return This.FindPreviousOccurrenceCS(pItem, nStart, pCaseSensitive)

		def FindPreviousSCS( pItem, nStart, pCaseSensitive )
			return This.FindPreviousOccurrenceCS(pItem, nStart, pCaseSensitive)

		def PreviousOccurrence_SCS( pItem, nStart, pCaseSensitive )
			return This.FindPreviousOccurrenceCS(pItem, nStart, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindPreviousOccurrence(pItem, nStart)
		return This.FindPreviousOccurrenceCS(pItem, nStart, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindPrevious( pItem, nStart )
			return This.FindPreviousOccurrence(pItem, nStart)

		def PreviousOccurrence( pItem, nStart )
			return This.FindPreviousOccurrence(pItem, nStart)

		#--

		def FindPreviousOccurrence_S(pItem, nStart)
			return This.FindPreviousOccurrence(pItem, nStart)

		def FindPreviousS( pItem, nStart )
			return This.FindPreviousOccurrence(pItem, nStart)

		def PreviousOccurrence_S( pItem, nStart )
			return This.FindPreviousOccurrence(pItem, nStart)

		#>

	   #-----------------------------------------#
	  #   FINDING NEXT OCCURRENCES OF AN ITEM   #
	 #   STARTING AT A GIVEN POSITION          #
	#-----------------------------------------#

	def FindNextOccurrencesCS(pItem, pnStartingAt, pCaseSensitive)
		if isList(pnStartingAt) and Q(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if Q(pnStartingAt).IsOneOfTheseCS([
				:First, :FirstItem ], :CS = FALSE)

				pnStartingAt = 1
			
			but Q(pnStartingAt).IsOneOfTheseCS([
				:Last, :LastItem ], :CS = FALSE)

				pnStartingAt = This.NumberOfItems()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			StzRaise("Incorrect param! pnStartingAt must be a number.")
		ok

		oSection = This.SectionQ(pnStartingAt, :LastItem)

		anPositions = oSection.FindAllCS(pItem, pCaseSensitive)
		
		anResult = StzListOfNumbersQ(anPositions).
			   AddToEachQ(pnStartingAt - 1 ).
			   Content()

		return anResult

		#< @FunctionAlternativeForms

		def NextOccurrencesCS(pItem, pnStartingAt, pCaseSensitive)
			return This.FindNextOccurrencesCS(pItem, pnStartingAt, pCaseSensitive)

		#--

		def FindNextOccurrencesSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.FindNextOccurrencesCS(pItem, pnStartingAt, pCaseSensitive)

		def NextOccurrencesSCS(pItem, pnStartingAt, pCaseSensitive)
			return This.FindNextOccurrencesCS(pItem, pnStartingAt, pCaseSensitive)

		#>
		
	#-- WITHOUT CASESENSITIVITY

	def FindNextOccurrences(pItem, pnStartingAt)
		return This.FindNextOccurrencesCS(pItem, pnStartingAt, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def NextOccurrences(pItem, pnStartingAt)
			return This.FindNextOccurrences(pItem, pnStartingAt)

		#--

		def FindNextOccurrencesS(pItem, pnStartingAt)
			return This.FindNextOccurrences(pItem, pnStartingAt)

		def NextOccurrencesS(pItem, pnStartingAt)
			return This.FindNextOccurrences(pItem, pnStartingAt)

		#>

	   #---------------------------------------------#
	  #   FINDING PREVIOUS OCCURRENCES OF AN ITEM   #
	 #   STARTING AT A GIVEN POSITION              #
	#---------------------------------------------#

	def FindPreviousOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)
		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if Q(pnStartingAt).IsOneOfTheseCS([
				:First, :FirstItem ], :CS = FALSE)

				pnStartingAt = 1
			
			but Q(pnStartingAt).IsOneOfTheseCS([
				:Last, :LastItem ], :CS = FALSE)

				pnStartingAt = This.NumberOfItems()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			StzRaise("Incorrect param! pnStartingAt must be a number.")
		ok

		oSection = This.SectionQ(1, pnStartingAt)

		anPositions = oSection.FindAllCS(pcSubStr, pCaseSensitive)
		
		return anPositions

		#< @FunctionAlternativeForm

		def FindPreviousOccurrencesSCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindPreviousOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)

		#>

	def FindPreviousOccurrences(pcSubStr, pnStartingAt)
		return This.FindPreviousOccurrencesCS(pcSubStr, pnStartingAt, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def FindPreviousOccurrencesS(pcSubStr, pnStartingAt)
			return This.FindPreviousOccurrences(pcSubStr, pnStartingAt)

		#>

	  #===================================================#
	 #   FINDING ALL ITEMS VERIFYING A GIVEN CONDITION   #
	#===================================================#

	def FindAllItemsW(pcCondition)
		/*
		pcCondition can only contain the @i and This[@i...] keywords.
		@NextItem, @PreviousItem, @item ans so on can not be used.

		This is always the better option to take if you want a more
		performant code.

		If you want to be more expressive and include them in your
		pccondition string, use FindWXT() instead. 

		WARNING

		We can't use this solution:

			anPositions = This.YieldW('@position', pcCondition)
			return anPositions

		because YieldW() uses the current function FindW() --> Stackoverfolw!
		*/
		
		# Managing params

		if isList(pcCondition) and Q(pcCondition).IsWhereNamedParam()
			pcCondition = pcCondition[2]
		ok

		if NOT isString(pcCondition)
			StzRaise("Incorrect param! pcCondition must be a string.")
		ok

		# Identifying the executable section
		nLen = This.NumberOfItems()
		aExecutableSection = StzCCodeQ(pcCondition).ExecutableSection()

		nStart = aExecutableSection[1]
		nEnd   = aExecutableSection[2]

		if nEnd < 0
			nEnd += nLen
		but nEnd = :Last
			nEnd = nLen
		ok

		cCode = 'bOk = (' + Q(pcCondition).TrimQ().BoundsRemoved(["{","}"]) + ')'

		anResult = []

		for @i = nStart to nEnd
			eval(cCode)
			if bOk
				anResult + @i
			ok
		next

		return anResult
		
		#< @FunctionAlternativeForms

		def FindAllW(pCondition)
			return This.FindAllItemsW(pCondition)

		def FindW(pCondition)
			aResult = This.FindAllItemsW(pCondition)
			return aResult

		def FindWhere(pCondition)
			return This.FindAllItemsW(pCondition)

		def FindAllWhere(pCondition)
			return This.FindAllItemsW(pCondition)

		def FindAllItemsWhere(pCondition)
			return This.FindAllItemsW(pCondition)

		def FindItemsW(pCondition)
			return This.FindAllItemsW(pCondition)

		def FindItemsWhere(pCondition)
			return This.FindAllItemsW(pCondition)

		def ItemsPositionsW(pCondition)
			return This.FindAllItemsW(pCondition)

		def ItemsPositionsWhere(pCondition)
			return This.FindAllItemsW(pCondition)

		def PositionsW(pCondition)
			return This.FindAllItemsW(pCondition)

		def PositionsOfItemsW(pCondition)
			return This.FindAllItemsW(pCondition)

		def PositionsWhere(pCondition)
			return This.FindAllItemsW(pCondition)

		def PositionsOfItemsWhere(pCondition)
			return This.FindAllItemsW(pCondition)

	#>

	  #--------------------------------------------------------------#
	 #  FINDING FIRST ITEM VERIFYING A GIVEN CONDITION -- EXTENDED  #
	#--------------------------------------------------------------#
	# Condditional code can contain keywords other then This[@i],
	# like @NextItem, @PreviousItem etc.

	def FindAllItemsWXT(pcCondition)
		
		# Managing params

		if isList(pcCondition) and Q(pcCondition).IsWhereNamedParam()
			pcCondition = pcCondition[2]
		ok

		if NOT isString(pcCondition)
			StzRaise("Incorrect param! pcCondition must be a string.")
		ok

		# Identifying the executable section

		nLen = This.NumberOfItems()
		cCode = StzCCodeQ(pcCondition).Transpiled()

		aExecutableSection = StzCCodeQ(cCode).ExecutableSectionXT()

		nStart = aExecutableSection[1]
		nEnd   = aExecutableSection[2]

		if nEnd < 0
			nEnd += nLen
		but nEnd = :Last
			nEnd = nLen
		ok

		cCode = 'bOk = (' + Q(cCode).TrimQ().BoundsRemoved(["{","}"]) + ')'
		anResult = []

		for @i = nStart to nEnd
			eval(cCode)
			if bOk
				anResult + @i
			ok
		next

		return anResult
		
		#< @FunctionAlternativeForms

		def FindAllWXT(pCondition)
			return This.FindAllItemsWXT(pCondition)

		def FindWXT(pCondition)
			return This.FindAllItemsWXT(pCondition)

		def FindWhereXT(pCondition)
			return This.FindAllItemsWXT(pCondition)

		def FindAllWhereXT(pCondition)
			return This.FindAllItemsWXT(pCondition)

		def FindAllItemsWhereXT(pCondition)
			return This.FindAllItemsWXT(pCondition)

		def FindItemsWXT(pCondition)
			return This.FindAllItemsWXT(pCondition)

		def FindItemsWhereXT(pCondition)
			return This.FindAllItemsWXT(pCondition)

		def ItemsPositionsWXT(pCondition)
			return This.FindAllItemsWXT(pCondition)

		def ItemsPositionsWhereXT(pCondition)
			return This.FindAllItemsWXT(pCondition)

		def PositionsWXT(pCondition)
			return This.FindAllItemsWXT(pCondition)

		def PositionsOfItemsWXT(pCondition)
			return This.FindAllItemsWXT(pCondition)

		def PositionsWhereXT(pCondition)
			return This.FindAllItemsWXT(pCondition)

		def PositionsOfItemsWhereXT(pCondition)
			return This.FindAllItemsWXT(pCondition)

	#>

	  #--------------------------------------------------#
	 #  FINDING FIRST ITEM VERIFYING A GIVEN CONDITION  #
	#--------------------------------------------------#

	def FindFirstW(pcCondition)
		return This.FindNthW(1, pcCondition)

		def FindFirstItemW(pcCondition)
			return This.FindFirstW(pcCondition)

		def FindFirstOccurrenceW(pcCondition)
			return This.FindFirstW(pcCondition)

	  #-------------------------------------------------#
	 #  FINDING LAST ITEM VERIFYING A GIVEN CONDITION  #
	#-------------------------------------------------#

	def FindLastW(pcCondition) # TODO: Check for performance
		nLastW = This.NumberOfOccurrencesW(pcCondition)
		return FindNthW(nLastW , pcCondition)

		def FindLastItemW(pcCondition)
			return This.FindLastW(pcCondition)

		def FindLastOccurrenceW(pcCondition)
			return This.FindLastW(pcCondition)

	  #------------------------------------------------#
	 #  FINDING NTH ITEM VERIFYING A GIVEN CONDITION  #
	#------------------------------------------------#

	def FindNthW(n, pcCondition)

		anTemp = This.FindW(pcCondition)
		nLen = len(anTemp)

		if isString(n)
			if ( n = :First or n = :FirstOccurrence )
				n = 1

			but ( n = :Last or n = :LastOccurrence )
				n = nLen
			ok
		ok

		nResult = 0

		if nLen > 0
			nResult = anTemp[n]
		ok

		return nResult

		def FindNthItemW(pcCondition)
			return This.FindNthW(n, pcCondition)

		def FindNthOccurrenceW(pcCondition)
			return This.FindNthW(n, pcCondition)

	  #------------------------------------------------------------#
	 #  FINDING NTH ITEM VERIFYING A GIVEN CONDITION -- EXTENDED  #
	#------------------------------------------------------------#

	def FindNthWXT(n, pcCondition)

		anTemp = This.FindWXT(pcCondition)
		nLen = len(anTemp)

		if isString(n)
			if ( n = :First or n = :FirstOccurrence )
				n = 1

			but ( n = :Last or n = :LastOccurrence )
				n = nLen
			ok
		ok

		nResult = 0

		if nLen > 0
			nResult = anTemp[n]
		ok

		return nResult

		def FindNthItemWXT(pcCondition)
			return This.FindNthWXT(n, pcCondition)

		def FindNthOccurrenceWXT(pcCondition)
			return This.FindNthWXT(n, pcCondition)

	  #--------------------------------------------------------------#
	 #  FINDING FIRST ITEM VERIFYING A GIVEN CONDITION -- EXTENDED  #
	#--------------------------------------------------------------#

	def FindFirstWXT(pcCondition)
		return This.FindNthWXT(1, pcCondition)

		def FindFirstItemWXT(pcCondition)
			return This.FindFirstWXT(pcCondition)

		def FindFirstOccurrenceWXT(pcCondition)
			return This.FindFirstWXT(pcCondition)

	  #-------------------------------------------------------------#
	 #  FINDING LAST ITEM VERIFYING A GIVEN CONDITION -- EXTENDED  #
	#-------------------------------------------------------------#

	def FindLastWXT(pcCondition) # TODO: Check for performance
		n = This.NumberOfItemsW(pcCondition)
		return FindNthWXT(n, pcCondition)

		def FindLastItemWXT(pcCondition)
			return This.FindLastWXT(pcCondition)

		def FindLastOccurrenceWXT(pcCondition)
			return This.FindLastWXT(pcCondition)

	  #===================================================#
	 #  INFERING SECTION'S ITEMS FROM THE PROVIDED FORM  #
	#===================================================#

	/* NOTE

	For the mean time, this function is used to translate the section
	returned from the StzCCodeQ().ExecutableSection method, to fill
	it with the actual values of the current list.

	So, for example, if the lists has 10 items:

		--> [ 1, :Last ] is transformed to [ 1, 10 ]
		--> [ 2, -3 ] is transformed to [ 2, 7)
		--> Etc.

	TODO: In the future, it can be used to tranform all other forms used
	to create a section, sutch as [ :From = ..., :To = ... ].

	*/
	
	def InfereSection(paSection)
		aResult = []
		nStart = paSection[1]
		
		if nStart < 0
			nStart = This.NumberOfItems() - Abs(nStart) + 1
		ok

		nEnd = paSection[2]
		if isString(nEnd) and nEnd = :Last
			nEnd = This.NumberOfItems()
		ok

		if nEnd < 0
			nEnd = This.NumberOfItems() - Abs(nEnd) + 1
		ok

		aResult = [nStart, nEnd]
		return aResult

  	  #======================================#
	 #   GETTING ITEMS AT GIVEN POSITIONS   #
	#======================================#

	def ItemsAtPositions(panPos)
		if NOT isList(panPos) and Q(panPos).IsListOfNumbers()
			StzRaise("Incorrect param type! panPos must be a list of numbers.")
		ok

		aResult = []
		nLen = len(panPos)
		aContent = This.List()

		for i = 1 to nLen
			aResult + aContent[panPos[i]]
		next

		return aResult

		#< @FunctionFluentForms

		def ItemsAtPositionsQ(panPos)
			return This.ItemsAtPositionsQR(panPos, :stzList)

		def ItemsAtPositionsQR(panPos, pcReturnType)
			switch pcReturnType
			on :stzList
				return new stzList( This.ItemsAtPositions(panPos) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.ItemsAtPositions(panPos) )

			on :stzListOfStrings
				return new stzListOfStrings( This.ItemsAtPositions(panPos) )

			on :stzListOfLists
				return new stzListOfLists( This.ItemsAtPositions(panPos) )

			on :stzListOfObjects
				return new stzListOfObjects( This.ItemsAtPositions(panPos) )

			on :stzListOfPairs
				return new stzListOfPairs( This.ItemsAtPositions(panPos) )

			on :stzListOfHashLists
				return new stzListOfHashLists( This.ItemsAtPositions(panPos) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def AllItemsAtPositions(panPos)
			return This.ItemsAtPositions(panPos)

		def ItemsAtThesePositions(panPos)
			return This.ItemsAtPositions(panPos)

		def AllItemsAtThesePositions(panPos)
			return This.ItemsAtPositions(panPos)

		def ItemsAt(panPos)
			return This.ItemsAtPositions(panPos)

		def AllItemsAt(panPos)
			return This.ItemsAtPositions(panPos)

		#>

	  #----------------------------------------------#
	 #   GETTING ITEMS OUTSIDE THE GIVEN POSITIONS  #
	#----------------------------------------------#

	def ItemsOutsidePositions(panPos)
		if NOT isList(panPos) and Q(panPos).IsListOfNumbers()
			StzRaise("Incorrect param type! panPos must be a list of numbers.")
		ok

		panPos = ( Q( 1 : This.NumberOfItems ) - panPos ).Content()
		aResult = This.ItemsAtPositions(panPos)

		return aResult

		#< @FunctionFluentForms

		def ItemsOutsidePositionsQ(panPos)
			return This.ItemsOutsidePositionsQR(panPos, :stzList)

		def ItemsOutsidePositionsQR(panPos, pcReturnType)
			switch pcReturnType
			on :stzList
				return new stzList( This.ItemsOutsidePositions(panPos) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.ItemsOutsidePositions(panPos) )

			on :stzListOfStrings
				return new stzListOfStrings( This.ItemsOutsidePositions(panPos) )

			on :stzListOfLists
				return new stzListOfLists( This.ItemsOutsidePositions(panPos) )

			on :stzListOfObjects
				return new stzListOfObjects( This.ItemsOutsidePositions(panPos) )

			on :stzListOfPairs
				return new stzListOfPairs( This.ItemsOutsidePositions(panPos) )

			on :stzListOfHashLists
				return new stzListOfHashLists( This.ItemsOutsidePositions(panPos) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def AllItemsOutsidePositions(panPos)
			return This.ItemsOutsidePositions(panPos)

		def ItemsOutsideThesePositions(panPos)
			return This.ItemsOutsidePositions(panPos)

		def AllItemsOutsideThesePositions(panPos)
			return This.ItemsOutsidePositions(panPos)

		def ItemsOutside(panPos)
			return This.ItemsOutsidePositions(panPos)

		def AllItemsOutside(panPos)
			return This.ItemsOutsidePositions(panPos)

		def AllItemsAtPositionsOtherThan(panPos)
			return This.ItemsOutsidePositions(panPos)

			def AllItemsAtPositionsOtherThen(panPos)
				return This.ItemsOutsidePositions(panPos)

		#--

		def AllItemsNotAtPositions(panPos)
			return This.ItemsOutsidePositions(panPos)

		def ItemsNotAtThesePositions(panPos)
			return This.ItemsOutsidePositions(panPos)

		def AllItemsNotAtThesePositions(panPos)
			return This.ItemsOutsidePositions(panPos)

		def ItemsNotAt(panPos)
			return This.ItemsOutsidePositions(panPos)

		def AllItemsNotAt(panPos)
			return This.ItemsOutsidePositions(panPos)

		def ItemsAtPositionsOtherThan(panPos)
			return This.ItemsOutsidePositions(panPos)

			def ItemsAtPositionsOtherThen(panPos)
				return This.ItemsOutsidePositions(panPos)

		#>

	  #===============================================#
	 #   GETTING ITEMS VERIFYING A GIVEN CONDITION   #
	#===============================================#

	/*
	Note the semantic difference between "Getting" items, and "Finding" items.
		-> Getting items return the items themselves, while
		-> Finding items return their positions as numbers
		-> Their sections can also be found using FindAsSection()
	*/

	def ItemsW(pcCondition)
		/* WARNING

		Do not use this solution:

			return This.YieldW('@item', pcCondition)

		--> Stackoverflow!
		*/

		anPositions = This.FindAllItemsW(pcCondition)
		aResult = This.ItemsAtThesePositions(anPositions)

		return aResult

		#< @FunctionFluentForms

		def ItemsWQ(pcCondition)
			return ItemsWQR(pcCondition, :stzList)

		def ItemsWQR(pcCondition, pcReturnType)
			if isList(pcCondition) and Q(pcCondition).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			if NOT (isString(pcReturnType) and Q(pcReturnType).IsStzType() )
				StzRaise("Incorrect param type! pcCondition must be a string containing a Softanza type.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.ItemsW(pcCondition) )

			on :stzListOfStrings
				return new stzListOfStrings( This.ItemsW(pcCondition) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.ItemsW(pcCondition) )
			
			on :stzListOfLists
				return new stzListOfLists( This.ItemsW(pcCondition) )

			on :stzListOfObjects
				return new stzListOfObjects( This.ItemsW(pcCondition) )

			on :stzListOfPairs
				return new stzListOfPairs( This.ItemsW(pcCondition) )

			on :stzListOfHashLists
				return new stzListOfHashLists( This.ItemsW(pcCondition) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def OnlyW(pcCondition)
			return This.ItemsW(pcCondition)

		#--

		def ItemsWhere(pcCondition)
			return This.ItemsW(pcCondition)
	
		def OnlyWhere(pcCondition)
			return This.ItemsW(pcCondition)

		#>

	  #-----------------------------------------------------------------#
	 #  GETTINIG THE NTH ITEM IN THE LIST VERIFYING A GIVEN CONDITION  #
	#-----------------------------------------------------------------#

	def NthItemW(n, pcCondition)

		cResult = ItemsW(pcCondition)[n]
		return cResult

		#< @FunctionFluentForm

		def NthItemWQ(n, pCondition)
			item = This.NthItemW(n, pCondition)

			switch ring_type(item)
			on "NUMBER"
				return new stzNumber(item)

			on "STRING"
				return new stzString(item)

			on "LIST"
				return new stzList(item)

			on "OBJECT"
				return new stzObject(item)

			other
				StzRaise("Unsupported type!")
			off

		#>

		#< @FunctionAlternativeForm

		def NthItemWhere(n, pcCondition)
			return This.NthItemW(n, pcCondition)

			def NthItemWhereQ(n, pcCondition)
				return This.NthItemWQ(n, pCondition)

		#>
		
	  #-------------------------------------------------------------------#
	 #  GETTINIG THE FIRST ITEM IN THE LIST VERIFYING A GIVEN CONDITION  #
	#-------------------------------------------------------------------#

	def FirstItemW(pCondition)
		return This.NthItemWhere(1, pCondition)

		#< @FunctionFluentForm

		def FirstItemWQ(pCondition)
			item = This.FirstItemW(pCondition)

			switch ring_type(item)

			on "NUMBER"
				return new stzNumber(item)

			on "STRING"
				return new stzString(item)

			on "LIST"
				return new stzList(item)

			on "OBJECT"
				return new stzObject(item)

			other
				StzRaise("Unsupported type!")
			off

		#>

	  #------------------------------------------------------------------#
	 #  GETTINIG THE LAST ITEM IN THE LIST VERIFYING A GIVEN CONDITION  #
	#------------------------------------------------------------------#

	def LastItemW(pCondition)
		return This.ItemsW(pCondition)[ len(This.ItemsW(pCondition)) ]

		#< @FunctionFluentForm

		def LastItemWQ(pCondition)
			item = This.LastItemW(pCondition)

			switch ring_type(item)

			on "NUMBER"
				return new stzNumber(item)

			on "STRING"
				return new stzString(item)

			on "LIST"
				return new stzList(item)

			on "OBJECT"
				return new stzObject(item)

			other
				StzRaise("Unsupported type!")
			off

		#>

	  #----------------------------------------------------------#
	 #   GETTING ITEMS VERIFYING A GIVEN CONDITION -- EXTENDED  #
	#----------------------------------------------------------#

	/* NOTE
	A Less performant alternative to ItemsW() function.
	Provides transpiling and executable section features.

	UPDATE: I think this was fixed and the olny one to use is
	the normal ItemsW()..
	--> TODO: If so, remove this function!

	*/

	def ItemsWXT(pcCondition)
		/* WARNING

		Do not use this solution:

			return This.YieldWXT('@item', pcCondition)

		--> Stackoverflow!
		*/

		anPositions = This.FindAllItemsWXT(pcCondition)
		aResult = This.ItemsAtThesePositions(anPositions)

		return aResult

		def ItemsWXTQ(pcCondition)
			return ItemsWXTQR(pcCondition, :stzList)

		def ItemsWXTQR(pcCondition, pcReturnType)
			if isList(pcCondition) and Q(pcCondition).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			if NOT (isString(pcReturnType) and Q(pcReturnType).IsStzType() )
				StzRaise("Incorrect param type! pcCondition must be a string containing a Softanza type.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.ItemsWXT(pcCondition) )

			on :stzListOfStrings
				return new stzListOfStrings( This.ItemsWXT(pcCondition) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.ItemsWXT(pcCondition) )
			
			on :stzListOfLists
				return new stzListOfLists( This.ItemsWXT(pcCondition) )

			on :stzListOfObjects
				return new stzListOfObjects( This.ItemsWXT(pcCondition) )

			on :stzListOfPairs
				return new stzListOfPairs( This.ItemsWXT(pcCondition) )

			on :stzListOfHashLists
				return new stzListOfHashLists( This.ItemsWXT(pcCondition) )

			other
				StzRaise("Unsupported return type!")
			off

			def OnlyWXT(pcCondition)
				return This.ItemsWXT(pcCondition)

			def OnlyWhereXT(pcCondition)
				return This.ItemsWXT(pcCondition)

	def NthItemWXT(n, pcCondition)

		cResult = ItemsWXT(pcCondition)[n]
		return cResult

		#< @FunctionFluentForm

		def NthItemWXTQ(n, pCondition)
			item = This.NthItemWXT(n, pCondition)

			switch ring_type(item)
			on "NUMBER"
				return new stzNumber(item)

			on "STRING"
				return new stzString(item)

			on "LIST"
				return new stzList(item)

			on "OBJECT"
				return new stzObject(item)

			other
				StzRaise("Unsupported type!")
			off

		#>

		#< @FunctionAlternativeForm

		def NthItemWhereXT(n, pcCondition)
			return This.NthItemWXT(n, pcCondition)

			def NthItemWhereXTQ(n, pcCondition)
				return This.NthItemWXTQ(n, pCondition)

		#>
		
	def FirstItemWXT(pCondition)
		return This.NthItemWhereXT(1, pCondition)

		#< @FunctionFluentForm

		def FirstItemWXTQ(pCondition)
			item = This.FirstItemWXT(pCondition)

			switch ring_type(item)

			on "NUMBER"
				return new stzNumber(item)

			on "STRING"
				return new stzString(item)

			on "LIST"
				return new stzList(item)

			on "OBJECT"
				return new stzObject(item)

			other
				StzRaise("Unsupported type!")
			off

		#>

	def LastItemWXT(pCondition)
		return This.ItemsW(pCondition)[ len(This.ItemsWXT(pCondition)) ]

		#< @FunctionFluentForm

		def LastItemWXTQ(pCondition)
			item = This.LastItemWXT(pCondition)

			switch ring_type(item)

			on "NUMBER"
				return new stzNumber(item)

			on "STRING"
				return new stzString(item)

			on "LIST"
				return new stzList(item)

			on "OBJECT"
				return new stzObject(item)

			other
				StzRaise("Unsupported type!")
			off

		#>

	  #======================================================#
	 #   GETTING UNIQUE ITEMS VERIFYING A GIVEN CONDITION   #
	#======================================================#

	def UniqueItemsW(pCondition)

		aResult = This.ItemsWQ(pCondition).ToSet()
		return aResult

		#< @FunctionFluentForm

		def UniqueItemsWQ(pCondition)
			return new stzList( This.UniqueItemsW(pCondition) )

		#>

		#< @FunctionAlternativeForms

		def UniqueItemsWhere(pCondition)
			return This.UniqueItemsW(pCondition)

			def UniqueItemsWhereQ(pCondition)
				return This.UniqueItemsWQ(pCondition)

		def ItemsWithoutDuplicationW(pCondition)
			return This.UniqueItemsW(pCondition)

			def ItemsWithoutDuplicationWQ(pCondition)
				return This.UniqueItemsWQ(pCondition)
		#>

	  #===============================================#
	 #   GETTING ALL ITEMS EXCEPT THE ONE PRPVIDED   #
	#===============================================#

	def AllItemsExceptCS(pItem, pCaseSensitive)
		aResult = This.ItemRemovedCS(pItem, pCaseSensitive)
		return aResult

	#-- WITHOUT CASESENSITIVITY

	def AllItemsExcept(pItem)
		return This.AllItemsExceptCS(pItem, :CaseSensitive = TRUE)

	  #================================================================================#
	 #   GETTING UNIQUE ITEMS VERIFYING A GIVEN CONDITION ALONG WITH THEIR POSITIONS  #
	#================================================================================#

	def ItemsAndTheirPositionsW(pcCondition)
		/* Example
		o1 = new stzList([ "A", "m", "n", "B", "A", "x", "C", "z", "B" ])
		
		? o1.ItemsW('Q(@item).IsUppercase()')
		#--> [ "A", "B", "A", "C", "B" ]
		
		? o1.ItemsPositionsW('Q(@item).IsUppercase()') # Say also o1.FindItemsW(...)
		#--> [ 1, 4, 5, 7, 9 ]
		
		? o1.ItemsAndTheirPositionsW('Q(@item).IsUppercase()')
		#--> [ "A" = [1, 5], "B" = [4, 9], "C" = [7] ]
		*/

		aItems = This.ItemsW(pcCondition)
		anPositions = This.FindItemsW(pcCondition)

		aPairs = StzListQ( aItems ).AssociatedWith( anPositions )
	
		aUniqueItems = StzListQ(aItems).ToSet()

		aResult = []
		anItemPositions = []
		nLenUniqueItems = len(aUniqueItems)

		nLenAPairs = len(aPairs)

		for i = 1 to nLenUniqueItems
			pItem = aUniqueItems[i]
			
			for v = 1 to nLenAPairs
				aPair = aPairs[v]

				if Q(pItem).IsNumberOrString() and Q(aPair[1]).IsNumberOrString()

					if aPair[1] = pItem
						anItemPositions + aPair[2]
					ok

				else
					if Q(aPair[1]).IsStrictlyEqualTo(pItem)
						anItemPositions + aPair[2]
					ok
				ok
			next
			
			aResult + [ pItem, anItemPositions ]
			anItemPositions = []

		next

		return aResult

		def ItemsAndTheirPositionsWhere()
			return This.ItemsAndTheirPositionsW(pcCondition)

	   #======================================================#
	  #   GETTING UNIQUE ITEMS VERIFYING A GIVEN CONDITION 	 #
	 #   ALONG WITH THEIR POSITIONS -- EXTENDED             #
	#======================================================#

	def ItemsAndTheirPositionsWXT(pcCondition)
		/*
		This version is less performant then ItemsAndTheirPositionsW()
		but provides more features, like transpiling the conditional
		code for :stzList and idenfifying the executable section.
		*/

		aItems = This.ItemsWXT(pcCondition)
		anPositions = This.FindItemsWXT(pcCondition)

		aPairs = StzListQ( aItems ).AssociatedWith( anPositions )
	
		aUniqueItems = StzListQ(aItems).ToSet()

		aResult = []
		anItemPositions = []
		nLenUniqueItems = len(aUniqueItems)

		nLenAPairs = len(aPairs)

		for i = 1 to nLenUniqueItems
			pItem = aUniqueItems[i]
			
			for v = 1 to nLenAPairs
				aPair = aPairs[v]

				if Q(pItem).IsNumberOrString() and Q(aPair[1]).IsNumberOrString()

					if aPair[1] = pItem
						anItemPositions + aPair[2]
					ok

				else
					if Q(aPair[1]).IsStrictlyEqualTo(pItem)
						anItemPositions + aPair[2]
					ok
				ok
			next
			
			aResult + [ pItem, anItemPositions ]
			anItemPositions = []

		next

		return aResult

		def ItemsAndTheirPositionsWhereXT()
			return This.ItemsAndTheirPositionsW(pcCondition)

	  #=================================#
	 #   GETTING ITEMS OF TYPE NUMBER  #
	#=================================#

	def NumberOfNumbers()
		return len( This.Numbers() )

		def CountNumbers()
			return This.NumberOfNumbers()

		def HowManyNumers()
			return This.NumberOfNumbers()

		def HowManyNumer()
			return This.NumberOfNumbers()

	def FindNumbers()
		aContent = This.Content()
		nLen = len(acontent)
		aResult = []

		for i = 1 to nLen
			if isNumber(aContent[i])
				aResult + i
			ok
		next
		
		return aResult		

	def Numbers()
		/* WARNING

		Do not use this solution:

			return This.ItemsW('isNumber(@item)')

		#--> Stackovervlow!
		*/

		aContent = This.COntent()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if isNumber(aContent[i])
				aResult + aContent[i]
			ok
		next

		return aResult

		#< @FunctionFluentForm

		def NumbersQ()
			return This.NumbersQR(:stzList)

		def NumbersQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.Numbers() )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.Numbers() )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForm

		def OnlyNumbers()
			return This.Numbers()

			def OnlyNumbersQ()
				return This.OnlyNumbersQR(:stzList)
	
			def OnlyNumbersQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.OnlyNumbers() )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.OnlyNumbers() )
	
				other
					StzRaise("Unsupported return type!")
				off

		#>

	def FindNumber(paNumber) # Add case sensitivity

		if CheckParams()
			if NOT isNumber(paNumber)
				StzRaise("Incorrect param type! paNumber must be a list.")
			ok
		ok

		anPos = Q(This.Numbers()).Find(paNumber)
		anResult = []
		if len(anPos) > 0 
			anResult = Q(This.FindNumbers()).ItemsAtPositions(anPos)
		ok

		return anResult

	def NumberZ(paNumber)
		if CheckParams()
			if NOT isNumber(paNumber) 
				StzRaise("Incorrect param type! paNumber must be a list.")
			ok
		ok

		anPos = This.FindNumber(paNumber)
		aResult = [ paNumber, anPos ]	
		return aResult

	def FindTheseNumbers(paNumbers)
		if CheckParams()
			if NOT ( isNumber(paNumbers) and Q(paNumbers).IsNumberOfNumbers() )
				StzRaise("Incorrect param type! paNumbers must be a list of lists.")
			ok
		ok

		paNumbers = U(paNumbers) # Duplicates removed
		nLen = len(paNumbers)
		anResult = []

		for i = 1 to nLen
			anPos = This.FindNumber(paNumbers[i])
			nLenPos = len(anPos)

			for j = 1 to nLenPos
				anResult + anPos[j]
			next
		next

		anResult = ring_sort(anResult)
		return anResult

	def TheseNumbersZ(paNumbers)
		if CheckParams()
			if NOT ( isNumber(paNumbers) and Q(paNumbers).IsNumberOfNumbers() )
				StzRaise("Incorrect param type! paNumbers must be a list of lists.")
			ok
		ok

		nLen = len(paNumbers)
		aResult = []

		for i = 1 to nLen
			aResult + [ paNumbers[i], This.FindNumber(paNumbers[i]) ]
		next

		return aResult

	  #----------------------------------#
	 #   REMOVING ITEMS OF TYPE NUMBER  #
	#----------------------------------#

	def RemoveNumbers()
		This.RemoveItemsAtPositions( This.FindNumbers() )

		def RemoveNumbersQ()
			This.RemoveNumbers()
			return This

		def RemoveOnlyNumbers()
			This.RemoveNumbers()

			def RemoveOnlyNumbersQ()
				This.RemoveOnlyNumbers()
				return This

	def NumbersRemoved()
		aResult = This.Copy().RemoveNumbersQ().Content()
		return aResult

	  #-------------------------------------------#
	 #  GETTING THE NUMBERS AND THEIR POSITIONS  #
	#-------------------------------------------#

	def NumbersZ()
		aContent = This.Content()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if isNumber(aContent[i])
				aResult + [ aContent[i], i ]
			ok
		next

		return aResult

		def NumbersAndTheirPositions()
			return This.NumbersZ()

		def NumbersAndPositions()
			return This.NumbersZ()

	  #----------------------------------------#
	 #   GETTING ITEMS WHICH ARE NOT NUMBERS  #
	#========================================#

	def FindNonNumbers()
		aContent = This.Content()
		nLen = len(acontent)
		aResult = []

		for i = 1 to nLen
			if NOT isNumber(aContent[i])
				aResult + i
			ok
		next
		
		return aResult	

	def NonNumbers()
		aResult = This.ItemsAtPositions( This.FindNonNumbers() )
		return aResult

		def NonNumbersQ()
			return This.NonNumbersQR(:stzList)

		def NonNumbersQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.NonNumbers() )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.NonNumbers() )

			other
				StzRaise("Unsupported return type!")
			off

		def OnlyNonNumbers()
			return This.NonNumbers()

			def OnlyNonNumbersQ()
				return This.OnlyNonNumbersQR(:stzList)
	
			def OnlyNonNumbersQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.OnlyNonNumbers() )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.OnlyNonNumbers() )
	
				other
					StzRaise("Unsupported return type!")
				off

	  #-----------------------------------------#
	 #   REMOVING ITEMS WHICH ARE NOT NUMBERS  #
	#-----------------------------------------#

	def RemoveNonNumbers()
		This.RemoveItemsAtPositions( This.FindNonNumbers() )

		def RemoveNonNumbersQ()
			This.RemoveNonNumbers()
			return This

		def RemoveOnlyNonNumbers()
			This.RemoveNonNumbers()

			def RemoveOnlyNonNumbersQ()
				This.RemoveOnlyNonNumbers()
				return This

		def RemoveAllExceptNumbers()
			This.RemoveNonNumbers()

			def RemoveAllExceptNumbersQ()
				This.RemoveAllExceptNumbers()
				return This
		
	def NonNumbersRemoved()
		aResult = This.Copy().RemoveNonNumbersQ().Content()
		return aResult

	  #-----------------------------------------------#
	 #  GETTING THE NON-NUMBERS AND THEIR POSITIONS  #
	#-----------------------------------------------#

	def NonNumbersZ()
		aContent = This.Content()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if NOT isNumber(aContent[i])
				aResult + [ aContent[i], i ]
			ok
		next

		return aResult

		def NonNumbersAndTheirPositions()
			return This.NonNumbersZ()

		def NonNumbersAndPositions()
			return This.NonNumbersZ()

	  #==============================================#
	 #   GETTING THE STRINGS CONTAINED IN THE LIST  #
	#==============================================#

	def NumberOfStrings()
		return len( This.Strings() )

		def CountStrings()
			return This.NumberOfStrings()

		def HowManyStrings()
			return This.NumberOfStrings()

		def HowManyString()
			return This.NumberOfStrings()

	def FindStrings()
		aContent = This.Content()
		nLen = len(acontent)
		aResult = []

		for i = 1 to nLen
			if isString(aContent[i])
				aResult + i
			ok
		next
		
		return aResult		

	def Strings()
		/* WARNING

		Do not use this solution:

			return This.ItemsW('isString(@item)')

		#--> Stackovervlow!
		*/

		aContent = This.COntent()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if isString(aContent[i])
				aResult + aContent[i]
			ok
		next

		return aResult

		#< @FunctionFluentForm

		def StringsQ()
			return This.StringsQR(:stzList)

		def StringsQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.Strings() )

			on :stzListOfStrings
				return new stzListOfStrings( This.Strings() )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForm

		def OnlyStrings()
			return This.Strings()

			def OnlyStringsQ()
				return This.OnlyStringsQR(:stzList)
	
			def OnlyStringsQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.OnlyStrings() )
	
				on :stzListOfStrings
					return new stzListOfStrings( This.OmlyStrings() )
	
				other
					StzRaise("Unsupported return type!")
				off

		#>

	def FindString(paString) # Add case sensitivity

		if CheckParams()
			if NOT isString(paString)
				StzRaise("Incorrect param type! paString must be a list.")
			ok
		ok

		anPos = Q(This.Strings()).Find(paString)
		anResult = []
		if len(anPos) > 0 
			anResult = Q(This.FindStrings()).ItemsAtPositions(anPos)
		ok

		return anResult

	def StringZ(paString)
		if CheckParams()
			if NOT isString(paString) 
				StzRaise("Incorrect param type! paString must be a list.")
			ok
		ok

		anPos = This.FindString(paString)
		aResult = [ paString, anPos ]	
		return aResult

	def FindTheseStrings(paStrings)
		if CheckParams()
			if NOT ( isString(paStrings) and Q(paStrings).IsStringOfStrings() )
				StzRaise("Incorrect param type! paStrings must be a list of lists.")
			ok
		ok

		paStrings = U(paStrings) # Duplicates removed
		nLen = len(paStrings)
		anResult = []

		for i = 1 to nLen
			anPos = This.FindString(paStrings[i])
			nLenPos = len(anPos)

			for j = 1 to nLenPos
				anResult + anPos[j]
			next
		next

		anResult = ring_sort(anResult)
		return anResult

	def TheseStringsZ(paStrings)
		if CheckParams()
			if NOT ( isString(paStrings) and Q(paStrings).IsStringOfStrings() )
				StzRaise("Incorrect param type! paStrings must be a list of lists.")
			ok
		ok

		nLen = len(paStrings)
		aResult = []

		for i = 1 to nLen
			aResult + [ paStrings[i], This.FindString(paStrings[i]) ]
		next

		return aResult

	  #-------------------------------------#
	 #   REMOVING ITEMS WHICH ARE STRINGS  #
	#-------------------------------------#

	def RemoveStrings()

		This.RemoveItemsAtThesePositions(This.FindStrings())

		def RemoveStringsQ()
			This.RemoveStrings()
			return This

		def RemoveOnlyStrings()
			This.RemoveStrings()

			def RemoveOnlyStringsQ()
				This.RemoveOnlyStrings()
				return This

	  #-------------------------------------------#
	 #  GETTING THE STRINGS AND THEIR POSITIONS  #
	#-------------------------------------------#

	def StringsZ()
		aContent = This.Content()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if isString(aContent[i])
				aResult + [ aContent[i], i ]
			ok
		next

		return aResult

		def StringsAndTheirPositions()
			return This.StringsZ()

		def StringsAndPositions()
			return This.StringsZ()

	  #----------------------------------------#
	 #   GETTING ITEMS WHICH ARE NOT STRING   #
	#========================================#

	def FindNonStrings()
		aContent = This.Content()
		nLen = len(acontent)
		anResult = []

		for i = 1 to nLen
			if NOT isString(aContent[i])
				anResult + i
			ok
		next
		
		return anResult		

	def NonStrings()
		aResult = This.ItemsAtPositions( This.FindNonStrings() )
		return aResult	

		def NonStringsQ()
			return This.NonStringsQR(:stzList)

		def NonStringsQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.NonStrings() )

			on :stzListOfStrings
				return new stzListOfStrings( This.NonStrings() )

			other
				StzRaise("Unsupported return type!")
			off

		def OnlyNonStrings()
			return This.NonStrings()

			def OnlyNonStringsQ()
				return This.OnlyNonStringsQR(:stzList)
	
			def OnlyNonStringsQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.OnlyNonStrings() )
	
				on :stzListOfStrings
					return new stzListOfStrings( This.OnlyNonStrings() )
	
				other
					StzRaise("Unsupported return type!")
				off

	  #-----------------------------------------------#
	 #  GETTING THE NON-STRINGS AND THEIR POSITIONS  #
	#-----------------------------------------------#

	def NonStringsZ()
		aContent = This.Content()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if NOT isString(aContent[i])
				aResult + [ aContent[i], i ]
			ok
		next

		return aResult

		def NonStringsAndTheirPositions()
			return This.NonStringsZ()

		def NonStringsAndPositions()
			return This.NonStringsZ()

	  #-----------------------------------------#
	 #   REMOVING ITEMS WHICH ARE NOT STRINGS  #
	#-----------------------------------------#

	def RemoveNonStrings()
		This.RemoveItemsAtPositions( This.FindNonStrings() )

		def RemoveNonStringsQ()
			This.RemoveNonStrings()
			return This

		def RemoveOnlyNonStrings()
			This.RemoveNonStrings()

			def RemoveOnlyNonStringsQ()
				This.RemoveOnlyNonStrings()
				return This

		def RemoveAllExceptStrings()
			This.RemoveNonStrings()

			def RemoveAllExceptStringsQ()
				This.RemoveAllExceptStrings()
				return This

	def NonStringsRemoved()
		acResult = This.Copy().RemoveNonStringsQ().Content()
		return acResult

	  #=================================================#
	 #  LOWERCASING THE STRINGS CONTAINED IN THE LIST  #
	#=================================================#

	def LowercaseStrings()
		aContent = This.Content()

		for i = 1 to This.NumberOfItems()

			if isString(aContent[i])
				cStrLow = Q(aContent[i]).Lowercased()
				This.ReplaceItemAtPosition(i, cStrLow)
			ok
		next

		def LowercaseStringsQ()
			This.LowercaseStrings()
			return This

		def Lowercase()
			This.LowercaseStrings()

			def LowercaseQ()
				This.Lowercase()
				return This

		def ApplyLowercase()
			This.LowercaseStrings()

			def ApplyLowercaseQ()
				This.ApplyLowercase()
				return This

	def ListWithStringsLowercased()
		aResult = This.Copy().LowercaseStringsQ().Content()
		return aResult

		def Lowercased()
			return This.ListWithStringsLowercased()

	def StringsLowercased()
		aResult = []
		aContent = This.Content()
		nLen = This.NumberOfItems()

		for i = 1 to nLen

			if isString(aContent[i])
				cStrLow = Q(aContent[i]).Lowercased()
				aResult + cStrLow
			ok
		next

		return aResult

	  #=================================================#
	 #  UPPERCASING THE STRINGS CONTAINED IN THE LIST  #
	#=================================================#

	def UppercaseStrings()
		aContent = This.Content()
		nLen = This.NumberOfItems()

		for i = 1 to nLen
			
			if isString(aContent[i])
				cStrUpp = Q(aContent[i]).Uppercased()
				This.ReplaceItemAtPosition(i, cStrUpp)
			ok
		next

		def UppercaseStringsQ()
			This.UppercaseStrings()
			return This

		def Uppercase()
			This.UppercaseStrings()

			def UppercaseQ()
				This.Uppercase()
				return This

		def ApplyUppercase()
			This.UppercaseStrings()

			def ApplyUppercaseQ()
				This.ApplyUppercase()
				return This

	def ListWithStringsUppercased()
		aResult = This.Copy().UppercaseStringsQ().Content()
		return aResult

		def Uppercased()
			return This.ListWithStringsUppercased()

	def StringsUppercased()
		aResult = []
		aContent = This.Content()
		nLen = This.NumberOfItems()

		for i = 1 to nLen

			if isString(aContent[i])
				cStrUpp = Q(aContent[i]).Uppercased()
				aResult + cStrUpp
			ok
		next

		return aResult
	
	  #=================================================#
	 #  TITLECASING THE STRINGS CONTAINED IN THE LIST  #
	#=================================================#

	def TitlecaseStrings()
		aContent = This.Content()
		nLen = This.NumberOfItems()

		for i = 1 to nLen

			if isString(aContent[i])
				cStrTtl = Q(aContent[i]).Titlecased()
				This.ReplaceItemAtPosition(i, cStrTtl)
			ok
		next

		def TitlecaseStringsQ()
			This.TitlecaseStrings()
			return This

		def Titlecase()
			This.TitlecaseStrings()

			def TitlecaseQ()
				This.Titlecase()
				return This

		def ApplyTitlecase()
			This.TitlecaseStrings()

			def ApplyTitlecaseQ()
				This.ApplyTitlecase()
				return This

	def ListWithStringsTitlecased()
		aResult = This.Copy().TitlecaseStringsQ().Content()
		return aResult

		def Titlecased()
			return This.ListWithStringsTitlecased()

	def StringsTitlecased()
		aResult = []
		aContent = This.Content()
		nLen = This.NumberOfItems()

		for i = 1 to nLen

			if isString(aContent[i])
				cStrTtl = Q(aContent[i]).Titlecased()
				aResult + cStrTtl
			ok
		next

		return aResult

	  #==================================================#
	 #  CAPITALIZING THE STRINGS CONTAINED IN THE LIST  #
	#==================================================#

	def CapitaliseStrings()
		aContent = This.Content()
		nLen = This.NumberOfItems()

		for i = 1 to nLen
			
			if isString(aContent[i])
				cStrCap = Q(aContent[i]).Capitalised()
				This.ReplaceItemAtPosition(i, cStrCap)
			ok
		next

		def CapitaliseStringsQ()
			This.CapitaliseStrings()
			return This

		def CapitalizeStrings()
			This.CapitaliseStrings()

			def CapitalizeStringsQ()
				This.CapitalizeStrings()
				return This

		def Capitalise()
			This.CapitaliseStrings()

			def CapitaliseQ()
				This.CapitaliseStrings()
				return This

		def Capitalize()
			This.CapitalizeStrings()

			def CapitalizeQ()
				This.Capitalize()
				return This

		def ApplyCapitalcase()
			This.CapitalizeStrings()

			def ApplyCapitalcaseQ()
				This.ApplyCapitalcase()
				return This

	def ListWithStringsCapitalised()
		aResult = This.Copy().CapitaliseStringsQ().Content()
		return aResult

		def ListWithStringsCapitalized()
			return This.ListWithStringsCapitalised()

		def Capitalised()
			return This.ListWithStringsCapitalised()

		def Capitalized()
			return This.ListWithStringsCapitalised()

	def StringsCapitalised()
		aResult = []
		aContent = This.Content()
		nLen = This.NumberOfItems()

		for i = 1 to nLen

			if isString(aContent[i])
				cStrCap = Q(aContent[i]).Capitalised()
				aResult + cStrCap
			ok
		next

		return aResult

		def StringsCapitalized()
			return This.StringsCapitalised()

	  #=====================================#
	 #   ITEMS OF TYPE LISTS OF STRINGS    #
	#=====================================#

	def ListsOfStrings()
		aResult = []
		for item in this.List()
			if isList(item) and Q(item).IsListOfStrings()
				aResult + item
			ok
		next

		return aResult

	def NumberOfListsOfStrings()
		return len(This.ListsOfStrings())

		def CountListsOfStrings()
			return This.NumberOfListsOfStrings()

		def HowManyListsOfStrings()
			return This.NumberOfListsOfStrings()

		def HowManyListOfStrings()
			return This.NumberOfListsOfStrings()


	#----

	def LowercaseListsOfStrings()
		for item in This.List()
			if isList(item) and Q(item).IsListOfStrings()
				item = StzListOfStringsQ(item).Lowercased()
			ok
		next

		def LowercaseListsOfStringsQ()
			This.LowercaseListsOfStrings()
			return This

	def ListsOfStringsLowercased()
		return This.Copy().LowercaseListsOfStringsQ().Content()

	#----

	def UppercaseListsOfStrings()
		for item in This.List()
			if isList(item) and Q(item).IsListOfStrings()
				item = StzListOfStringsQ(item).Uppercased()
			ok
		next

		def UppercaseListsOfStringsQ()
			This.LowercaseListsOfStrings()
			return This

	def ListsOfStringsUppercased()
		return This.Copy().UppercaseListsOfStringsQ().Content()

	  #-==============================================#
	 #     GETTING & REMOVING ITEMS OF TYPE LIST     #
	#===============================================#

	def NumberOfLists()
		return len( This.Lists() )

		def CountLists()
			return This.NumberOfLists()

		def HowManyLists()
			return This.NumberOfLists()

		def HowManyList()
			return This.NumberOfLists()

	def Lists()
		/* WARNING

		Do not use this solution:

			return This.ItemsW('isList(@item)')

		#--> Stackovervlow!
		*/

		aContent = This.COntent()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if isList(aContent[i])
				aResult + aContent[i]
			ok
		next

		return aResult

		#< @FunctionFluentForm

		def ListsQ()
			return This.ListsQR(:stzList)

		def ListsQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.Lists() )

			on :stzListOfLists
				return new stzListOfLists( This.Lists() )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForm

		def OnlyLists()
			return This.Lists()

			def OnlyListsQ()
				return This.OnlyListsQR(:stzList)
	
			def OnlyListsQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.OnlyLists() )
	
				on :stzListOfLists
					return new stzListOfLists( This.OnlyLists() )
	
				other
					StzRaise("Unsupported return type!")
				off

		#>

	  #----------------------------------#
	 #  FINDING THE LISTS IN THE LISTS  #
	#----------------------------------#

	def FindLists()
		aContent = This.Content()
		nLen = len(acontent)
		aResult = []

		for i = 1 to nLen
			if isList(aContent[i])
				aResult + i
			ok
		next
		
		return aResult		

	def FindList(paList) # Add case sensitivity

		if CheckParams()
			if NOT isList(paList)
				StzRaise("Incorrect param type! paList must be a list.")
			ok
		ok

		anPos = Q(This.Lists()).Find(paList)
		anResult = []
		if len(anPos) > 0 
			anResult = Q(This.FindLists()).ItemsAtPositions(anPos)
		ok

		return anResult

	def ListZ(paList)
		if CheckParams()
			if NOT isList(paList) 
				StzRaise("Incorrect param type! paList must be a list.")
			ok
		ok

		anPos = This.FindList(paList)
		aResult = [ paList, anPos ]	
		return aResult

	def FindTheseLists(paLists)
		if CheckParams()
			if NOT ( isList(paLists) and Q(paLists).IsListOfLists() )
				StzRaise("Incorrect param type! paLists must be a list of lists.")
			ok
		ok

		paLists = U(paLists) # Duplicates removed
		nLen = len(paLists)
		anResult = []

		for i = 1 to nLen
			anPos = This.FindList(paLists[i])
			nLenPos = len(anPos)

			for j = 1 to nLenPos
				anResult + anPos[j]
			next
		next

		anResult = ring_sort(anResult)
		return anResult

	def TheseListsZ(paLists)
		if CheckParams()
			if NOT ( isList(paLists) and Q(paLists).IsListOfLists() )
				StzRaise("Incorrect param type! paLists must be a list of lists.")
			ok
		ok

		nLen = len(paLists)
		aResult = []

		for i = 1 to nLen
			aResult + [ paLists[i], This.FindList(paLists[i]) ]
		next

		return aResult

	  #--------------------------------------------#
	 #  REMOVING THE LISTS CONTAINED IN THE LIST  #
	#--------------------------------------------#

	def RemoveLists()
		anPositions = This.FindLists()
		This.RemoveItemsAtThesePositions(anPositions)

		def RemoveListsQ()
			This.RemoveLists()
			return This

		def RemoveOnlyLists()
			This.RemoveLists()

			def RemoveOnlyListsQ()
				This.RemoveOnlyLists()
				return This

	def ListsRemoved()
		aResult = This.Copy().RemoveListsQ().Content()
		return aResult

	  #-----------------------------------------#
	 #  GETTING THE /÷SلإS AND THEIR POSITIONS  #
	#-----------------------------------------#

	def ListsZ()
		aContent = This.Content()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if isList(aContent[i])
				aResult + [ aContent[i], i ]
			ok
		next

		return aResult

		def ListsAndTheirPositions()
			return This.ListsZ()

		def ListsAndPositions()
			return This.ListsZ()

	  #===============================================#
	 #  GETTING THE NUMBERS AND STRINGS IN THE LIST  #
	#===============================================#

	def FindNumbersAndStrings()
		aContent = This.Content()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if isNumber(aContent[i]) or isString(aContent[i])
				aResult + i
			ok
		next

		return aResult

		def FindStringsAndNumbers()
			return This.FindNumbersAndStrings()

	def NumbersAndStrings()
		aContent = This.Content()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if isNumber(aContent[i]) or isString(aContent[i])
				aResult + aContent[i]
			ok
		next

		return aResult

		def StringsAndNumbers()
			return This.NumbersAndStrings()

	def NumbersAndStringsZ()
		aContent = This.Content()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if isNumber(aContent[i]) or isString(aContent[i])
				aResult + [ aContent[i], i ]
			ok
		next

		return aResult

		def StringsAndNumbersZ()
			return This.NumberAndStringsZ()

	def RemoveNumbersAndStrings()
		This.RemoveItemsAtPositions( This.FindNumbersAndStrings() )

		def RemoveStringsAndNumbers()

	def NumbersAndStringsRemoved()
		aResult = This.Copy().RemoveNumbersAndStringsQ().Content()
		return aResult

		def StringsAndNumbersRemoved()
			return This.NumbersAndStringsRemoved()

	  #=====================================#
	 #  GETTING THE NON-LISTS IN THE LIST  #
	#=====================================#

	def FindNonLists()
		aContent = This.Content()
		nLen = len(acontent)
		aResult = []

		for i = 1 to nLen
			if NOT isList(aContent[i])
				aResult + i
			ok
		next
		
		return aResult		

	def NonLists()
		aResult = This.ItemsAtPositions( This.FindNonLists() )
		return aResult		

		def NonListsQ()
			return This.NonListsQR(:stzList)

		def NonListsQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.NonLists() )

			on :stzListOfLists
				return new stzListOfLists( This.NonLists() )

			other
				StzRaise("Unsupported return type!")
			off

		def OnlyNonLists()
			return This.NonLists()

			def OnlyNonListsQ()
				return This.OnlyNonListsQR(:stzList)
	
			def OnlyNonListsQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.OnlyNonLists() )
	
				on :stzListOfLists
					return new stzListOfLists( This.OnlyNonLists() )
	
				other
					StzRaise("Unsupported return type!")
				off

	  #------------------------------------#
	 #  REMOVING NON LISTS FROM THE LIST  #
	#------------------------------------#

	def RemoveNonLists()
		anPositions = This.FindNonLists()
		This.RemoveItemsAtThesePositions(anPositions)

		def RemoveNonListsQ()
			This.RemoveNonLists()
			return This

		def RemoveOnlyNonLists()
			This.RemoveNonLists()

			def RemoveOnlyNonListsQ()
				This.RemoveOnlyNonLists()
				return This

		def RemoveAllExceptLists()
			This.RemoveNonLists()

			def RemoveAllExceptListsQ()
				This.RemoveAllExceptLists()
				return This

	def NonListsRemoved()
		aResult = This.Copy().RemoveNonListsQ().Content()
		return aResult

	  #---------------------------------------------#
	 #  GETTING THE NON-LISTS AND THEIR POSITIONS  #
	#---------------------------------------------#

	def NonListsZ()
		aContent = This.Content()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if NOT isList(aContent[i])
				aResult + [ aContent[i], i ]
			ok
		next

		return aResult

		def NonListsAndTheirPositions()
			return This.NonListsZ()

		def NonListsAndPositions()
			return This.NonListsZ()

	  #=================================================#
	 #     GETTING & REMOVING ITEMS OF TYPE OBJECT     #
	#=================================================#

	def NumberOfObjects()
		return len( This.Objects() )

		def CountObjecs()
			return This.NumberOfObjects()

		def HowManyObjects()
			return This.NumberOfObjects()

		def HowManyObject()
			return This.NumberOfObjects()


	def Objects()
		/* WARNING

		Do not use this solution:

			return This.ItemsW('isObject(@item)')

		#--> Stackovervlow!
		*/

		aContent = This.COntent()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if isObject(aContent[i])
				aResult + aContent[i]
			ok
		next

		return aResult

		#< @FunctionFluentForm

		def ObjectsQ()
			return This.ObjectsQR(:stzObject)

		def ObjectsQR(pcReturnType)
			if isObject(pcReturnType) and StzObjectQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzObject
				return new stzObject( This.Objects() )

			on :stzObjectOfObjects
				return new stzObjectOfObjects( This.Objects() )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForm

		def OnlyObjects()
			return This.Objects()

			def OnlyObjectsQ()
				return This.OnlyObjectsQR(:stzObject)
	
			def OnlyObjectsQR(pcReturnType)
				if isObject(pcReturnType) and StzObjectQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzObject
					return new stzObject( This.OnlyObjects() )
	
				on :stzObjectOfObjects
					return new stzObjectOfObjects( This.OnlyObjects() )
	
				other
					StzRaise("Unsupported return type!")
				off

		#>

	#--

	def RemoveObjects()
		This.RemoveItemsAtThesePositions(This.FindObjects())

		def RemoveObjectsQ()
			This.RemoveObjects()
			return This

		def RemoveOnlyObjects()
			This.RemoveObjects()

			def RemoveOnlyObjectsQ()
				This.RemoveOnlyObjects()
				return This

	def ObjectsRemoved()
		aResult = This.Copy().RemoveObjectsQ().Content()
		return aResult

	#--

	def FindNonObjects()
		aContent = This.COntent()
		nLen = len(aContent)
		anResult = []

		for i = 1 to nLen
			if NOT isObject(aContent[i])
				anResult + i
			ok
		next

		return anResult

	def NonObjects()
		aContent = This.COntent()
		nLen = len(aContent)
		aResult = []

		for i = 1 to nLen
			if NOT isObject(aContent[i])
				aResult + aContent[i]
			ok
		next

		return aResult

		def NonObjectsQ()
			return This.NonObjectsQR(:stzObject)

		def NonObjectsQR(pcReturnType)
			if isObject(pcReturnType) and StzObjectQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzObject
				return new stzObject( This.NonObjects() )

			on :stzObjectOfObjects
				return new stzObjectOfObjects( This.NonObjects() )

			other
				StzRaise("Unsupported return type!")
			off

		def OnlyNonObjects()
			return This.NonObjects()

			def OnlyNonObjectsQ()
				return This.OnlyNonObjectsQR(:stzObject)
	
			def OnlyNonObjectsQR(pcReturnType)
				if isObject(pcReturnType) and StzObjectQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzObject
					return new stzObject( This.OnlyNonObjects() )
	
				on :stzObjectOfObjects
					return new stzObjectOfObjects( This.OnlyNonObjects() )
	
				other
					StzRaise("Unsupported return type!")
				off

	def RemoveNonObjects()
		This.RemoveItemsAtThesePositions( This.FindNonObjects() )

		def RemoveNonObjectsQ()
			This.RemoveNonObjects()
			return This

		def RemoveOnlyNonObjects()
			This.RemoveNonObjects()

			def RemoveOnlyNonObjectsQ()
				This.RemoveOnlyNonObjects()
				return This

		def RemoveAllExceptObjects()
			This.RemoveNonObjects()

			def RemoveAllExceptObjectsQ()
				This.RemoveAllExceptObjects()
				return This

	def NonObjectsRemoved()
		aResult = This.Copy().RemoveNonObjectsQ().Content()
		return aResult

	  #--------------------------------------------------#
	 #     COUNTING ITEMS VERIFYING A GIVEN CONDITION   #
	#--------------------------------------------------#

	def CountItemsW(pCondition)
		aItems = This.FindW(pCondition)

		nResult = len(aItems)

		return nResult
		
		#< @AlternativeFunctionNames

		def CountW(pCondition)
			return This.CountItemsW(pCondition)

		def NumberOfOccurrenceW(pCondition)
			return This.CountItemsW(pCondition)

		def NumberOfOccurrencesW(pCondition)
			return This.CountItemsW(pCondition)

		def NumberOfItemsW(pCondition)
			return This.CountItemsW(pCondition)

		def HowManyItemsW(pcCondition)
			return This.CountItemsW(pCondition)

		def HowManyItemW(pcCondition)
			return This.CountItemsW(pCondition)

		#>
			
	def NumberOfUniqueItemsW(pCondition)
		return len( This.UniqueItemsW(pCondition) )

		#< @FunctionAlternativeForms

		def NumberOfItemsUW(pCondition)
			return This.NumberOfUniqueItemsW(pCondition)

		def CountUniqueItemsW(pccondition)
			return This.NumberOfUniqueItemsW(pCondition)

		def CountItemsUW(pccondition)
			return This.NumberOfUniqueItemsW(pCondition)

		def HowManyUniqueItemsW(pcCondition)
			return This.NumberOfUniqueItemsW(pCondition)

		def HowManyUniqueItemW(pcCondition)
			return This.NumberOfUniqueItemsW(pCondition)

		def HowManyItemsUW(pcCondition)
			return This.NumberOfUniqueItemsW(pCondition)

		def HowManyItemUW(pcCondition)
			return This.NumberOfUniqueItemsW(pCondition)

		def NumberOfItemsWithoutDuplicationW(pCondition)
			return This.NumberOfUniqueItemsW(pCondition)

		#>

	  #--------------------------------------------------------------------#
	 #  INSERTING ITEM AFTER OR BEFORE ITEMS VERIFYING A GIVEN CONDITION  #
	#--------------------------------------------------------------------#

	def InsertAfterW( pcCondition, pNewItem )
		anPositions = This.FindItemsW(pcCondition)
		This.InsertAfterManyPositions( anPositions, pNewItem )

		#< @FunctionFluentForm

		def InsertAfterWQ( pcCondition, pNewItem )
			This.InsertAfterW( pCondition, pNewItem )
			return This

		#>

		def InsertAfterWhere(pcCondition, pNewItem)
			This.InsertAfterW(pCondition, pNewItem)

			def InsertAfterWhereQ(pcCondition, pNewItem)
				This.InsertAfterWhere(pcCondition, pNewItem)
				return This

	def InsertBeforeW(pcCondition, pNewItem)
		/*
		o1.InsertBeforeW( :Where = '{ StzStringQ(item).IsUppercase() }', "*" )
		*/

		anPositions = This.FindItemsW(pcCondition)
		This.InsertBeforeThesePositions(anPositions, pNewItem)

		#< @FunctionFluentForm

		def InsertBeforeWQ(pcCondition, pNewItem)
			This.InsertBeforeW(pcCondition, pNewItem)
			return This

		#>

		def InsertAtW(pcCondition, pNewItem)
			This.InsertBeforeW(pcCondition, pNewItem)

			def InsertAtWQ(pcCondition, pNewItem)
				This.InsertAt(pcCondition, pNewItem)
				return This

	  #-----------------------------------------------------------------#
	 #  INSERTING MANY ITEMS AFTER OR BEFORE A GIVEN SET OF POSITIONS  #
	#-----------------------------------------------------------------#

	def InsertAfterManyPositions(panPositions, pItem)

		for i = 1 to len(panPositions)
			n = panPositions[i] + i - 1
			This.InsertAfter(n, pItem)
		next

		#< @FunctionFluentForm

		def InsertAfterManyPositionsQ(panPositions, pItem)
			This.InsertAfterManyPositions(panPositions, pItem)
			return This

		#>

		#< @FunctionAlternativeForms

		def InsertAfterThesePositions(panPositions, pItem)
			This.InsertAfterManyPositions(panPositions, pItem)

			def InsertAfterThesePositionsQ(panPositions, pItem)
				This.InsertAfterThesePositions(panPositions, pItem)
				return This

		def InsertAfterPositions(panPositions, pItem)
			This.InsertAfterPositions(panPositions, pItem)

			def InsertAfterPositionsQ(panPositions, pItem)
				This.InsertAfterThesePositions(panPositions, pItem)
				return This

		#>

	def InsertBeforeManyPositions(panPositions, pItem)
		for i = 1 to len(panPositions)
			n = panPositions[i] + i - 1
			This.InsertBefore(n, pItem)
		next

		#< @FunctionFluentForm
		
		def InsertBeforeManyPositionsQ(panPositions, pItem)
			This.InsertBeforeManyPositions(panPositions, pItem)
			return This

		#>

		#< @FunctionAlternativeForms

		def InsertBeforeThesePositions(panPositions, pItem)
			This.InsertBeforeManyPositions(panPositions, pItem)

			def InsertBeforeThesePositionsQ(panPositions, pItem)
				This.InsertBeforeThesePositions(panPositions, pItem)
				return This

		def InsertBeforePositions(panPositions, pItem)
			This.InsertBeforeManyPositions(panPositions, pItem)

			def InsertBeforePositionsQ(panPositions, pItem)
				This.InsertBeforeThesePositions(panPositions, pItem)
				return This

		def InsertAtPositions(panPositions, pItem)
			This.InsertBeforeManyPositions(panPositions, pItem)

			def InsertAtPositionsQ(panPositions, pItem)
				This.InsertBeforeThesePositions(panPositions, pItem)
				return This

		#>

	  #----------------------------------------------#
	 #    SPLITTING THE LIST USING THE GIVEN ITEM   #
	#----------------------------------------------#

	def SplitCS(pItem, pCaseSensitive)
		if isList(pItem) and Q(pItem).IsUsingNamedParam()
			pItem = pItem[2]
		ok

		anPos = This.FindAllCS(pItem, pCaseSensitive)
		aResult = This.SplitAtPositions(anPos)

		return aResult

		#< @FunctionFluentForm

		def SplitCSQ(pItem, pCaseSensitive)
			return This.SplitCSQR(pItem, pCaseSensitive, :stzList)

		def SplitCSQR(pItem, pCaseSensitive, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.SplitCS(pItem, pCaseSensitive) )

			on :stzListOfLists
				return new stzListOfLists( This.SplitCS(pItem, pCaseSensitive) )

			on :stzListOfPairs
				return new stzListOfPairs( This.SplitCS(pItem, pCaseSensitive) )

			on :stzListOfStrings
				return new stzListOfStrings( This.SplitCS(pItem, pCaseSensitive) )
 
			on :stzListOfNumbers
				return new stzListOfNumbers( This.SplitCS(pItem, pCaseSensitive) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def SplitUsingCS(pItem, pCaseSensitive)
			This.SplitCS(pItem, pCaseSensitive)

			def SplitUsingCSQ(pItem, pCaseSensitive)
				return This.SplitUsingCSQR(pItem, pCaseSensitive, pcReturnType)
	
			def SplitUsingCSQR(pItem, pCaseSensitive, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.SplitUsingCS(pItem, pCaseSensitive) )
	
				on :stzListOfLists
					return new stzListOfLists( This.SplitUsingCS(pItem, pCaseSensitive) )
	
				on :stzListOfPairs
					return new stzListOfPairs( This.SplitUsingCS(pItem, pCaseSensitive) )
	
				on :stzListOfStrings
					return new stzListOfStrings( This.SplitUsingCS(pItem, pCaseSensitive) )
	 
				on :stzListOfNumbers
					return new stzListOfNumbers( This.SplitUsingCs(pItem, pCaseSensitive) )
	
				other
					StzRaise("Unsupported return type!")
				off

		def SplitAtCS(pItem, pCaseSensitive)
			return This.SplitCS(pItem, pCaseSensitive)

			def SplitAtCSQ(pItem, pCaseSensitive)
				return This.SplitAtCSQR(pItem, pCaseSensitive, :stzList)

			def SplitAtCSQR(pItem, pCaseSensitive, pcReturnType)
				return This.SplitCSQR(pItem, pCaseSensitive, pcReturnType)

		#>

	#-- WITHOUT CASESENSITIVITY

	def Split(pItem)
		if isList(pItem) and Q(pItem).IsUsingNamedParam()
			pItem = pItem[2]
		ok

		anPos = This.FindAll(pItem)
		aResult = This.SplitAtPositions(anPos)

		return aResult

		#< @FunctionFluentForm

		def SplitQ(pItem)
			return This.SplitQR(pItem, :stzList)

		def SplitQR(pItem, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.Split(pItem) )

			on :stzListOfLists
				return new stzListOfLists( This.Split(pItem) )

			on :stzListOfPairs
				return new stzListOfPairs( This.Split(pItem) )

			on :stzListOfStrings
				return new stzListOfStrings( This.Split(pItem) )
 
			on :stzListOfNumbers
				return new stzListOfNumbers( This.Split(pItem) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def SplitUsing(pItem)
			This.Split(pItem)

			def SplitUsingQ(pItem)
				return This.SplitUsingQR(pItem, pcReturnType)
	
			def SplitUsingQR(pItem, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.SplitUsing(pItem) )
	
				on :stzListOfLists
					return new stzListOfLists( This.SplitUsing(pItem) )
	
				on :stzListOfPairs
					return new stzListOfPairs( This.SplitUsing(pItem) )
	
				on :stzListOfStrings
					return new stzListOfStrings( This.SplitUsing(pItem) )
	 
				on :stzListOfNumbers
					return new stzListOfNumbers( This.SplitUsing(pItem) )
	
				other
					StzRaise("Unsupported return type!")
				off

		def SplitAt(pItem)
			return This.Split(pItem)

			def SplitAtQ(pItem)
				return This.SplitAtQR(pItem, :stzList)

			def SplitAtQR(pItem, pcReturnType)
				return This.SplitQR(pItem, pcReturnType)

		#>

	  #----------------------------------------------------------------------#
	 #    SPLITTING THE LIST AT POSITIONS RETURNED BY THE GIVEN CONDITION   #
	#----------------------------------------------------------------------#

	def SplitW(pcCondition)
		anPos = FindW(pcCondition)
		aResult = SplitAtPositions(anPos)

		return aResult

		#< @FunctionFluentForm

		def SplitWQ(pcCondition)
			return This.SplitWQR(pcCondition, :stzList)

		def SplitWQR(pcCondition, pcReturnType)
			switch pcReturnType
			on :stzList
				return new stzList( This.SplitW(pcCondition) )

			/* ... */
			off

		#>

		#< @FunctionAlternativeForms

		def SplitAtW(pcCondition)
			return This.SplitW(pcCondition)

		#>

	  #---------------------------------------------------------------------------------#
	 #    SPLITTING THE LIST AT POSITIONS RETURNED BY THE GIVEN CONDITION -- EXTENDED  #
	#---------------------------------------------------------------------------------#

	def SplitWXT(pcCondition)
		anPos = This.FindWXT(pcCondition)

		aResult = This.SplitAtPositions(anPos)

		return aResult

		def SplitAtWXT(pcCondition)
			return This.SplitWXT(pcCondition)

	  #------------------------------------#
	 #    SPLITTING TO PARTS OF N ITEMS   #
	#------------------------------------#
	
	def SplitToPartsOfNItems(n)
		oSplitter = new stzSplitter(This.NumberOfItems())
		aSplitted = oSplitter.SplitToPartsOfNItems(n)

		if isString(aSplitted) and aSplitted = NULL
			return NULL

		but len(aSplitted) = 1
			aResult = []
			aResult + This.List()

		but len(aSplitted) = This.NumberOfItems()
			aResult = []

			for item in This.List()
				aResult + [ item ]
			next

		else
			# Tranforming the sections of positions contained in aSplitted
			# to sublists of the actual items corresponding to those sections
	
			aResult = []
	
			for aSection in aSplitted
				aResult + This.Section( aSection[1], aSection[2] )
			next
		ok

		return aResult

		#< @FunctionFluentForm

		def SplitToPartsOfNItemsQ(n)
			return This.SplitToPartsOfNItemsQR(n, :stzList)

		def SplitToPartsOfNItemsQR(n, pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.SplitToPartsOfNItems(n) )

			on :stzListOfLists
				return new stzListOfLists( This.SplitToPartsOfNItems(n) )

			on :stzListOfPairs
				return new stzListOfPairs( This.SplitToPartsOfNItems(n) )
	
			on :stzListOfStrings
				return new stzListOfStrings( This.SplitToPartsOfNItems(n) )
	
			on :stzListOfNumbers
				return new stzListOfNumbers( This.SplitToPartsOfNItems(n) )

			other
				StzRaise("Unsupported return type!")
			off

	
		#< @FunctionAlternativeForms

		def SplitToPartsOfN(n)
			return This.SplitToPartsOfNItems(n)

			#< @FunctionFluentForm

			def SplitToPartsOfNQ(n)
				return This.SplitToPartsOfNItemsQR(n, :stzList)
	
			def SplitToPartsOfNQR(n, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				return This.SplitToPartsOfNItemsQR(n, pcReturnType)

			#>

		def SplitToPartsOf(n)
			return This.SplitToPartsOfNItems(n)

			#< @FunctionFluentForm

			def SplitToPartsOfQ(n)
				return This.SplitToPartsOfNItemsQR(n, :stzList)
	
			def SplitToPartsOfQR(n, pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				return This.SplitToPartsOfNItemsQR(n, pcReturnType)

			#>

		def SplitToParts(n)
			if isList(n) and StzListQ(n).IsOfNamedParam()
				n = n[2]
			ok

			return This.SplitToPartsOf(n)

			def SplitToPartsQ(n)
				return This.SplitToPartsQR(n, :stzList)
	
			def SplitToPartsQR(n, pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				return This.SplitToPartsOfNItemsQR(n, pcReturnType)

		#--

		def SplitToListsOfNItems(n)
			return This.SplitToPartsOfNItems(n)

		def SplitToListsOfN(n)
			return This.SplitToPartsOfNItems(n)

			#< @FunctionFluentForm

			def SplitToListsOfNQ(n)
				return This.SplitToListsOfNItemsQR(n, :stzList)
	
			def SplitToListsOfNQR(n, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				return This.SplitToListsOfNItemsQR(n, pcReturnType)

			#>

		def SplitToListsOf(n)
			return This.SplitToPartsOfNItems(n)

			#< @FunctionFluentForm

			def SplitToListsOfQ(n)
				return This.SplitToListsOfNItemsQR(n, :stzList)
	
			def SplitToListsOfQR(n, pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				return This.SplitToListsOfNItemsQR(n, pcReturnType)

			#>

		def SplitToLists(n)
			if isList(n) and StzListQ(n).IsOfNamedParam()
				n = n[2]
			ok

			return This.SplitToPartsOf(n)

			def SplitToListsQ(n)
				return This.SplitToListsQR(n, :stzList)
	
			def SplitToListsQR(n, pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
					pcReturnType = pcReturnType[2]
				ok

				return This.SplitToListsOfNItemsQR(n, pcReturnType)

		#>

	  #-----------------------------------#
	 #    SPLITTING AT GIVEN POSITIONS   #
	#-----------------------------------#

	def SplitAtPositions(panPositions)
		oSplitter = new stzSplitter(This.NumberOfItems())
		aSections = oSplitter.SplitAtPositions(panPositions)
		aResult = This.Sections(aSections)

		return aResult

	  #-------------------------------------#
	 #  SPLITTING BEFORE A GIVEN POSITION  #
	#-------------------------------------#

	def SplitBeforePosition(n)
		oSplitter = new stzSplitter(This.NumberOfItems())
		aSections = This.SplitBeforePosition(n)
		aResult = This.Sections(aSections)

		return aResult

		#< @FunctionFluentForm

		def SplitBeforePositionQ(n)
			return new stzListOfLists( This.SplitBeforePosition(n) )

		#>

		#< @FunctionAlternativeForm

		def SplitBefore(n)
			return  This.SplitBeforePosition(n)

			#< @FunctionFluentForm

			def SplitBeforeQ(n)
				return new stzListOfLists( This.SplitBefore(n) )

			#>

		#>

	  #--------------------------------------#
	 #    SPLITTING BEFORE MANY POSITIONS   #
	#--------------------------------------#

	def SplitBeforePositions(panPositions)

		oSplitter = new stzSplitter(This.NumberOfItems())
		aSections = oSplitter.SplitBeforePositions(panPositions)

		aResult = This.Sections(aSections)
		return aResult

		#< @FunctionFluentForm

		def SplitBeforePositionsQ(panPositions)
			return new stzListOfLists( This.SplitBeforePositions(panPositions) )

		#>

	  #---------------------------------------#
	 #    SPLITTING AFTER A GIVEN POSITION   #
	#---------------------------------------#

	def SplitAfterPosition(n)
		return This.SplitAfterPosistions([n])

		#< @FunctionFluentForm

		def SplitAfterPositionQ(n)
			return new stzList( This.SplitAfterPosition(n) )

		#>

		#< @FunctionAlternativeForm

		def SplitAfter(n)
			return  This.SplitAfterPositions(n)

		#>

	  #-------------------------------------#
	 #    SPLITTING AFTER MANY POSITIONS   #
	#-------------------------------------#

	def SplitAfterPositions(panPositions)
		oSplitter = new stzSplitter(This.NumberOfItems())
		aSections = oSplitter.SplitAfterPositions(panPositions)

		aResult = This.Sections(aSections)
		return aResult

		#< @FunctionFluentForm

		def SplitAfterPositionsQ(panPositions)
			return new stzListOfLists( This.SplitAfterPositions(panPositions) )

		#>

	  #---------------------------#
	 #    SPLITTING TO N PARTS   #
	#---------------------------#

	def SplitToNParts(n)
		if CheckParams()
			if NOT isNumber(n)
				StzRaise("Incorrect param type! n must be a number.")
			ok
		ok

		aSections = StzSplitterQ(1:This.NumberOfItems()).SplitToNParts(n)
		This.UpdateWith( This.Sections(aSections) )

		#< @FunctionFluentForm

		def SplitToNPartsQ(n)
			This.SplitToNParts(n)
			return This

		#>

	def SplittedToNParts(n)
		aResult = This.Copy().SplitToNPartsQ(n).Content()
		return aResult

	  #-----------------------------------------------------------#
	 #    SPLITTING BEFORE AN ITEM VERIFYING A GIVEN CONDITION   #
	#-----------------------------------------------------------#

	def SplitBeforeW(pCondition)
		anPositions = This.FindW(pcCondition)
		aResult = This.SplitBeforePositions(anPositions)

		return aResult	

		def SplitBeforeWQ(pCondition)
			return new stzList( This.SplitBeforeW(pCondition) )

		def SplittedBeforeW(pcCondition)
			return This.SplitBeforeW(pCondition)

		def SplitBeforeWhere(pCondition)
			return This.SplitBeforeW(pCondition)

		def SplittedBeforeWhere(pcCondition)
			return This.SplitBeforeW(pCondition)

	  #-----------------------------------------------------------#
	 #    SPLITTING AFTER AN ITEM VERIFYING A GIVEN CONDITION    #
	#-----------------------------------------------------------#

	def SplitAfterW(pCondition)
		anPositions = This.FindW(pcCondition)
		aResult = This.SplitAfterPositions(anPositions)

		return aResult	

		def SplitAfterWQ(pCondition)
			return new stzList( This.SplitAfterW(pCondition) )

		def SplittedAfterW(pcCondition)
			return This.SplitAfterW(pCondition)

		def SplitAfterWhere(pCondition)
			return This.SplitAfterW(pCondition)

		def SplittedAfterWhere(pcCondition)
			return This.SplitAfterW(pCondition)

	  #------------------------------------------------#
	 #    GETTING A SECTION (OR SLICE) OF THE LIST    #
	#------------------------------------------------#
	/*
	TODO: Think of a syntax that return the section without the
	extremities, like for example:

	o1.Section(:@, ']5, 8]') --> [6, 7, 8]

	UPDATE: It's more elegant to pass only one param between barackets:

	o1.Section([5, 8]) --> [5, 6, 7, 8]

	And if we need to not return the left item for example we use
	a string instead like this:

	o1.Section(']5, 8]') --> [6, 7, 8]

	*/

	def Section(n1, n2)

		if This.NumberOfItems() = 0
			return []
		ok

		# Checking the params

		if CheckParams() = TRUE

			if isList(n1) and
			   StzListQ(n1).IsOneOfTheseNamedParams([
					:From, :FromPosition, :FromItem,
					:StartingAt, :StartingAtPosition, :StartingAtItem,
					:Between, :BetweenPosition, :BetweenItem
					])
	
				n1 = n1[2]
			ok
	
			if isList(n2) and
			   StzListQ(n2).IsOneOfTheseNamedParams([
					:To, :ToPosition, :ToItem,
					:Until, :UntilPosition, :UntilItem,
					:UpTo, :UpToPosition, :UpToItem,
					:And
					])
	
				n2 = n2[2]
			ok
	
			# Managing the use of :NthToFirst named param
	
			if isList(n1) and StzListQ(n1).IsOneOfTheseNamedParams([
						:NthToFirst, :NthToFirstItem ])
	
				n1 = n1[2] + 1
			ok
	
			if isList(n2) and StzListQ(n2).IsOneOfTheseNamedParams([
						:NthToFirst, :NthToFirstItem ])
	
				n2 = n2[2] + 1
			ok
	
			# Managing the use of :NthToLast named param
	
			if isList(n1) and Q(n1).IsOneOfTheseNamedParams([
						:NthToLast, :NthToLastItem ])
	
				n1 = This.NumberOfItems() - n1[2]
			ok
	
			if isList(n2) and StzListQ(n2).IsOneOfTheseNamedParams([
						:NthToLast, :NthToLastItem ])
	
				n2 = This.NumberOfItems() - n2[2]
			ok
	
			# Managing the case of :First and :Last keywords
	
			if isString(n1)
				if stzStringQ(n1).IsOneOfThese([ :First, :FirstItem, :StartOfList ])
					n1 = 1
	
				but StzStringQ(n1).IsOneOfThese([ :Last, :LastItem, :EndOfList ])
					n1 = This.NumberOfItems()
	
				but n1 = :@
					n1 = n2
				ok
			ok
		
			if isString(n2)
				if StzStringQ(n2).IsOneOfThese([ :Last, :LastItem, :EndOfList ])
					n2 = This.NumberOfItems()
	
				but StzStringQ(n2).IsOneOfThese([ :First, :FirstItem, :StartOfList ])
					n2 = 1
	
				but n2 = :@
					n2 = n1
				ok
			ok
	
			if n1 = :@ and n2 = :@
				n1 = 1
				n2 = This.NumberOfItems()
			ok
	
			if n1 < 0
				n1 = This.NumberOfItems() + n1 + 1
			ok
	
			if n2 < 0
				n2 = This.NumberOfItems() + n2 + 1
			ok
	
			# If the params are not numbers, so find them and take their positions
			# EXAMPLE:
			# 	? Q([ "S", "O", "F", "T", "A", "N", "Z", "A" ]).
			# 		Section(:From = "F", :To = "A") #--> [ "F", "T", "A" ]
	
			if NOT ( isNumber(n1) and isNumber(n2) )
				return This.SectionsBetweenItems(n1, n2)
			ok

		ok

		# Doing the job (issuming n1 and n2 are numbers)

		aContent = This.Content()
		nLen = len(aContent)
		aResult = []

		if n1 = n2
			aResult + This.Item(n1)

		but n1 < n2
			for i = n1 to n2
				aResult + aContent[i]
			next

		else
			aResult = This.Section(n2, n1)
		ok

		return aResult	

		#< @FunctionFluentForm

		def SectionQ(n1, n2)
			return This.SectionQR(n1, n2, :stzList)

		def SectionQR(n1, n2, pcReturntype)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType

			on :stzList
				return new stzList( This.Section(n1, n2) )

			on :stzListOfStrings
				return new stzListOfStrings( This.Section(n1, n2) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.Section(n1, n2) )

			on :stzListOfPairs
				return new stzListOfPairs( This.Section(n1, n2) )

			on :stzListOfLists
				return new stzListOfLists( This.Section(n1, n2) )

			on :stzListOfObjects
				return new stzListOfObjects( This.Section(n1, n2) )

			other
				StzRaise("Unsupported return type!")
			off
		#>

		#< @FunctionAlternativeForms

		def Slice(n1, n2)
			return This.Section(n1, n2)

			def SliceQ(n1, n2)
				return This.SectionQ(n1, n2)
	
			def SliceQR(n1, n2, pcReturntype)
				return This.SectionQR(n1, n2, pcReturntype)

		def SectionBetweenPositions(n1, n2)
			return This.Position(n1, n2)

			def SectionBetweenPositionsQ(n1, n2)
				return This.SectionQ(n1, n2)

			def SectionBetweenPositionsQR(n1, n2, pcReturnType)
				return This.SectionQ(n1, n2, pcReturnType)

		#>

	  #---------------------------------------#
	 #   GETIING MANY SECTIONS (OR SLICES)   #
	#---------------------------------------#

	def Sections(paSections)
		if NOT ( isList(paSections) and Q(paSections).IsListOfPairsOfNumbers() )

			StzRaise("Incorrect param type! paSections must be a list of pairs of numbers.")

		ok

		if len(paSections) = 0
			return []
		ok

		aResult = []

		for aSection in paSections
			aResult + This.Section( aSection[1], aSection[2] )
		next

		return aResult

		#< @FunctionAlternativeForms

		def ManySections(paSections)
			return This.Sections(paSections)

		def Slices(paSections)
			return This.Sections(paSections)

		def ManySlices(paSections)
			return This.Sections(paSections)

		#>

	  #---------------------------------------------------#
	 #   GETIING MANY SECTIONS (OR SLICES) -- EXTENDED   #
	#---------------------------------------------------#

	def SectionsCSXT(pItem1, pItem2, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzList([ "T", "A", "Y", "O", "U", "B", "T", "A" ])
		? o1.SectionsXT( :From = "T", :To = "A" )
		#--> [ ["T", "A"], [ "T", "A", "Y", "O", "U", "B", "T", "A" ], ["T", "A"] ]

		*/

		if isList(pItem1) and Q(pItem1).IsFromNamedParam()
			pItem1 = pItem1[2]
		ok

		if isList(pItem2) and Q(pItem2).IsToNamedParam()
			pItem2 = pItem2[2]
		ok

		anSections = []

		anPos1 = This.FindAllCS(pItem1, pCaseSensitive) #--> [ 1, 7 ]
		anPos2 = This.FindAllCS(pItem2, pCaseSensitive) #--> [ 2, 8 ]

		for n1 in anPos1
			for n2 in anPos2
				if n1 < n2
					anSections + [ n1, n2 ]
				ok
			next
		next

		#--> [ [ 1, 2 ], [ 1, 8 ], [ 7, 8 ] ]

		acResult = This.Sections(anSections)
		return acResult

		#< @FunctionAlternativeForm

		def SectionsBetweenItemsCS(pItem1, pItem2, pCaseSensitive)
			return This.SectionsCSXT(pItem1, pItem2, pCaseSensitive)

		#>

	#-- WTHOUT CASESENSITIVITY

	def SectionsXT(pItem1, pItem2)
		return This.SectionsCSXT(pItem1, pItem2, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def SectionsBetweenItems(pItem1, pItem2)
			return This.SectionsXT(pItem1, pItem2)

		#>

	   #--------------------------------------------------------------#
	  #   FINDING THE ANTI-SECTIONS OF A GIVEN SET OF SECTIONS AND   #
	 #   RETURNING THEM AS PAIRS OF NUMBERS                         #
	#--------------------------------------------------------------#

	def FindAntiSections(paSections)
		/* EXAMPLE
		o1 = new stzList("A":"J")

		? o1.FindAntiSections( :Of = [ [3,5], [7,8] ])
		#--> [ [1, 2], [6, 6], [9, 10] ]

		? o1.AntiSections( :Of = [ [3,5], [7,8] ])
		#--> [ ["A", "B"], ["F"], ["I", "J"] ]

		*/

		if isList(paSections) and Q(paSections).IsOfNamedParam()
			paSections = paSections[2]
		ok

		if isList(paSections) and len(paSections) = 0
			return []
		ok

		if NOT ( isList(paSections) and Q(paSections).IsListOfPairsOfNumbers() )
			StzRaise("Incorrect param! paSections must be a list of pairs of numbers.")
		ok

		aSorted = StzListOfPairsQ(paSections).SortedInAscending()
		#--> [ [3,5], [7,8] ]
		nLen = len(aSorted)

		aAntiSections = []
		n1 = 1

		i = 0
		bLastPair = FALSE

		for i = 1 to nLen

			if i = nLen
				bLastPair = TRUE
			ok

			aPair = aSorted[i]

			if aPair[1] > n1
				n2 =  aPair[1] - 1
				aAntiSections + [ n1, n2 ]
			ok

			if NOT bLastPair
				n1 = aPair[2] + 1
			ok
		next

		nLast = aSorted[ nLen ][2]
		nLenList = This.NumberOfItems()

		if nLast < nLenList
			aAntiSections + [ nLast + 1, nLenList ]
		ok

		aResult = aAntiSections
		return aResult

		#< @FunctionFluentForm

		def FindAntiSectionsQ(paSections)
			return This.FindAntiSectionsQR(paSections, :stzList)

		def FindAntiSectionsQR(paSections, pcReturnType)
			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindAntiSections(paSections) )

			on :stzListOfLists
				return new stzListOfLists( This.FindAntiSections(paSections) )

			on :stzListOfPairs
				return new stzListOfPairs( This.FindAntiSections(paSections) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		def AntiSectionsAsPairsOfNumbers(paSections)
			return This.FindAntiSections(paSections)

	def AntiSections(paSections)
		/* EXAMPLE
		o1 = new stzList("A":"J")
		? o1.AntiSections( :Of = [ [3,5], [7,8] ])
		#--> [ ["A", "B"], ["F"], ["I", "J"] ]
		*/

		aResult = This.Sections( This.FindAntiSections(paSections) )
		return aResult

		def SectionsOtherThan(paSections)
			return This.AntiSections(paSections)

		#< @FunctionFluentForm

		def AntiSectionsQ(paSections)
			return new stzList( This.AntiSections(paSections) )

		#>

	def FindAsSectionsAndAntiSections(paSections)
		aAntiSections = This.FindAntiSections(paSections)
		nLen = len(aAntiSections)

		for i = 1 to nLen
			aList = aAntiSections[i]
			if len(aList) = 1
				aList + aList[1]

			but len(aList) > 2
				n1 = aList[1]
				n2 = aList[len(aList)]
				aList = [n1, n2]
			ok
		next

		aAllSections = aAntiSections
		nLen = len(aAllSections)

		for i = 1 to nLen
				aAllSections + aAllSections[i]
		next

		aAllSections = StzListOfPairsQ(aAllSections).SortedInAscending()

		aResult = aAllSections
		return aResult

		#< @FunctionFluentForm

		def FindAsSectionsAndAntiSectionsQ(paSections)
			return This.FindAsSectionsAndAntiSectionsQR(paSections, :stzList)

		def FindAsSectionsAndAntiSectionsQR(paSections, pcReturnType)
			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindAsSectionsAndAntiSections(paSections) )

			on :stzListOfLists
				return new stzListOfLists( This.FindAsSectionsAndAntiSections(paSections) )

			on :stzListOfPairs
				return new stzListOfPairs( This.FindAsSectionsAndAntiSectionss(paSections) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		def SectionsAndAntiSectionsAsPairsOfNumbers(paSections)
			return This.FindAsSectionsAndAntiSections(paSections)

	def SectionsAndAntiSections(paSections)
		aAllSections = This.FindAsSectionsAndAntiSections(paSections)
		aResult = This.Sections(aAllSections)
		return aResult

		#< @FunctionFluentForm

		def SectionsAndAntiSectionsQ(paSections)
			return new stzList( This.SectionsAntiSections(paSections) )

		#>

		#< @FunctionAlternativeForm

		def AllSectionsIncluding(paSections)
			return This.SectionsAndAntiSections(paSections)

			def AllSectionsIncludingQ(paSections)
				return new stzList( This.AllSectionsIncluding(paSections) )
	
		#>

	   #--------------------------------------------------------------#
	  #   FINDING THE ANTI-SECTIONS OF A GIVEN SET OF SECTIONS AND   #
	 #   RETURNING THEM AS PAIRS OF NUMBERS  -- INCLUDING BOUNDS    #
	#--------------------------------------------------------------#

	def FindAntiSectionsIB(paSections)
		/* EXAMPLE
		o1 = new stzList("A":"J")

		? o1.FindAntiSections( :Of = [ [3,5], [7,8] ])
		#--> [ [1, 3], [5, 7], [8, 10] ]


		*/

		if CheckParams()
			if isList(paSections) and Q(paSections).IsOfNamedParam()
				paSections = paSections[2]
			ok
	
			if isList(paSections) and len(paSections) = 0
				return []
			ok
	
			if NOT ( isList(paSections) and Q(paSections).IsListOfPairsOfNumbers() )
				StzRaise("Incorrect param! paSections must be a list of pairs of numbers.")
			ok
		ok

		# Doing the job

		aSorted = StzListOfPairsQ(paSections).SortedInAscending()
	
		nLen = len(aSorted)

		aAntiSectionsIB = []
		n1 = 1

		i = 0
		bLastPair = FALSE

		for i = 1 to nLen

			if i = nLen
				bLastPair = TRUE
			ok

			aPair = aSorted[i]

			if aPair[1] > n1
				n2 =  aPair[1]
				aAntiSectionsIB + [ n1, n2 ]
			ok

			if NOT bLastPair
				n1 = aPair[2]
			ok
		next

		nLast = aSorted[ nLen ][2]
		nLenList = This.NumberOfItems()

		if nLast < nLenList
			aAntiSectionsIB + [ nLast, nLenList ]
		ok

		aResult = aAntiSectionsIB
		return aResult

		#< @FunctionFluentForm

		def FindAntiSectionsIBQ(paSections)
			return This.FindAntiSectionsIBQR(paSections, :stzList)

		def FindAntiSectionsIBQR(paSections, pcReturnType)
			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindAntiSectionsIB(paSections) )

			on :stzListOfLists
				return new stzListOfLists( This.FindAntiSectionsIB(paSections) )

			on :stzListOfPairs
				return new stzListOfPairs( This.FindAntiSectionsIB(paSections) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		def AntiSectionsAsPairsOfNumbersIB(paSections)
			return This.FindAntiSectionsIB(paSections)

	def AntiSectionsIB(paSections)
		aResult = This.Sections( This.FindAntiSectionsIB(paSections) )
		return aResult

		#< @FunctionFluentForm

		def AntiSectionsIBQ(paSections)
			return new stzList( This.AntiSectionsIB(paSections) )

		#>

		#< @FunctionAlternativeForm

		def SectionsOtherThanIB(paSections)
			return This.AntiSectionsIB(paSections)

			def SectionsOtherThanIBQ(paSections)
				return This.AntiSectionsIBQ(paSections)

		#>

	def FindAsSectionsAndAntiSectionsIB(paSections)
		aAntiSectionsIB = This.FindAntiSectionsIB(paSections)
		nLen = len(aAntiSectionsIB)

		for i = 1 to nLen
			aList = aAntiSectionsIB[i]
			if len(aList) = 1
				aList + aList[1]

			but len(aList) > 2
				n1 = aList[1]
				n2 = aList[len(aList)]
				aList = [n1, n2]
			ok
		next

		aAllSectionsIB = aAntiSectionsIB
		nLen = len(aAllSectionsIB)

		for i = 1 to nLen
				aAllSections + aAllSectionsIB[i]
		next

		aAllSectionsIB = StzListOfPairsQ(aAllSectionsIB).SortedInAscending()

		aResult = aAllSectionsIB
		return aResult

		#< @FunctionFluentForm

		def FindAsSectionsAndAntiSectionsIBQ(paSections)
			return This.FindAsSectionsAndAntiSectionsIBQR(paSections, :stzList)

		def FindAsSectionsAndAntiSectionsIBQR(paSections, pcReturnType)
			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindAsSectionsAndAntiSectionsIB(paSections) )

			on :stzListOfLists
				return new stzListOfLists( This.FindAsSectionsAndAntiSectionsIB(paSections) )

			on :stzListOfPairs
				return new stzListOfPairs( This.FindAsSectionsAndAntiSectionssIB(paSections) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		def SectionsAndAntiSectionsAsPairsOfNumbersIB(paSections)
			return This.FindAsSectionsAndAntiSectionsIB(paSections)

	def SectionsAndAntiSectionsIB(paSections)
		aAllSectionsIB = This.FindAsSectionsAndAntiSectionsIB(paSections)
		aResult = This.Sections(aAllSectionsIB)
		return aResult

		#< @FunctionFluentForm

		def SectionsAndAntiSectionsIBQ(paSections)
			return new stzList( This.SectionsAntiSectionsIB(paSections) )

		#>

		#< @FunctionAlternativeForm

		def AllSectionsIncludingIB(paSections)
			return This.SectionsAndAntiSectionsIB(paSections)

			def AllSectionsIncludingIBQ(paSections)
				return new stzList( This.AllSectionsIncludingIB(paSections) )
	
		#>

	  #===================================#
	 #    GETTING A RANGE OF THE LIST    #
	#===================================#

	def Range(pnStart, pnRange)

		# Chacking params

		if CheckParams()
			if isString(pnStart)
				if pnStart = :First or pnStart = :FirstChar
					pnStart = 1
	
				but pnStart = :Last or pnStart = :LastChar
					pnStart = This.NumberOfItems()
				ok
			ok
	
			if NOT Q([pnStart, pnRange]).BothAreNumbers()
				StzRaise("Incorrect param type! pnStart and pnRange must be both numbers.")
			ok
		ok

		# Doing the job

		if pnStart < 0
			pnStart = This.NumberOfItems() + pnStart + 1
		ok

		if pnStart = 0 or pnRange = 0
			return NULL
		ok

		aResult = []

		if pnRange > 0
			aResult + This.Section( pnStart, pnStart + pnRange -1 )

		else
			n1 = pnStart + pnRange + 1

			if n1 > 0
				aResult + This.Section( n1, pnStart )
			ok	
		ok

		return aResult

		#< @FunctionFluentForms

		def RangeQ(pnStart, pnRange)
			return This.RangeQR(pnStart, pnRange, :stzList)

		def RangeQR(pnStart, pnRange, pcReturntype)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType

			on :stzList
				return new stzList( This.Range(pnStart, pnRange) )

			on :stzListOfStrings
				return new stzListOfStrings( This.Range(pnStart, pnRange) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.Range(pnStart, pnRange) )

			on :stzListOfLists
				return new stzListOfLists( This.Range(pnStart, pnRange) )

			on :stzListOfObjects
				return new stzListOfObjects( This.Range(pnStart, pnRange) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

	  #------------------------------------#
	 #   GETTING MANY RANGES OF THE LIST  #
	#------------------------------------#

	def Ranges(paRanges)
		aResult = []

		for aRange in paRanges
			aResult + This.Range( aRange[1], aRange[2] )
		next

		return aResult

		def ManyRanges(paSections)
			return This.Ranges(paRanges)

	  #--------------------------------------------------------#
	 #   GETIING THE ANTI-RANGES OF A GIVEN SET OF SECTIONS   #
	#--------------------------------------------------------#

	def AntiRanges(paRanges)
		aSections = RangesToSections(paRanges)
		aResult = This.AntiSections(aSections)

		return aResult

		def RangesOtherThan(paRanges)
			return This.AntiRanges()

		#< @FunctionFluentForm

		def AntiRangesQ(paRanges)
			return new stzList( This.AntiRanges(paRanges) )

		#>

	def RangesAndAntiRanges(paRanges)
		aSections = SectionsToRanges(paRanges)
		aResult = This.SectionsAndAntiSections(aSections)
		
		return aResult

		#< @FunctionFluentForm

		def RangesAndAntiRangesQ(paRanges)
			return new stzList( This.RangesAndAntiRanges(paRanges) )

		#>

		#< @FunctionAlternativeForm

		def AllRangesIncluding(paRanges)
			return This.RangesAndAntiRanges(paRanges)

			def AllRangesIncludingQ(paRanges)
				return new stzList( This.AllRangesIncluding(paRanges) )
	
		#>

	  #---------------------------------------------------------------------------#
	 #   GETIING THE ANTI-RANGES OF A GIVEN SET OF SECTIONS -- INCLUDING BOUNDS  #
	#---------------------------------------------------------------------------#

	def AntiRangesIB(paRanges)
		aSections = RangesToSections(paRanges)
		aResult = This.AntiSectionsIB(aSections)

		return aResult

		def RangesOtherThanIB(paRanges)
			return This.AntiRangesIB()

		#< @FunctionFluentForm

		def AntiRangesIBQ(paRanges)
			return new stzList( This.AntiRangesIB(paRanges) )

		#>

	def RangesAndAntiRangesIB(paRanges)
		aSections = SectionsToRanges(paRanges)
		aResult = This.SectionsAndAntiSectionsIB(aSections)
		
		return aResult

		#< @FunctionFluentForm

		def RangesAndAntiRangesIBQ(paRanges)
			return new stzList( This.RangesAndAntiRangesIB(paRanges) )

		#>

		#< @FunctionAlternativeForm

		def AllRangesIncludingIB(paRanges)
			return This.RangesAndAntiRangesIB(paRanges)

			def AllRangesIncludingIBQ(paRanges)
				return new stzList( This.AllRangesIncludingIB(paRanges) )
	
		#>

	  #===================#
	 #     MULTINGUAL    #
	#===================#

	def AllItemsAreLanguageAbbreviations()
		bResult = TRUE
		for item in This.List()
			if NOT StringIsLanguageAbbreviation(item)
				bResult = FALSE
				exit
			ok
		next
		return bResult

	func IsMultilingualString()
	     
		/* A multilingual string is a hashlist of the form:
			[
			:en = "house",
			:fr = "maison",
			:ar = "منزل"
		     	]

		The keys of the hashlit must be language abbreviations as
		defined by LocaleLanguageAbbreviations() in stzLocale
		*/

		# The MultilingualString must be a hashlist!
		if NOT This.IsHashlist()
			return FALSE
		ok

		# And the translations provided mus be all strings
		oHash = new stzHashList(This.List())
		aValues = oHash.Values()
		oList = new stzList(aValues)
		if NOT oList.AllItemsAreStrings()
			return FALSE
		ok

		# The keys of the hashlist are the language names or abbreviations
		# Let's check that they are well-formed
		aKeys = oHash.Keys()

		for str in aKeys
			oStr = new stzString(str)
			if NOT (oStr.IsLanguageName() or
				oStr.IsLanguageAbbreviation())
				
				return FALSE
			ok
		next
			
		# Otherwise, the list is a well-formed multilingual string
		return TRUE

	def IsLocaleList()

		if This.NumberOfItems() = 1 and isString(This[1]) and

		   Q(This[1]).IsOneOfThese([ :Default, :DefaultLocale,
				 :System, :SystemLocale, :c, "C", :CLocale
		   ])

			return TRUE
		ok

		# The list should not exceed 3 items

		if This.NumberOfItems() > 3
			return FALSE
		ok

		# It must be a hashlist

		if NOT This.IsHashList()
			return FALSE
		ok

		# The Hashlist must take the form:
		# 	[ :Language = "...", :Country = "...", ":Script = "..." ]
		# At least one item must be provided. And one, two, or three can
		# can be provided.

		oHash = new stzHashList(This.List())
		oKeys = new stzList(oHash.Keys())

		if NOT (oKeys.IsMadeOfSome([ :Language, :Script, :Country ]) ) 
				return FALSE
		ok

		cLanguage = This.List()[ :Language ]
		cScript   = This.List()[ :Script   ]
		cCountry  = This.List()[ :Country  ]

		if AllTheseAreNull([ cLanguage, cScript, cCountry ])
			return FALSE
		ok

		if NOT AllTheseAreStrings([ cLanguage, cScript, cCountry ])
			return FALSE
		ok
		
		if oKeys.Contains(:Language) and _(cLanguage).@.IsNotLanguageName()
			return FALSE
		ok

		if oKeys.Contains(:Script) and _(cScript).@.IsNotScriptName()
			return FALSE
		ok

		if oKeys.Contains(:Country) and _(cCountry).@.IsNotCountryName()
			return FALSE
		ok

		# At this level we are sure it is a language identification list
		return TRUE

	  #----------------------------------------#
	 #   DISTRIBUTING THE ITEMS OF THE LIST   #
	#----------------------------------------#

	def DistributeOverXT( acBeneficiaryItems, anShareOfEachItem )

		/* Explanation
	
		Distributes the items of the main list over the items of the
		provided list, called metaphorically 'Beneficiary Items'
		(anShareOfEachItem) here as they 'benfit' from that distribution).
		
		The distribution is defined by the share of each item.
		
		The share of each item, defined by a list of numbers (anShareOfEachItem),
		determines how many items should be given to the beneficiaries.
		
		--> The beneficiary items can be of any type. In practice, they are
		strings and hence the returned result is a hashlist as demonstrated by
		the following example:
	
		o1 = new stzList([ :water, :coca, :milk, :spice, :cofee, :tea, :honey ] )
		? o1.DistributeOverXT([ :arem, :mohsen, :hamma ], :Using = [ 2, 3, 2 ] )
	
		Gives:
	
		[
			:arem   = [ :water, :coca ],
			:mohsen = [ :milk, :spice, :cofee ],
			:hamma  = [ :tea, honey ]
		]
	
		*/

		if isList(anShareOfEachItem) and Q(anShareOfEachItem).IsUsingNamedParam()
			anShareOfEachItem = anShareOfEachItem[2]
		ok

		# The acBeneficiaryItems param should be non empty list of items:

		if NOT ( isList(acBeneficiaryItems) and  len( acBeneficiaryItems) > 0 )
			StzRaise(stzListError(:CanNoteDistributeItemsOverTheList1))
		ok

		# Controlling the validity of the syntax of anShareOfEachItem param

		if NOT ( isList(anShareOfEachItem) and
			 Q(anShareOfEachItem).IsListOfNumbers() and
			 len(anShareOfEachItem) > 0 )
			 StzRaise("Incorrect param! anShareOfEachItem must be a non empty list of numbers.")
		ok

		# The sum of numbers in anShareOfEachItem should be equal to the
		# number of items of the main list

		if NOT Sum(anShareOfEachItem) = This.NumberOfItems()
			StzRaise(stzListError(:CanNoteDistributeItemsOverTheList2))
		ok

		# Now, we can perform the distribution

		aResult = []
		i = 0
		n = 1
		for cBenef in acBeneficiaryItems
			i++
			aResult + [ cBenef, This.Range(n, anShareOfEachItem[i]) ]
			n += anShareOfEachItem[i]
		next

		return aResult
	
	def DistributeOver( acBeneficiaryItems )
		nLenList = This.NumberOfItems()
		nLenBenef = len(acBeneficiaryItems)

		anShare = []

		if nLenBenef >= nLenList
			for i = 1 to nLenList
				anShare + 1
			next

		else
			n = floor( nLenList / nLenBenef )

			for i = 1 to nLenBenef	
				anShare + n
			next

			nRest = nLenList - ( n * nLenBenef )

			if nRest > 0
				for i = 1 to nRest
					anShare[i]++
				next
			ok
			
		ok

		aResult = This.DistributeOverXT( acBeneficiaryItems, :Using = anShare)
		return aResult

	  #=======================#
	 #     GETTING TYPES     #
	#=======================#

	# Deeling wuth the list itself

	def IsStzList()
		return TRUE

	def StzType()
		return :stzList


	  #----------------------------------------------#
	 #  GETTING THE TYPES OF EACH ITEM IN THE LIST  #
	#----------------------------------------------#

	def Types()
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []
		for i = 1 to nLen
			aResult + ring_type(aContent[i])
		next

		return aResult

	def TypesXT()
		aResult = This.ListQ().AssociatedWith( This.Types() )
		return aResult

	def UniqueTypes()

		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen
			if ring_find(aResult, ring_type(aContent[i])) = 0
				aResult + ring_type(aContent[i])
			ok
		next

		return aResult

		def TypesU()
			return This.UniqueTypes()

		def TypesWithoutDuplication()
			return This.UniqueTypes()

	  #-------------------------------------------------------#
	 #  GETTING THE SOFTANZA TYPES OF EACH ITEM IN THE LIST  #
	#-------------------------------------------------------#
	# For non softanza objects a NULL is returned

	def StzTypes()
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []
		for i = 1 to nLen
			if isObject(aContent[i]) and aContent[i].IsStzObject()
				aResult + aContent[i].StzType()
			else
				aResult + NULL
			ok
		next

		return aResult

	def StzTypesXT()
		aResult = This.ListQ().AssociatedWith( This.StzTypes() )
		return aResult

	def UniqueStzTypes()

		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen
			if ring_find(aResult, Q(aContent[i]).StzType()) = 0
				aResult + Q(aContent[i]).StzType()
			ok
		next

		return aResult

		def StzTypesU()
			return This.UniqueStzTypes()

		def StzTypesWithoutDuplication()
			return This.StzUniqueTypes()

	  #-------------------------------------------------------------#
	 #  CHECKING IF THE LIST STARTS WITH A GIVEN SUBLIST OF ITEMS  #
	#-------------------------------------------------------------#

	def StartsWithCS(paItems, pCaseSensitive)

		if NOT isList(paItems)
			StzRaise("Incorrect param type! paItems must be a list.")
		ok

		nLen = This.NumberOfItems()
		nLenItems = len(paItems)

		if nLenItems > nLen
			return FALSE
		ok

		if This.IsStrictlyEqualToCS(paItems, pCaseSensitive)
			return TRUE
		ok

		bResult = TRUE
		aContent = This.Content()

		for i = 1 to nLenItems
			if Q(aContent[i]).IsNotEqualToCS(paItems[i], pCaseSensitive)
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def BeginsWithCS(paItems, pCaseSensitive)
			return This.StartsWithCS(paItems, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def StartsWith(paItems)
		return This.StartsWithCS(paItems, oCaseSensitive)

		def BeginsWith(paItems)
			return This.StartsWith()

	  #-----------------------------------------------------------#
	 #  CHECKING IF THE LIST ENDS WITH A GIVEN SUBLIST OF ITEMS  #
	#-----------------------------------------------------------#

	def EndsWithCS(paItems, pCaseSensitive)
		if NOT isList(paItems)
			StzRaise("Incorrect param type! paItems must be a list.")
		ok

		nLenItems = len(paItems)
		nLen = This.NumberOfItems()

		if nLenItems > nLen
			return FALSE
		ok

		if This.IsStrictlyEqualToCS(paItems, pCaseSensitive)
			return TRUE
		ok

		bResult = TRUE
		
		aLastItems = This.NLastItems( nLenItems )
		nLenLastItems = len(aLastItems)
		aContent = This.Content()

		for i = 1 to nLenLastItems

			if Q(aContent[i]).IsNotEqualToCS(aLastItems[i], pCaseSensitive)
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def FinishesWithCS(paItems, pCaseSensitive)
			return This.EndsWithCS(paItems, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def EndsWith(paItems)
		return This.EndsWithCS(paItems, :CS = TRUE)

		def FinishesWith(paItems)
			return This.EndsWith(paItems)

	  #==========================================#
	 #  SMALLEST AND LARGEST ITEMS IN THE LIST  #
	#==========================================#

	def SmallestItem()

		if This.NumberOfItems() > 1
			aSorted = This.SortedInAscending()
			return aSorted[1]

		ok

		def Smallest()
			return This.SmallestItem()

	def LargestItem()
		if This.NumberOfItems() > 1
			aSorted = This.SortedInDescending()
			return aSorted[1]
		ok

		def Largest()
			return This.LargestItem()

		def GreatestItem()
			return This.LargestItem()

		def Greatest()
			return This.LargestItem()

	  #--------------------------------------------------#
	 #  FINDING SMALLEST AND LARGEST ITEMS IN THE LIST  #
	#--------------------------------------------------#

	def FindSmallestItem()
		return This.FindAll( This.SmallestItem() )

		def FindSmallest()
			return This.FindSmallestItem()

		def FindAllOccurrencesOfSmallestItem()
			return This.FindSmallestItem()

		def FindAllOccurrencesOfSmallest()
			return This.FindSmallestItem()

	def FindLargestItem()
		return This.FindAll( This.LargestItem() )

		def FindLargest()
			return This.FindLargestItem()

		def FindAllOccurrencesOfLargestItem()
			return This.FindLargestItem()

		def FindAllOccurrencesOfLargest()
			return This.FindLargestItem()

	  #-------------------------------------------------------------------#
	 #  NUMBER OF OCCURRENCES OF SMALLEST AND LARGEST ITEMS IN THE LIST  #
	#-------------------------------------------------------------------#

	def NumberOfOccurrencesOfSmallestItem()
		return len( This.FindAllOccurrencesOfSmallestItem() )

		def NumberOfOccurrenceOfSmallestItem()
			return This.NumberOfOccurrencesOfSmallestItem()

		def NumberOfOccurrencesOfSmallest()
			return This.NumberOfOccurrencesOfSmallestItem()

		def NumberOfOccurrenceOfSmallest()
			return This.NumberOfOccurrencesOfSmallestItem()

		def NumberOfSmallest()
			return This.NumberOfOccurrencesOfSmallestItem()

		def CoutOccurrencesOfSmallestItem()
			return This.NumberOfOccurrencesOfSmallestItem()

		def HowManyOccurrencesOfSmallestItem()
			return This.NumberOfOccurrencesOfSmallestItem()

		def HowManyOccurrenceOfSmallestItem()
			return This.NumberOfOccurrencesOfSmallestItem()

	def NumberOfOccurrencesOfLargestItem()
		return len( This.FindAllOccurrencesOfLargestItem() )

		def NumberOfOccurrenceOfLargestItem()
			return This.NumberOfOccurrencesOfLargestItem()

		def NumberOfOccurrencesOfLargest()
			return This.NumberOfOccurrencesOfLargestItem()

		def NumberOfOccurrenceOfLargest()
			return This.NumberOfOccurrencesOfLargestItem()

		def NumberOfLargest()
			return This.NumberOfOccurrencesOfLargestItem()

		def CoutOccurrencesOfLargestItem()
			return This.NumberOfOccurrencesOfLargestItem()

		def HowManyOccurrencesOfLargestItem()
			return This.NumberOfOccurrencesOfLargestItem()

		def HowManyOccurrenceOfLargestItem()
			return This.NumberOfOccurrencesOfLargestItem()

	  #--------------------------------------------------------------------#
	 #  FINDING NTH OCCURRENCE OF SMALLEST AND LARGEST ITEMS IN THE LIST  #
	#--------------------------------------------------------------------#

	def FindNthOccurrenceOfSmallestItem(n)
		if CheckParams()
			if isString(n)
				if Q(n).IsEither(:First, :Or = :FirstItem)
					n = 1
				but Q(n).IsEither(:Last, :Or = :LastItem)
					n = This.NumberOfOccurrencesOfSmallestItem()
				ok
			ok
		ok

		return This.FindAll( This.SmallestItem() )[n]

		def FindNthOccurrenceOfSmallest(n)
			return This.FindNthSmallestItem(n)

	def FindNthOccurrenceOfLargestItem(n)
		if CheckParams()
			if isString(n)
				if Q(n).IsEither(:First, :Or = :FirstItem)
					n = 1
				but Q(n).IsEither(:Last, :Or = :LastItem)
					n = This.NumberOfOccurrencesOfLargestItem()
				ok
			ok
		ok

		return This.FindAll( This.LargestItem() )[n]

		def FindNthOccurrenceOfLargest(n)
			return This.FindNthLargestItem(n)

		def FindNthOccurrenceOfGreatestItem(n)
			return This.FindNthLargestItem(n)

		def FindNthOccurrenceOfGreatest(n)
			return This.FindNthLargestItem(n)

	  #=====================================================#
	 #  FINDING OCCURRENCES OF AN ITEM IN A GIVEN SECTION  #
	#=====================================================#

	def FindInSectionCS(pItem, n1, n2, pCaseSensitive)

		# Resolving the n1 and n2 params

		if CheckParams()
			if isList(n1) and Q(n1).IsOneOfTheseNamedParams([ :From, :FromPosition, :FromPositionOf ])
				n1 = n1[2]
			ok
	
			if isString(n1)
				if Q(n1).IsOneOfThese([ :First, :FirstItem ])
					n1 = 1
				but Q(n1).IsOneOfThese([ :Last, :LastItem ])
					n1 = This.NumberOfItems()
				ok
			ok
	
			if NOT isNumber(n1)
				StzRaise("Incorrect param type! n1 must be a number.")
			ok
	
			if isList(n2) and Q(n2).IsOneOfTheseNamedParams([ :To, :ToPosition, :ToPositionOf ])
				n2 = n2[2]
			ok
	
			if isString(n2)
				if Q(n2).IsOneOfThese([ :Last, :LastItem ])
					n2 = This.NumberOfItems()
				but Q(n1).IsOneOfThese([ :First, :FirstItem ])
					n2 = 1
				ok
			ok
	
			if NOT isNumber(n2)
				StzRaise("Incorrect param type! n2 must be a number.")
			ok
		ok

		# Doing the job

		anPos = This.SectionQ(n1, n2).FindCS(pItem, pCaseSensitive)
		nLen = len(anPos)

		n1 = Min([ n1, n2 ])

		anResult = []
		for i = 1 to nLen
			anResult + (anPos[i] + (n1 - 1))
		next

		return anResult

		#< @FunctionAlternativeForm

		def FindInSectionCSZ(pItem, n1, n2, pCaseSensitive)
			return This.FindInSectionCS(pItem, n1, n2, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindInSection(pItem, n1, n2)
		return This.FindInSectionCS(pItem, n1, n2, :CaseSensitive = TRUE)
		
		#< @FunctionAlternativeForm

		def FindInSectionZ(pItem, n1, n2)
			return This.FindInSection(pItem, n1, n2)

		#>

	  #---------------------------------------------------#
	 #  FINDING OCCURRENCES OF AN ITEM IN MANY SECTIONS  #
	#---------------------------------------------------#

	def FindInSectionsCS(pItem, paSections, pCaseSensitive)
		if CheckParams()
			if NOT ( isList(paSections) and Q(paSections).IsListOfPairsOfNumbers() )
				StzRaise("Incorrect param type! paSections must be a list of pairs of numbers.")
			ok
		ok

		nLen = len(paSections)
		aResult = []

		for i = 1 to nLen
			anPos = This.FindInSectionCS(pItem, paSections[i][1], paSections[i][2], pCaseSensitive)
			nLenPos = len(anPos)
			for j = 1 to nLenPos
				aResult + anPos[j]
			next
		next

		return aResult

		#< @FunctionAlternativeForms

		def FindInManySectionsCS(pItem, paSections, pCaseSensitive)
			return This.FindInSectionsCS(pItem, paSections, pCaseSensitive)

		#--

		def FindInSectionsCSZ(pItem, paSections, pCaseSensitive)
			return This.FindInSectionsCS(pItem, paSections, pCaseSensitive)

		def FindInManySectionsCSZ(pItem, paSections, pCaseSensitive)
			return This.FindInSectionsCS(pItem, paSections, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindInSections(pItem, paSections)
		return This.FindInSectionsCS(pItem, paSections, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindInManySections(pItem, paSections)
			return This.FindInSections(pItem, paSections)

		#--

		def FindInSectionsZ(pItem, paSections)
			return This.FindInSections(pItem, paSections)

		def FindInManySectionsZ(pItem, paSections)
			return This.FindInSections(pItem, paSections)

		#>

	  #--------------------------------------------------------#
	 #  FINDING NTH OCCURRENCE OF AN ITEM IN A GIVEN SECTION  #
	#========================================================#

	def FindNthInSectionCS(n, pItem, n1, n2, pCaseSensitive)

		# Resolving the n1 and n2 params

		if CheckParams()
			if isList(n1) and Q(n1).IsOneOfTheseNamedParams([ :From, :FromPosition, :FromPositionOf ])
				n1 = n1[2]
			ok
	
			if isString(n1)
				if Q(n1).IsOneOfThese([ :First, :FirstItem ])
					n1 = 1
				but Q(n1).IsOneOfThese([ :Last, :LastItem ])
					n1 = This.NumberOfItems()
				ok
			ok
	
			if NOT isNumber(n1)
				StzRaise("Incorrect param type! n1 must be a number.")
			ok
	
			if isList(n2) and Q(n2).IsOneOfTheseNamedParams([ :To, :ToPosition, :ToPositionOf ])
				n2 = n2[2]
			ok
	
			if isString(n2)
				if Q(n2).IsOneOfThese([ :Last, :LastItem ])
					n2 = This.NumberOfItems()
				but Q(n1).IsOneOfThese([ :First, :FirstItem ])
					n2 = 1
				ok
			ok
	
			if NOT isNumber(n2)
				StzRaise("Incorrect param type! n2 must be a number.")
			ok
		ok

		# Doing the job

		nPos = This.SectionQ(n1, n2).FindNthCS(n, pItem, pCaseSensitive)
		nResult = n1 + nPos - 1

		return nResult

		#< @FunctionAlternativeForm

		def FindNthInSectionCSZ(n, pItem, n1, n2, pCaseSensitive)
			return This.FindNthInSectionCS(n, pItem, n1, n2, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindNthInSection(n, pItem, n1, n2)
		return This.FindNthInSectionCS(n, pItem, n1, n2, :CaseSensitive = TRUE)
		
		#< @FunctionAlternativeForm

		def FindNthInSectionZ(n, pItem, n1, n2)
			return This.FindNthInSection(n, pItem, n1, n2)

		#>

	  #------------------------------------------------------#
	 #  FINDING NTH OCCURRENCE OF AN ITEM IN MANY SECTIONS  #
	#------------------------------------------------------#

	def FindNthInSectionsCS(n, pItem, paSections, pCaseSensitive)
		if CheckParams()
			if NOT ( isList(paSections) and Q(paSections).IsListOfPairsOfNumbers() )
				StzRaise("Incorrect param type! paSections must be a list of pairs of numbers.")
			ok
		ok

		nLen = len(paSections)
		nResult = 0
		nCounter = 0

		for i = 1 to nLen
			anPos = This.FindInSectionCS(pItem, paSections[i][1], paSections[i][2], pCaseSensitive)
			nLenPos = len(anPos)
			for j = 1 to nLenPos
				nCounter++
				if nCounter = n
					nResult = anPos[j]
					exit
				ok
			next
		next

		return nResult

		#< @FunctionAlternativeForms

		def FindNthInManySectionsCS(n, pItem, paSections, pCaseSensitive)
			return This.FindNthInSectionsCS(n, pItem, paSections, pCaseSensitive)

		#--

		def FindNthInSectionsCSZ(n, pItem, paSections, pCaseSensitive)
			return This.FindNthInSectionsCS(n, pItem, paSections, pCaseSensitive)

		def FindNthInManySectionsCSZ(n, pItem, paSections, pCaseSensitive)
			return This.FindNthInSectionsCS(n, pItem, paSections, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindNthInSections(n, pItem, paSections)
		return This.FindNthInSectionsCS(n, pItem, paSections, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindNthInManySections(n, pItem, paSections)
			return This.FindNthInSections(n, pItem, paSections)

		#--

		def FindNthInSectionsZ(n, pItem, paSections)
			return This.FindNthInSections(n, pItem, paSections)

		def FindNthInManySectionsZ(n, pItem, paSections)
			return This.FindNthInSections(n, pItem, paSections)

		#>

	  #----------------------------------------------------------#
	 #  FINDING FIRST OCCURRENCE OF AN ITEM IN A GIVEN SECTION  #
	#==========================================================#

	def FindFirstInSectionCS(pItem, n1, n2, pCaseSensitive)
		nResult = This.FindNthInSectionCS(1, pItem, n1, n2, pCaseSensitive)
		return nResult

		#< @FunctionAlternativeForm

		def FindFirstInSectionCSZ(pItem, n1, n2, pCaseSensitive)
			return This.FindFirstInSectionCS(pItem, n1, n2, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindFirstInSection(pItem, n1, n2)
		return This.FindFirstInSectionCS(pItem, n1, n2, :CaseSensitive = TRUE)
		
		#< @FunctionAlternativeForm

		def FindFirstInSectionZ(pItem, n1, n2)
			return This.FindFirstInSection(pItem, n1, n2)

		#>

	  #--------------------------------------------------------#
	 #  FINDING FIRST OCCURRENCE OF AN ITEM IN MANY SECTIONS  #
	#--------------------------------------------------------#

	def FindFirstInSectionsCS(pItem, paSections, pCaseSensitive)
		if CheckParams()
			if NOT ( isList(paSections) and Q(paSections).IsListOfPairsOfNumbers() )
				StzRaise("Incorrect param type! paSections must be a list of pairs of numbers.")
			ok
		ok

		nResult = 0
		if len(aSections) > 0
			aSections = QR(paSections, :stzListOfPairs).Sorted()
			nResult = This.FindFirstInSectionCS(aSections[1], pCasSensitive)
		ok

		return nResult

		#< @FunctionAlternativeForms

		def FindFirstInManySectionsCS(pItem, paSections, pCaseSensitive)
			return This.FindFirstInSectionsCS(pItem, paSections, pCaseSensitive)

		#--

		def FindFirstInSectionsCSZ(pItem, paSections, pCaseSensitive)
			return This.FindFirstInSectionsCS(pItem, paSections, pCaseSensitive)

		def FindFirstInManySectionsCSZ(pItem, paSections, pCaseSensitive)
			return This.FindFirstInSectionsCS(pItem, paSections, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindFirstInSections(pItem, paSections)
		return This.FindFirstInSectionsCS(pItem, paSections, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindFirstInManySections(pItem, paSections)
			return This.FindFirstInSections(pItem, paSections)

		#--

		def FindFirstInSectionsZ(pItem, paSections)
			return This.FindFirstInSections(pItem, paSections)

		def FindFirstInManySectionsZ(pItem, paSections)
			return This.FindFirstInSections(pItem, paSections)

		#>

	  #---------------------------------------------------------#
	 #  FINDING LAST OCCURRENCE OF AN ITEM IN A GIVEN SECTION  #
	#=========================================================#

	def FindLastInSectionCS(pItem, n1, n2, pCaseSensitive)
		nResult = This.FindNthInSectionCS(1, pItem, n1, n2, pCaseSensitive)
		return nResult

		#< @FunctionAlternativeForm

		def FindLastInSectionCSZ(pItem, n1, n2, pCaseSensitive)
			return This.FindLastInSectionCS(pItem, n1, n2, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindLastInSection(pItem, n1, n2)
		return This.FindLastInSectionCS(pItem, n1, n2, :CaseSensitive = TRUE)
		
		#< @FunctionAlternativeForm

		def FindLastInSectionZ(pItem, n1, n2)
			return This.FindLastInSection(pItem, n1, n2)

		#>

	  #-------------------------------------------------------#
	 #  FINDING LAST OCCURRENCE OF AN ITEM IN MANY SECTIONS  #
	#-------------------------------------------------------#

	def FindLastInSectionsCS(pItem, paSections, pCaseSensitive)
		if CheckParams()
			if NOT ( isList(paSections) and Q(paSections).IsListOfPairsOfNumbers() )
				StzRaise("Incorrect param type! paSections must be a list of pairs of numbers.")
			ok
		ok

		nResult = 0
		if len(aSections) > 0
			aSections = QR(paSections, :stzListOfPairs).Sorted()
			nResult = This.FindLastInSectionCS(aSections[1], pCasSensitive)
		ok

		return nResult

		#< @FunctionAlternativeForms

		def FindLastInManySectionsCS(pItem, paSections, pCaseSensitive)
			return This.FindLastInSectionsCS(pItem, paSections, pCaseSensitive)

		#--

		def FindLastInSectionsCSZ(pItem, paSections, pCaseSensitive)
			return This.FindLastInSectionsCS(pItem, paSections, pCaseSensitive)

		def FindLastInManySectionsCSZ(pItem, paSections, pCaseSensitive)
			return This.FindLastInSectionsCS(pItem, paSections, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindLastInSections(pItem, paSections)
		return This.FindLastInSectionsCS(pItem, paSections, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindLastInManySections(pItem, paSections)
			return This.FindLastInSections(pItem, paSections)

		#--

		def FindLastInSectionsZ(pItem, paSections)
			return This.FindLastInSections(pItem, paSections)

		def FindLastInManySectionsZ(pItem, paSections)
			return This.FindLastInSections(pItem, paSections)

		#>

	  #======================================================#
	 #  GETTING NTH SMALLEST AND LARGEST ITEMS IN THE LIST  #
	#======================================================#

	def NthSmallestItem(n)
		return This.Copy().RemoveDuplicatesQ().SortedInAscending()[n]

		def NthSmallest(n)
			return This.NthSmallestItem(n)

	def NthLargestItem(n)
		return This.Copy().RemoveDuplicatesQ().SortedInDescending()[n]

		def NthLargest(n)
			return This.NthLargestItem(n)

		def NthGreatestItem(n)
			return This.NthLargestItem(n)

		def NthGreatest(n)
			return This.NthLargestItem(n)

	  #------------------------------------------------------#
	 #  FINDING NTH SMALLEST AND LARGEST ITEMS IN THE LIST  #
	#------------------------------------------------------#

	def FindNthSmallestItem(n)
		return This.FindAll( This.NthSmallestItem(n) )

		def FindNthSmallest(n)
			return This.FindNthSmallestItem(n)

	def FindNthLargestItem(n)
		return This.FindAll( This.NthLargestItem(n) )

		def FindNthLargest(n)
			return This.FindNthLargestItem(n)

		def FindNthGreatestItem(n)
			return This.FindNthLargestItem(n)

		def FindNthGreatest(n)
			return This.FindNthLargestItem(n)

	  #-------------------------------#
	 #  FINDING OBJECTS IN THE LIST  #
	#===============================#

	def FindObjects()
		
		aContent = This.Content()
		nLen = len(aContent)

		anResult = []

		for i = 1 to nLen
			if isObject(aContent[i])
				anResult + i
			ok
		next

		return anResult
			
	def ObjectsZ()

		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		acSeen = []
		for i = 1 to nLen	
			if NOT isObject(aContent[i])
				i++
			ok

			cName = :@NoName

			if ObjectIsStzObject(aContent[i])
				cName = aContent[i].VarName()
			ok

			if ring_find(acSeen, cName)
				loop
			ok

			anPos = This.FindObject(cName)
			aResult + [ cName, anPos ]
			acSeen + cName

		next

		return aResult

		def ObjectsAndTheirPositions()
			return This.Objects()

	def TheseObjectsZ(paObjects)

		if CheckParams() = TRUE
			if NOT ( isList(paObjects) and Q(paObjects).EachItemIsEitherA(:String, :Or, :Object) )
				StzRaise("Incorrect param type! paObjects must be a list of strings and objects.")
			ok
	
		ok

		# Doing the job

		nLen = len(paObjects)
		aResult = []
		acSeen = []

		for i = 1 to nLen
			if isObject(paObjects[i])
				cName = @ObjectVarName(paObjects[i])
			else
				cName = paObjects[i]
			ok

			if ring_find(acSeen, cName) = 0
				anPos = This.FindObject(cName)
				aResult + [ cName, anPos ]
				acSeen + cName
			ok
		next


		return aResult

	  #-----------------------------------------------#
	 #  FINDING NAMED & UNNAMED OBJECTS IN THE LIST  #
	#===============================================#

	def FindNamedObjects()
		aContent = This.Content()
		nLen = len(acontent)
		anResult = []

		for i = 1 to nLen
			if NOT isObject(aContent[i])
				loop
			ok

			if @ObjectVarName(aContent[i]) != :@NoName
				anResult + i
			ok
		next

		return anResult

	def FindUnnamedObjects()
		aContent = This.Content()
		nLen = len(acontent)
		anResult = []

		for i = 1 to nLen
			if NOT isObject(aContent[i])
				loop
			ok

			if @ObjectVarName(aContent[i]) = :@NoName
				anResult + i
			ok
		next

		return anResult

	def FindNamedObject(p) # pass an object or an object name in string

		cObjectVarName = :@NoName
		if isObject(p)
			cObjectVarName = p.VarName()
		but isString(p)
			cObjectVarName = p
		else
			StzRaise("Incorrect param type! p must be an object or a string containing an object varname.")
		ok

		aContent = This.Content()
		nLen = len(aContent)

		anResult = []

		for i = 1 to nLen
			if isObject(aContent[i]) and
			   aContent[i].VarName() = cObjectVarName

				anResult + i
				
			ok
		next

		return anResult

		def FindThisNamedObject(p)
			return This.FindNamedObject(p)

	def NamedObjectZ(paObject)
		if CheckParams()
			if NOT isObject(paObject) 
				StzRaise("Incorrect param type! paObject must be a list.")
			ok
		ok

		anPos = This.FindNamedObject(paObject)
		aResult = [ paObject, anPos ]	
		return aResult

	  #----------------------#
	 #  FINDING STZNUMBERS  #
	#======================#

	def FindStzNumbers()
		aContent = This.Content()
		nLen = len(aContent)

		anResult = []

		for i = 1 to nLen
			if @IsStzNumber(aContent[i])
				anResult + i
			ok
		next

		return anResult

	def StzNumbers()
		aContent = This.Content()
		nLen = len(aContent)

		anResult = []

		for i = 1 to nLen
			if @IsStzNumber(aContent[i])
				anResult + aContent[i]
			ok
		next

		return anResult

	  #----------------------#
	 #  FINDING STZSTRINGS  #
	#======================#

	def FindStzStrings()
		aContent = This.Content()
		nLen = len(aContent)

		anResult = []

		for i = 1 to nLen
			if @IsStzString(aContent[i])
				anResult + i
			ok
		next

		return anResult

	def StzStrings()
		aContent = This.Content()
		nLen = len(aContent)

		anResult = []

		for i = 1 to nLen
			if @IsStzString(aContent[i])
				anResult + aContent[i]
			ok
		next

		return anResult

	  #---------------------#
	 #  FINDING STZLISTSS  #
	#=====================#

	def FindStzLists()
		aContent = This.Content()
		nLen = len(aContent)

		anResult = []

		for i = 1 to nLen
			if @IsStzList(aContent[i])
				anResult + i
			ok
		next

		return anResult

	def StzLists()
		aContent = This.Content()
		nLen = len(aContent)

		anResult = []

		for i = 1 to nLen
			if @IsStzList(aContent[i])
				anResult + aContent[i]
			ok
		next

		return anResult

	  #----------------------#
	 #  FINDING STZOBJECTS  #
	#======================#

	def FindStzObjects()
		aContent = This.Content()
		nLen = len(aContent)

		anResult = []

		for i = 1 to nLen
			if @IsStzObject(aContent[i])
				anResult + i
			ok
		next

		return anResult

	def StzObjects()
		aContent = This.Content()
		nLen = len(aContent)

		anResult = []

		for i = 1 to nLen
			if @IsStzObject(aContent[i])
				anResult + aContent[i]
			ok
		next

		return anResult

	  #===========================================================#
	 #  CHECKING IF THE LIST CONTAINS JUST STRINGS IN UPPERCASE  #
	#===========================================================#

	def IsUppercase()
		if This.IsListOfStrings() and
		   LSQ( This.String() ).IsUppercase()
		   # LSQ() --> abbreviation of StzListOfStringsQ()

			return TRUE

		else
			return FALSE
		ok

		def IsAnUppecase()
			return This.IsUppercase()

		def IsUppercased()
			return This.IsUppercase()

		def IsUpper()
			return This.IsUppercase()

	  #-----------------------------------------------------------#
	 #  CHECKING IF THE LIST CONTAINS JUST STRINGS IN LOWERCASE  #
	#-----------------------------------------------------------#

	def IsLowercase()
		if This.IsListOfStrings() and
		   LSQ( This.String() ).IsLowercase()
		   # LSQ() --> abbreviation of StzListOfStringsQ()

			return TRUE

		else
			return FALSE
		ok

		def IsALowercase()
			return This.IsLowercase()

		def IsLowercased()
			return This.IsLowercase()

		def IsLower()
			return This.IsLowercase()

	  #------------------------------------------------------------#
	 #  TRANSFORMING THE LIST TO ITS REPRESENTATION IN RING CODE  #
	#------------------------------------------------------------#

	def ToCode()
		aContent = This.Content()
		nLen = len(aContent)

		if nLen = 0
			return "[ ]"
		ok

		cResult = "[ "

		for i = 1 to nLen
			if isNumber(aContent[i])
				cResult += "" +
					   aContent[i] + ", "

			but isString(aContent[i])
				cChar = '"'
	
				oQStr = new QString2()
				oQStr.append(aContent[i])
				c1 = oQStr.mid(0, 1)
				c2 = oQStr.mid(oQStr.count()-1, 1)
		
				if c1 = '"' or
				   c2 = '"'
					cChar = "'"
				ok
	
				cResult += (cChar + aContent[i] + cChar + ", ")


			but isList(aContent[i])
				cResult += ( ComputableForm(aContent[i]) + ", ")

			but isObject(aContent[i])
				cResult += @ObjectVarName(aContent[i]) + ", "

			ok

		next

		oQStr = new QString2()
		oQStr.append(cResult)
		oQStr.replace( (oQStr.count() - 2), 2, "" )
		oQStr.append(" ]")

		cResult = oQStr.mid(0, oQStr.count())
		return cResult


		def ToCodeQ()
			return new stzString(This.ToCode())

	  #------------------------------------------------------------------#
	 #  STRINGIFYING THE LIST (ALL ITEMS ARE FORCED TO BECOME STRINGS)  #
	#------------------------------------------------------------------#
	# TODO: Abstract this function in stzObject

	def Stringify()

		aContent = This.Content()
		nLen = len(aContent)

		acResult = []
		cItem = ""

		for i = 1 to nLen
			item = aContent[i]
			if isNumber(item)
				cItem = ""+ item

			but isString(item)
				cItem = item

			but isList(item)
				cItem = @@(item)

			but isObject(item)
				cItem = @ObjectVarName(aContent[i])
			ok

			acResult + cItem
		next

		This.UpdateWith(acResult)

		#< @FunctionFluentForm

		def StringifyQ()
			This.Stringify()
			return This

		def StringifyQR(pcReturnType)
			switch pcReturnType
			on :stzListOfStrings
				return new stzListOfstrings( This.Stringified() )
			other
				StzRaise("Unsupported return type!")
			off

		#>

	def Stringified()
		acResult = This.Copy().StringifyQ().Content()
		return acResult

		def ItemsStringified()
			return This.Stringified()

		def ToListOfStringifiedItems()
			return This.Stringified()

	  #---------------------------------------------------------------------------------------#
	 #  STRINGIFYING ITEMS AND REPLACING A SUBSTRING BY AN OTHER IN EACH STRING -- EXTENDED  #
	#---------------------------------------------------------------------------------------#
	# This extented version returns along the stringified items, the list of positions of
	# the items beeing affected by the replacement operation
	#--> Used internally to boost performance

	def StringifyAndReplaceCSXT(pcSubStr, pcOtherSubStr, pCaseSensitive)
		#< QtBased | Uses QString2() #>

		# NOTE: General note on performance of code written here in SoftanzaLib

		# For all loops running on large data (tens of thousands of times and more), we
		# don't rely on softanza objects services (stzString and alike), we use Qt directly instead!

		# In fact the problem comes, not from Softanza objects themselves, but from
		# going back and forth between Ring and Qt

		# Resolving params

		if NOT isString(pcSubStr)
			StzRaise("Incorrect param type! pcSubStr must be a string.")
		ok

		if isList(pcOtherSubStr) and Q(pcOtherSubStr).IsWithOrByOrUsingNamedParam()
			pcOtherSubStr = pcOtherSubStr[2]
		ok

		if NOT isString(pcOtherSubStr)
			StzRaise("Incorrect param type! pcOtherSubStr must be a string.")
		ok

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT (pCaseSensitive = TRUE or pCaseSensitive = FALSE)
			StzRaise("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		acResult = []
		anPos = []
		anPosExt = []
		cExtension = Q("_").RepeatedNTImes( ( Q(pcOtherSubStr).NumberOfChars() * 2 ) )

		cItem = ""

		for i = 1 to nLen
			item = aContent[i]
			if isNumber(item)
				cItem = ""+ item

			but isString(item)

				oQStr = new QString2()
				oQStr.append(item)

				bExtend = FALSE
				if oQStr.contains(pcOtherSubStr, pCaseSensitive)
					bExtend = TRUE
				ok

				if NOT oQStr.contains(pcSubStr, pCaseSensitive)
					cItem = item
				else
					oQStr.replace_2(pcSubStr, pcOtherSubStr, pCaseSensitive)
					cItem = oQStr.mid(0, oQStr.count())
					anPos + i
				ok

				if bExtend and ring_find(anPos, i) = 0
					cItem = cExtension + cItem + cExtension
					anPosExt + i
				ok

			but isList(item)
				item = @@(item)
				oQStr = new QString2()
				oQStr.append(item)

				bExtend = FALSE
				if oQStr.contains(pcOtherSubStr, pCaseSensitive)
					bExtend = TRUE
				ok

				if NOT oQStr.contains(pcSubStr, pCaseSensitive)
					cItem = item
				else

					oQStr.replace_2(pcSubStr, pcOtherSubStr, pCaseSensitive)
					cItem = oQStr.mid(0, oQStr.count())
				ok

				if bExtend and ring_find(anPos, i) = 0
					cItem += cExtendion
					anPosExt + i
				ok

			but isObject(item)
				cItem = @ObjectVarName(aContent[i])
			ok

			acResult + cItem
		next

		aResult = [ acResult, anPos, anPosExt ]
		This.UpdateWith(aResult)

		#< @FunctionFluentForm

		def StringifyAndReplaceCSXTQ(pcSubStr, pcOtherSubStr, pCaseSensitive)
			This.StringifyAndReplaceCSXT(pcSubStr, pcOtherSubStr, pCaseSensitive)
			return This

		def StringifyAndReplaceCSXTQR(pcSubStr, pcOtherSubStr, pCaseSensitive, pcReturnType)
			switch pcReturnType
			on :stzListOfStrings
				return new stzListOfstrings( This.StringifiedAndReplacedCSXT(pcSubStr, pcOtherSubStr, pCaseSensitive) )
			other
				StzRaise("Unsupported return type!")
			off

		#>

	def StringifiedAndReplacedCSXT(pcSubStr, pcOtherSubStr, pCaseSensitive)
		acResult = This.Copy().StringifyAndReplaceCSXTQ(pcSubStr, pcOtherSubStr, pCaseSensitive).Content()
		return acResult

		def ItemsStringifiedAndReplacedCSXT(pcSubStr, pcOtherSubStr, pCaseSensitive)
			return This.StringifiedAndCommaReplacedCSXT(pcSubStr, pcOtherSubStr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def StringifyAndReplaceXT(pcSubStr, pcOtherSubStr)
		This.StringifyAndReplaceCSXT(pcSubStr, pcOtherSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def StringifyAndReplaceXTQ(pcSubStr, pcOtherSubStr)
			This.StringifyAndReplaceXT(pcSubStr, pcOtherSubStr)
			return This

		def StringifyAndReplaceXTQR(pcSubStr, pcOtherSubStr, pcReturnType)
			switch pcReturnType
			on :stzListOfStrings
				return new stzListOfstrings( This.StringifiedAndReplacedXT(pcSubStr, pcOtherSubStr) )
			other
				StzRaise("Unsupported return type!")
			off

		#>

	def StringifiedAndReplacedXT(pcSubStr, pcOtherSubStr)
		acResult = This.Copy().StringifyAndReplaceXTQ(pcSubStr, pcOtherSubStr).Content()
		return acResult

		def ItemsStringifiedAndReplacedXT(pcSubStr, pcOtherSubStr)
			return This.StringifiedAndReplacedXT(pcSubStr, pcOtherSubStr)

	  #-------------------------------------------------------------------------------#
	 #  STRINGIFYING THE ITEMS AND REPLACING A SUBSTRING BY AN OTHER IN EACH STRING  #
	#-------------------------------------------------------------------------------#

	def StringifyAndReplaceCS(pcSubStr, pcOtherSubStr, pCaseSensitive)
		#< QtBased | Uses QString2() #>

		aResult = This.Copy().StringifyAndReplaceCSXTQ(pcSubStr, pcOtherSubStr, pCaseSensitive).Content()[1]
		This.Update(aResult)

		#< @FunctionFluentForm

		def StringifyAndReplaceCSQ(pcSubStr, pcOtherSubStr, pCaseSensitive)
			This.StringifyAndReplaceCS(pcSubStr, pcOtherSubStr, pCaseSensitive)
			return This

		def StringifyAndReplaceCSQR(pcSubStr, pcOtherSubStr, pCaseSensitive, pcReturnType)
			switch pcReturnType
			on :stzListOfStrings
				return new stzListOfstrings( This.StringifiedAndReplacedCS(pcSubStr, pcOtherSubStr, pCaseSensitive) )
			other
				StzRaise("Unsupported return type!")
			off

		#>

	def StringifiedAndReplacedCS(pcSubStr, pcOtherSubStr, pCaseSensitive)
		acResult = This.Copy().StringifyAndReplaceCSQ(pcSubStr, pcOtherSubStr, pCaseSensitive).Content()
		return acResult

		def ItemsStringifiedAndReplacedCS(pcSubStr, pcOtherSubStr, pCaseSensitive)
			return This.StringifiedAndCommaReplacedCS(pcSubStr, pcOtherSubStr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def StringifyAndReplace(pcSubStr, pcOtherSubStr)
		This.StringifyAndReplaceCS(pcSubStr, pcOtherSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def StringifyAndReplaceQ(pcSubStr, pcOtherSubStr)
			This.StringifyAndReplace(pcSubStr, pcOtherSubStr)
			return This

		def StringifyAndReplaceQR(pcSubStr, pcOtherSubStr, pcReturnType)
			switch pcReturnType
			on :stzListOfStrings
				return new stzListOfstrings( This.StringifiedAndReplaced(pcSubStr, pcOtherSubStr) )
			other
				StzRaise("Unsupported return type!")
			off

		#>

	def StringifiedAndReplaced(pcSubStr, pcOtherSubStr)
		acResult = This.Copy().StringifyAndReplaceQ(pcSubStr, pcOtherSubStr).Content()
		return acResult

		def ItemsStringifiedAndReplaced(pcSubStr, pcOtherSubStr)
			return This.StringifiedAndReplaced(pcSubStr, pcOtherSubStr)

	  #----------------------------------------------------------------------------------------------------------#
	 #  STRINGIFYING ITEMS, LOWERCASING THEM, AND REPLACING A SUBSTRING BY AN OTHER IN EACH STRING -- EXTENDED  #
	#==========================================================================================================#

	# A special function used internally by Softanza to boost its performance

	def StringifyLowercaseAndReplaceCSXT(pcSubStr, pcOtherSubStr, pCaseSensitive)
		#< QtBased | Uses QString2() #>

		# Resolving params

		if NOT isString(pcSubStr)
			StzRaise("Incorrect param type! pcSubStr must be a string.")
		ok

		if isList(pcOtherSubStr) and Q(pcOtherSubStr).IsWithOrByOrUsingNamedParam()
			pcOtherSubStr = pcOtherSubStr[2]
		ok

		if NOT isString(pcOtherSubStr)
			StzRaise("Incorrect param type! pcOtherSubStr must be a string.")
		ok

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT (pCaseSensitive = TRUE or pCaseSensitive = FALSE)
			StzRaise("Incorrect param! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		acResult = []
		anPos = []
		cItem = ""
		anPosExt = []
		cExtension = Q("_").RepeatedNTImes( ( Q(pcOtherSubStr).NumberOfChars() * 2 ) )
		
		cItem = ""

		for i = 1 to nLen
			item = aContent[i]
			if isNumber(item)
				cItem = ""+ item

			but isString(item)

				oQStr = new QString2()
				oQStr.append(item)


				bExtend = FALSE
				if oQStr.contains(pcOtherSubStr, pCaseSensitive)
					bExtend = TRUE
				ok

				if NOT oQStr.contains(pcSubStr, pCaseSensitive)
					cItem = item
				else
					oQStr.replace_2(pcSubStr, pcOtherSubStr, pCaseSensitive)
					cItem = oQStr.mid(0, oQStr.count())
					anPos + i
				ok

				if bExtend and ring_find(anPos, i) = 0
					cItem = cExtension + cItem + cExtension
					anPosExt + i
				ok

			but isList(item)
				item = @@(item)
				oQStr = new QString2()
				oQStr.append(item)

				bExtend = FALSE
				if oQStr.contains(pcOtherSubStr, pCaseSensitive)
					bExtend = TRUE
				ok

				if NOT oQStr.contains(pcSubStr, pCaseSensitive)
					cItem = item
				else
					oQStr.replace_2(pcSubStr, pcOtherSubStr, pCaseSensitive)
					cItem = oQStr.mid(0, oQStr.count())
				ok

				if bExtend and ring_find(anPos, i) = 0
					cItem += cExtendion
					anPosExt + i
				ok

			but isObject(item)
				cItem = @ObjectVarName(aContent[i])
			ok

			oQLocale = new QLocale("C")
			cItem = oQLocale.toLower( cItem )
			acResult + cItem
		next

		aResult = [ acResult, anPos, anPosExt ]
		This.UpdateWith(aResult)

		#< @FunctionFluentForm

		def StringifyLowercaseAndReplaceCSXTQ(pcSubStr, pcOtherSubStr, pCaseSensitive)
			This.StringifyLowercaseAndReplaceCSXT(pcSubStr, pcOtherSubStr, pCaseSensitive)
			return This

		def StringifyLowercaseAndReplaceCSXTQR(pcSubStr, pcOtherSubStr, pCaseSensitive, pcReturnType)
			switch pcReturnType
			on :stzListOfStrings
				return new stzListOfstrings( This.StringifiedLowercasedAndReplacedCSXT(pcSubStr, pcOtherSubStr, pCaseSensitive) )
			other
				StzRaise("Unsupported return type!")
			off

		#>

	def StringifiedLowercasedAndReplacedCSXT(pcSubStr, pcOtherSubStr, pCaseSensitive)
		acResult = This.Copy().StringifyLowercaseAndReplaceCSXTQ(pcSubStr, pcOtherSubStr, pCaseSensitive).Content()
		return acResult

		def ItemsStringifiedLowercasedAndReplacedCSXT(pcSubStr, pcOtherSubStr, pCaseSensitive)
			return This.StringifiedLowercasedAndCommaReplacedCSXT(pcSubStr, pcOtherSubStr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def StringifyLowercaseAndReplaceXT(pcSubStr, pcOtherSubStr)
		This.StringifyLowercaseAndReplaceCSXT(pcSubStr, pcOtherSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def StringifyLowercaseAndReplaceXTQ(pcSubStr, pcOtherSubStr)
			This.StringifyLowercaseAndReplaceXT(pcSubStr, pcOtherSubStr)
			return This

		def StringifyLowercaseAndReplaceXTQR(pcSubStr, pcOtherSubStr, pcReturnType)
			switch pcReturnType
			on :stzListOfStrings
				return new stzListOfstrings( This.StringifiedLowercasedAndReplacedXT(pcSubStr, pcOtherSubStr) )
			other
				StzRaise("Unsupported return type!")
			off

		#>

	def StringifiedLowercasedAndReplacedXT(pcSubStr, pcOtherSubStr)
		acResult = This.Copy().StringifyLowercaseAndReplaceXTQ(pcSubStr, pcOtherSubStr).Content()
		return acResult

		def ItemsStringifiedLowercasedAndReplacedXT(pcSubStr, pcOtherSubStr)
			return This.StringifiedLowercasedAndReplacedXT(pcSubStr, pcOtherSubStr)

	  #-----------------------------------------------------------------------------------------------#
	 #  STRINGIFYING ITEMS, LOWERCASING THEM, AND REPLACING A SUBSTRING BY AN OTHER IN EACH STRING   #
	#-----------------------------------------------------------------------------------------------#
	# A special function used internally by Softanza to boost its performance

	def StringifyLowercaseAndReplaceCS(pcSubStr, pcOtherSubStr, pCaseSensitive)
		#< QtBased | Uses QString2() #>

		aResult = This.Copy().StringifyLowercaseAndReplaceCSXTQ(pcSubStr, pcOtherSubStr, pCaseSensitive).Content()[1]
		This.Update(aResult)
		
		#< @FunctionFluentForm

		def StringifyLowercaseAndReplaceCSQ(pcSubStr, pcOtherSubStr, pCaseSensitive)
			This.StringifyLowercaseAndReplaceCS(pcSubStr, pcOtherSubStr, pCaseSensitive)
			return This

		def StringifyLowercaseAndReplaceCSQR(pcSubStr, pcOtherSubStr, pCaseSensitive, pcReturnType)
			switch pcReturnType
			on :stzListOfStrings
				return new stzListOfstrings( This.StringifiedLowercasedAndReplacedCS(pcSubStr, pcOtherSubStr, pCaseSensitive) )
			other
				StzRaise("Unsupported return type!")
			off

		#>

	def StringifiedLowercasedAndReplacedCS(pcSubStr, pcOtherSubStr, pCaseSensitive)
		acResult = This.Copy().StringifyLowercaseAndReplaceCSQ(pcSubStr, pcOtherSubStr, pCaseSensitive).Content()
		return acResult

		def ItemsStringifiedLowercasedAndReplacedCS(pcSubStr, pcOtherSubStr, pCaseSensitive)
			return This.StringifiedLowercasedAndCommaReplacedCS(pcSubStr, pcOtherSubStr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def StringifyLowercaseAndReplace(pcSubStr, pcOtherSubStr)
		This.StringifyLowercaseAndReplaceCS(pcSubStr, pcOtherSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def StringifyLowercaseAndReplaceQ(pcSubStr, pcOtherSubStr)
			This.StringifyLowercaseAndReplace(pcSubStr, pcOtherSubStr)
			return This

		def StringifyLowercaseAndReplaceQR(pcSubStr, pcOtherSubStr, pcReturnType)
			switch pcReturnType
			on :stzListOfStrings
				return new stzListOfstrings( This.StringifiedLowercasedAndReplaced(pcSubStr, pcOtherSubStr) )
			other
				StzRaise("Unsupported return type!")
			off

		#>

	def StringifiedLowercasedAndReplaced(pcSubStr, pcOtherSubStr)
		acResult = This.Copy().StringifyLowercaseAndReplaceQ(pcSubStr, pcOtherSubStr).Content()
		return acResult

		def ItemsStringifiedLowercasedAndReplaced(pcSubStr, pcOtherSubStr)
			return This.StringifiedLowercasedAndReplaced(pcSubStr, pcOtherSubStr)

	  #==================================================#
	 #  TRANSFORMING THE ITEMS OF THE LIST TO A STRING  #
	#==================================================#

	def ToString()
		return This.ToStringXT(:ConcatenatedUsing = NL)

		def ToStringQ()
			return new stzString( This.ToString() )

	def ToStringXT(pOption)
		if isString(pOption)
			if pOption = :AsCode
				return This.ToCode()

			but pOption = :Concatenated
				return This.StringifyQR(:stzListOfStrings).Concatenated()
			ok

		but isList(pOption) and
		    Q(pOption).IsOneOfTheseNamedParams([
			:Concatenated, :ConcatenatedUsing, :ConcatenatedWith ])

			if isList(pOption[2]) and
			   Q(pOption[2]).IsOneOfTheseNamedParams([ :Using, :With ])

				pOption[2] = pOption[2][2]
			ok

			return This.StringifyQR(:stzListOfStrings).ConcatenatedUsing(pOption[2])
		ok

		StzRaise("Unsupprorted syntax!")
			
		def ToStringXTQ(pOption)
			return new stzString( This.ToStringXT(pOption) )

	
	   #---------------------------------------------#
	  #  CHECKS IF THE LIST CONTAINS AT LEAST ONE   #
	 #  ITEM IN THE FORM OF A CONDITIONAL CODE     #
	#---------------------------------------------#

	def ContainsCCode()
		bResult = FALSE

		aTempList = This.List()
		nLen = len(aTempList)

		
		for i = 1 to nLen
			item = aTempList[i]

			if isList(item) and Q(item).IsWhereNamedParam()
				item = item[2]
			ok

			if isString(item) and
			   Q(item).TrimQ().IsBoundedBy(["{","}"])
				bResult = TRUE
				exit
			ok
		next

		return bResult

		def ContainsConditionalCode()
			return This.ContainsCCode()

	  #====================================================#
	 #      CHECKING IF EACH ITEM IS EITHER ... OR ...    #
	#====================================================#

	def AllItemsAreEither(p1, p2, p3)

		/* EXAMPLE

		SYNTAX 1

		o1 = new stzList([ "to", -4, "be", "or", -8, "not", "to", -10, "be" ])
		? o1.EachItemIsEitherA( :Number, :Or, :String )
		#--> TRUE

		SYNTAX 2

		o1 = new stzList([ 6, -2, 9, 5, -10 ])
		? o1.EachItemIsEither(:Positive, :Or = :Negative, :Number )
		#--> TRUE

		*/

		# Checking params

		cSyntax = ""

		if isString(p2) and Q(p2).IsEither(:Or, :OrA)
			cSyntax = "1"

		but isList(p2) and Q(p2).IsOneOfTheseNamedParams([ :Or, :OrA ])
			p2 = p2[2]
			cSyntax = "2"
		ok

		if cSyntax = ""
			StzRaise("Insupported syntax!")
		ok

		if NOT ( isString(p1) and isString(p2) and isString(p3) )
			StzRaise("Incorrect param types! p1, p2, and p3 must be all strings.")
		ok

		# Composing the conditional expression

		if cSyntax = "1"
			if p1 = :Object
				p1 = "n" + p1
			ok
			if p3 = :Object
				p3 = "n" + p3
			ok

			cCode = 'bOk = ( Q(aContent[@i]).IsA' + p1 + '() or' + NL +
				'Q(aContent[@i]).IsA' + p3 + '() )'

		but cSyntax = "2"

			if NOT This.AllItemsAre(p3)
				return FALSE
			ok
	
			if p1 = :Object
				p1 = "n" + p1
			ok
			if p2 = :Object
				p2 = "n" + p2
			ok

			cCode = 'bOk = ( Stz' + p3 + 'Q(aContent[@i]).IsA' + p1 + '() ) or' + NL +
			        '( Stz' + p3 + 'Q(aContent[@i]).IsA' + p2 + '() )'
	
		ok


		# Doing the job

		aContent = This.Content()
		nLen = len(aContent)

		bResult = TRUE

		for @i = 1 to nLen

			eval(cCode)

			if NOT bOk
				bResult = FALSE
				exit
			ok
		next

		return bResult

		#< @FunctionAlternativeForms

		def ItemsAreEither(p1, p2, p2)
			return This.AllItemsAreEither(p1, p2, p3)

		def EachItemIsEither(p1, p2, p3)
			return This.AllItemsAreEither(p1, p2, p3)

		def EachItemIsEitherA(p1, p2, p3)
			return This.AllItemsAreEither(p1, p2, p3)

		def EachItemIsEitherAn(p1, p2, p3)
			return This.AllItemsAreEither(p1, p2, p3)

		def ItemsHaveEither(p1, p2, p3)
			return This.AllItemsAreEither(p1, p2)

		def AllItemsHaveEither(p1, p2, p3)
			return This.AllItemsAreEither(p1, p2, p3)

		#>

	def AllItemsAreEitherXT(p1, p2, p3, paEvalDirection)
		if isList(p2) and Q(p2).IsANamedParam()
			p2 = p2[2]
		ok

		if This.AllItemsAreXT([p1, p3], paEvalDirection) or
		   This.AllItemsAreXT([p2, p3], paEvalDirection)

			return TRUE
		else
			return FALSE
		ok

		#< @FunctionAlternativeForms

		def ItemsAreEitherXT(p1, p2, p3, paEvalDirection)
			return This.AllItemsAreEitherXT(p1, p2, p3, paEvalDirection)

		def EachItemIsEitherXT(p1, p2, p3, paEvalDirection)
			return This.AllItemsAreEitherXT(p1, p2, p3, paEvalDirection)

		def EachItemIsEitherAXT(p1, p2, p3, paEvalDirection)
			return This.AllItemsAreEitherXT(p1, p2, p3, paEvalDirection)

		def EachItemIsEitherAnXT(p1, p2, p3, paEvalDirection)
			return This.AllItemsAreEitherXT(p1, p2, p3, paEvalDirection)

		def ItemsHaveEitherXT(p1, p2, p3, paEvalDirection)
			return This.AllItemsAreEitherXT(p1, p2, p3, paEvalDirection)

		def AllItemsHaveEitherXT(p1, p2, p3, paEvalDirection)
			return This.AllItemsAreEitherXT(p1, p2, p3, paEvalDirection)

		#>

	  #----------------------------------------#
	 #      CHECKING IF ALL ITEMS ARE ...     #
	#----------------------------------------#

	def AllItemsAre(p)
		/* EXAMPLE

		? Q([ "ONE", "ONE", "ONE" ]).AllItemsAre("ONE")
		#--> TRUE

		
		? Q([ "ONE", "TWO", "THREE" ]).AllItemsAre([ :Strings ])
		#--> TRUE
		
		? Q([ "ONE", "TWO", "THREE" ]).AllItemsAre([ :Uppercase, :Strings ])
		#--> TRUE
		
		? Q([ "ONE", "TWO", "THREE" ]).AllItemsAre([ :Uppercase, W('len(@item)=3'), :Strings ])
		
		*/

		# Q([ "ONE", "ONE", "ONE" ]).AllItemsHave('len(@item) = 3')

		nLen = This.NumberOfItems()

		if isList(p) and Q(p).IsWhereNamedParam()

			p = p[2]
		ok

		if isString(p) and Q(p).TrimQ().IsBoundedBy([ "{", "}" ])

			cCode = 'bOk = (' + Q(p).BoundsRemoved([ "{", "}" ]) + ')'

			bResult = TRUE
			for @i = 1 to nLen
				@item = This.Item(@i)
				eval(cCode)
				if NOT bOk
					bResult = FALSE
					exit
				ok
			next

			return bResult
			
		# ? Q([ "ONE", "TWO", "THREE" ]).AllItemsAre(:Strings)
		but isString(p) and
		    ( Q("stz" + p).IsStzClassName() or
		    Q("stz" + p).IsPluralOfStzClassName() )

			cMethod = ""

			if p = :Number or p = :Numbers
				cMethod = :IsANumber

			but p = :String or p = :Strings
				cMethod = :IsAString

			but p = :List or p = :Lists
				cMethod = :IsAList

			but p = :Object or p = :Objects
				cMethod = :IsAnObject
			
			else
				if Q('stz' + p).IsPluralOfAStzClass()
					p = PluralToStzClass('stz' + p)
				ok

				cMethod = 'Is' + Q(p).RemovedFromLeft("stz")

			ok

			# We could use this one line:
			# bResult = This.Check(:That = 'Q(@item).' + cMethod + '()')

			# But it should better for performance to make it manually

			cCode = 'bOk = ( Q(@item).' + cMethod + '() )'

			bResult = TRUE
			for @i = 1 to nLen
				@item = This.Item(@i)
				eval(cCode)
				if NOT bOk
					bResult = FALSE
					exit
				ok
			next

			return bResult

		# Q([ "ONE", "TWO", "THREE" ]).AllItemsAre([ :Uppercase, :Strings ])
		but isList(p) and Q(p).IsListOfStrings() and
		    Q("stz" + p[len(p)]).IsStzClassNameXT() # ..XT() --> in singular or plural form

			return This.AllItemsAreXT(p, :Default)

		but isList(p) and Q(p).ContainsCCode()

			return This.AllItemsAreXT(p, :Default)

		# ? Q([ "♥", "♥", "♥" ]).AllItemsAre("♥")
		else

			bResult = TRUE
			aItems = This.Content()
			nLen = len(aItems)

			for i = 1 to nLen

				if NOT Q(aItems[i]).IsEqualTo(p)
					bResult = FALSE
					exit
				ok
			next

			return bResult

		ok

		#< @FunctionAlternativeForms

		def ItemsAre(p)
			return This.AllItemsAre(p)

		def EachItemIs(p)
			return This.AllItemsAre(p)

		def EachItemIsA(p)
			return This.AllItemsAre(p)

		def EachItemIsAn(p)
			return This.AllItemsAre(p)

		def ItemsHave(p)
			return This.AllItemsAre(p)

		def AllItemsHave(p)
			return This.AllItemsAre(p)

		#>

	def AllItemsAreXT(p, paEvalDirection)

		if NOT isList(p)
			StzRaise("Incorrect param type! p must be a list.")
		ok

		if len(p) = 0
			return FALSE
		ok

		if isList(paEvalDirection) and
		   Q(paEvalDirection).IsOneOfTheseNamedParams([
			:Eval, :Evaluate,
			:EvalFrom, :EvaluateFrom,
			:EvalDirection, :EvaluationDirection
		   ])

			paEvalDirection = paEvalDirection[2]
		ok

		if NOT Q(paEvalDirection).IsOneOfTheseCS([
			:Default, :Nothing,
			:LeftToRight, :RightToLeft,
			:Left2Right, :Right2Left,
			:FromLeftToRight, :FromRightToLeft,
			:FromLeft2Right, :FromRight2Left,
			:LTR, :RTL, :L2R, :R2L,
			:FromLTR, :FromRTL, :FromL2R, :FromR2L
			], :CS = FALSE)

			StzRaise("Incorrect param value for paEvalDirection! Allowed values are :RightToLeft and :LeftToRight.")
		ok

		if Q(paEvalDirection).IsEither(:Default, :Or = :Nothing)
			paEvalDirection = :RightToLeft
		ok

		# Doing the job

		if Q(paEvalDirection).IsOneOfTheseCS([
			:RightToLeft,
			:Right2Left,
			:FromRightToLeft,
			:FromRight2Left,
			:RTL, :R2L,
			:FromRTL, :FromR2L
			], :CS = FALSE)

			p = Q(p).Reversed()
		ok

		if len(p) = 1 and isString(p[1])
			return This.AllItemsAre(p[1])

		but Q(p).IsWhereNamedParam()
			return This.AllItemsAre(p[1])

		else
			nLenMethods = len(p)
			for i = 2 to nLenMethods
				if isList(p[i]) and Q(p[i]).IsWhereNamedParam()
					p[i] = p[i][2]
				ok
			next

			cMainClass = 'stz' + Q(p[1]).InfereStzClass()
			cCode = 'oObj = new ' + cMainClass + '(@item)'

			aContent = This.Content()
			nLenList = len(aContent)

			bResult = TRUE

			for i = 1 to nLenList
				@item = aContent[i]
		
				for j = 2 to nLenMethods

					if Q(p[j]).TrimQ().IsBoundedBy(["{","}"])
						cCode = 'bOk = (' + Q(p[j]).TrimQ().BoundsRemoved(["{","}"]) + ')'
					else
						cCode = 'bOk = Q(@item).Is' + p[j] + '()'
					ok

					eval(cCode)
					if NOT bOk
						bResult = FALSE
						exit 2
					ok
				next j
			next i

			return bResult
		ok

		#< @FunctionAlternativeForms

		def ItemsAreXT(p, paEvalDirection)
			return This.AllItemsAreXT(pacDescriptors, paEvalDirection)

		def EachItemIsXT(p, paEvalDirection)
			return This.AllItemsAreXT(pacDescriptors, paEvalDirection)

		def EachItemIsAXT(p, paEvalDirection)
			return This.AllItemsAreXT(pacDescriptors, paEvalDirection)

		def EachItemIsAnXT(p, paEvalDirection)
			return This.AllItemsAreXT(pacDescriptors, paEvalDirection)

		def ItemsHaveXT(p, paEvalDirection)
			return This.AllItemsAreXT(pacDescriptors, paEvalDirection)

		def AllItemsHaveXT(p, paEvalDirection)
			return This.AllItemsAreXT(pacDescriptors, paEvalDirection)

		#>

	  #================================#
	 #    USUED FOR NATURAL-CODING    #
	#================================#

	def IsAString()
		return FALSE

		def IsNotAString()
			return TRUE

	def IsAList()
		return TRUE

		def IsNotAList()
			return FALSE

	def IsAnObject()
		return TRUE

		def IsNotAnObject()
			return FALSE

	#--- ITEM

	def IsItem()
		return TRUE

		def IsAnItem()
			return This.IsItem()

	def IsItemOf(paList)
		return StzListQ(paList).Contains(This.Content())
	
		def AsAnItemOf(paList)
			return This.IsItemOf(paList)
	
	def IsItemIn(paList)
		return This.IsItemOf(paList)
	
		def IsAnItemIn(paList)
			return This.IsItemOf(paList)

	#--

	def IsMember()
		return TRUE

		def IsAMember()
			return This.IsMember()

	def IsMemberOf(paList)
		return StzListQ(paList).Contains(This.Content())
	
		def AsAMemberOf(paList)
			return This.IsMemberOf(paList)
	
	def IsMemberIn(paList)
		return This.IsMemberOf(paList)
	
		def IsAMemberIn(paList)
			return This.IsMemberOf(paList)


	#--- NUMBER

	def IsANumber()
		return FALSE

		def IsNotANumber()
			return TRUE

	def IsNumberOf(paList)
		return FALSE

		def IsANumberOf(paList)
			return FALSE
	
	def IsNumberIn(paList)
		return FALSE
	
		def IsANumberIn(paList)
			return FALSE

	#--- ITEM

	def IsLetter()
		return FALSE

		def IsALetter()
			return FALSE
	
	def IsLetterOf(pStrOrListOfChars)
		return FALSE

		def IsALetterOf(pcStr)
			return FALSE
	
	def IsLetterIn(pcStr)
		return FALSE

		def IsALetterIn(pcStr)
			FALSE

	def IsCharOf(pStrOrListOfChars)
		return FALSE

		def IsACharOf(pcStr)
			return FALSE

	def IsCharIn(pcStr)
		return FALSE

		def IsACharIn(pcStr)
			return FALSE

	def Methods()
		return ring_methods(This)

	def Attributes()
		return ring_attributes(This)

	def ClassName()
		return "stzlist"

		def StzClassName()
			return This.ClassName()

		def StzClass()
			return This.ClassName()

	  #===========================================#
	 #   CHECKING IF THE LIST IS A NAMED PARAM   #
	#===========================================#
	# TODO: Add @ to all params, like this:
	# (This[1] = :ParamName or This[1] = :ParamName@ ) )

	def IsOnPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OnPosition)

			return TRUE
		else
			return FALSE
		ok

		def IsInPositionNamedParam()
			if This.NumberOfItems() = 2 and
			   ( isString(This[1]) and This[1] = :InPosition)
	
				return TRUE
			else
				return FALSE
			ok
	
		// def IsAtPositionNamedParam() --> Exists below in the file


	def IsOnPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OnPositions)

			return TRUE
		else
			return FALSE
		ok

		def IsInPositionsNamedParam()
			if This.NumberOfItems() = 2 and
			   ( isString(This[1]) and This[1] = :InPositions)
	
				return TRUE
			else
				return FALSE
			ok
	
		// def IsAtPositionsNamedParam() # Exists in the file below

	def IsOnSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OnSection)

			return TRUE
		else
			return FALSE
		ok

		// def IsInSectionNamedParam() # Exists in the file below
	
		// def IsAtSectionNamedParam() # Idem


	def IsOnSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OnSections)

			return TRUE
		else
			return FALSE
		ok

		// def IsInSectionsNamedParam() # Exists in the file below
	
		// def IsAtSectionsNamedParam() # Idem

	#--

	def IsHarvestNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :Harvest)

			return TRUE
		else
			return FALSE
		ok

	def IsAndHarvestNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndHarvest)

			return TRUE
		else
			return FALSE
		ok

	def IsAndThenHarvestNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndThenHarvest)

			return TRUE
		else
			return FALSE
		ok

	def IsThenHarvestNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :ThenHarvest)

			return TRUE
		else
			return FALSE
		ok

	def IsYieldNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :Yield)

			return TRUE
		else
			return FALSE
		ok

	def IsAndYieldNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndYield)

			return TRUE
		else
			return FALSE
		ok

	def IsAndThenYieldNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndThenYield)

			return TRUE
		else
			return FALSE
		ok

	def IsThenYieldNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :ThenYield)

			return TRUE
		else
			return FALSE
		ok

	#--

	def IsHarvestSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :HarvestSection)

			return TRUE
		else
			return FALSE
		ok

	def IsAndHarvestSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndHarvestSection)

			return TRUE
		else
			return FALSE
		ok

	def IsAndThenHarvestSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndThenHarvestSection)

			return TRUE
		else
			return FALSE
		ok

	def IsThenHarvestSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :ThenHarvestSection)

			return TRUE
		else
			return FALSE
		ok

	def IsYieldSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :YieldSection)

			return TRUE
		else
			return FALSE
		ok

	def IsAndYieldSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndYieldSection)

			return TRUE
		else
			return FALSE
		ok

	def IsAndThenYieldSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndThenYieldSection)

			return TRUE
		else
			return FALSE
		ok

	def IsThenYieldSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :ThenYieldSection)

			return TRUE
		else
			return FALSE
		ok

	#--

	def IsHarvestSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :HarvestSections)

			return TRUE
		else
			return FALSE
		ok

	def IsAndHarvestSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndHarvestSections)

			return TRUE
		else
			return FALSE
		ok

	def IsAndThenHarvestSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndThenHarvestSections)

			return TRUE
		else
			return FALSE
		ok

	def IsThenHarvestSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :ThenHarvestSections)

			return TRUE
		else
			return FALSE
		ok

	def IsYieldSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :YieldSections)

			return TRUE
		else
			return FALSE
		ok

	def IsAndYieldSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndYieldSections)

			return TRUE
		else
			return FALSE
		ok

	def IsAndThenYieldSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndThenYieldSections)

			return TRUE
		else
			return FALSE
		ok

	def IsThenYieldSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :ThenYieldSections)

			return TRUE
		else
			return FALSE
		ok
	#--

	def IsNCharsBeforeNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :NCharsBefore)

			return TRUE
		else
			return FALSE
		ok

	def IsNCharsAfterNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :NCharsAfter)

			return TRUE
		else
			return FALSE
		ok

	def IsOneOfTheseNamedParams(pacParamNames)
		bResult = FALSE

		for cParamName in pacParamNames
			cCode = 'bFound = This.Is' + cParamName + 'NamedParam()'
			eval(cCode)
			if bFound
				bResult = TRUE
				exit
			ok
		next

		return bResult

		#< @FunctionMisspelledForm

		def IsOneTheseNamedParams(pacParamNames)
			return This.IsOneOfTheseNamedParams(pacParamNames)

		#>

	def IsRemoveAtOptionsNamedParam()
		bResult = FALSE

		if This.IsHashList() and

		   This.ToStzHashList().KeysQ().IsMadeOfSome([
			:RemoveNCharsBefore, :RemoveNCharsAfter,
			:RemoveThisSubStringBefore,:RemoveThisSubStringAfter,
			:RemoveThisCharBefore,:RemoveThisCharBefore,
			:RemoveThisBound, :RemoveThisBoundingSubString,
			:CaseSensitive, :CS ])
			# NOTE: I've decided to keep CS as a suffix in the function
			# name and never use it as an internal option...
			#--> more simple mental model to keep things memprable

			if This.ToStzHashList().
				KeysQR(:stzListOfStrings).
				ContainsBothCS(:CaseSensitive, :CS, :CS = FALSE)

				StzRaise("Incorrect format! :CaseSensitive and :CS can not be used both in the same time")
			ok

			if This.ToStzHashList().
				KeysQR(:stzListOfStrings).
				ContainsBothCS(:RemoveThisBound, :RemoveThisBoundingSubString, :CS = FALSE)

				StzRaise("Incorrect format! :RemoveThisBound and :RemoveThisBoundingSubString can not be used both in the same time")
			ok

			bOk1 = FALSE
			nRemoveNCharsBefore = This.Content()[ :RemoveNCharsBefore ]
			cType = ring_type(nRemoveNCharsBefore)
		   	if cType = "NUMBER" or ( cType = "STRING" and nRemoveNCharsBefore = NULL )
				bOk1 = TRUE
			ok

			bOk2 = FALSE
			nRemoveNCharsAfter = This.Content()[ :RemoveNCharsAfter ]
			cType = ring_type(nRemoveNCharsAfter)
		   	if cType = "NUMBER" or ( cType = "STRING" and nRemoveNCharsAfter = NULL )
				bOk2 = TRUE
			ok

			bOk3 = FALSE
			cRemoveSubStringBefore = This.Content()[ :RemoveSubStringBefore ]
			cType = ring_type(cRemoveSubStringBefore)
		   	if cType = "STRING"
				bOk3 = TRUE
			ok

			bOk4 = FALSE
			cRemoveSubStringAfter = This.Content()[ :RemoveSubStringAfter ]
			cType = ring_type(cRemoveSubStringAfter)
		   	if cType = "STRING"
				bOk4 = TRUE
			ok

			bOk5 = FALSE
			cRemoveThisBound = This.Content()[ :cRemoveThisBound ]
			cType = ring_type(cRemoveThisBound)
		   	if cType = "STRING"
				bOk5 = TRUE
			ok

			if bOk1 and bOk2 and bOk3 and bOk4 and bOk5
				bResult = TRUE
			ok
		ok

		return bResult

	def IsTextBoxedOptionsNamedParam()
		/*
		Example:

		? StzStringQ("TEXT1").BoxedXT([
			:Line = :Thin,	# or :Dashed
		
			:AllCorners = :Round # can also be :Rectangualr
			# :Corners = [ :Round, :Rectangular, :Round, :Rectangular ],
		
			:Width = 17,
			:TextAdjustedTo = :Center # or :Left or :Right or :Justified,
			
			:EachChar = FALSE # TRUE,
			:Hilighted = [ 1, 3 ] # Hilight the 1st and 3rd chars,

			:Numbered = TRUE
		])
		*/
		if This.IsEmpty()
			return TRUE
		ok

		aListOfBoxOptions = [
			:Line,
			:AllCorners,
			:Corners,
			:Width,
			:TextAdjustedTo,
			:EachChar,
			:EachWord,
			:Hilighted,
			:HilightedIf,
			:Numbered
		]

		if StzNumberQ(This.NumberOfItems()).IsBetween(1, len(aListOfBoxOptions)) and
		   This.IsHashList() and
		   StzHashListQ(This.Content()).KeysQ().IsMadeOfSome(aListOfBoxOptions)
		
			return TRUE

		else
			return FALSE
		ok

	def IsBoxOptionsNamedParam()

		if This.IsEmpty()
			return TRUE
		ok

		aListOfBoxOptions = [
			:Line,
			:AllCorners,
			:Corners,
			:Width,
			:TextAdjustedTo,
			:EachChar,

			:Casesensitive,
			:CS,

			:Numbered,
			:Spacified,

			:Shadowed,
			:ShadowChar,
			:ShadowOrientation
			
		]

		if StzNumberQ(This.NumberOfItems()).IsBetween(1, len(aListOfBoxOptions)) and
		   This.IsHashList() and
		   StzHashListQ(This.Content()).KeysQ().IsMadeOfSome(aListOfBoxOptions)
		
			return TRUE

		else
			return FALSE
		ok

	def IsConstraintsOptionsNamedParam()
		/* EXAMPLE
		[
			:OnStzString = [
				:MustBeUppercase 	= '{ Q(@str).IsUppercase() }',
				:MustNotExceed@n@Chars 	= '{ Q(@str).NumberOfChars() <= n }',
				:MustBeginWithLetter@c@	= '{ Q(@str).BeginsWithCS(c, :CS = FALSE) }'
			],
		
			:OnStzNumber = [
				:MustBeStrictlyPositive = '{ @number > 0 }'
			],
		
			:OnStzList = [
				:MustBeAHashList = '{ Q(@list).IsHashList() }'
			]
		]
		*/
		
		try
			VerifyConstraints([
				:MustBeAHashList,
				:KeysMustBeOnStzTypes,
				:ValuesMustBeRingCodeInStrings
			])

			return TRUE

		catch
			return FALSE
		done

	#--

	def IsCellNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :Cell)

			return TRUE
		else
			return FALSE
		ok

	def IsOfCellNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OfCell)

			return TRUE
		else
			return FALSE
		ok

	def IsCellsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :Cells)

			return TRUE
		else
			return FALSE
		ok

	def IsOfCellsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OfCells)

			return TRUE
		else
			return FALSE
		ok

	def IsInCellNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :InCell)

			return TRUE
		else
			return FALSE
		ok

	def IsInCellsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :InCells)

			return TRUE
		else
			return FALSE
		ok

	def IsCellValueNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :CellValue)

			return TRUE
		else
			return FALSE
		ok

	def IsOfCellValueNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OfCellValue)

			return TRUE
		else
			return FALSE
		ok

	def IsCellPartNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :CellPart)

			return TRUE
		else
			return FALSE
		ok

	def IsPartNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :Part)

			return TRUE
		else
			return FALSE
		ok

	def IsSubPartNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :SubPart)

			return TRUE
		else
			return FALSE
		ok
	#--

	def IsSubValueNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :SubValue)

			return TRUE
		else
			return FALSE
		ok

	def IsOfSubValueNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OfSubValue)

			return TRUE
		else
			return FALSE
		ok

	def IsSubValuesNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :SubValues)

			return TRUE
		else
			return FALSE
		ok

	def IsOfSubValuesNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OfSubValues)

			return TRUE
		else
			return FALSE
		ok

	#--

	def IsOfCellPartNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OfCellPart)

			return TRUE
		else
			return FALSE
		ok

	def IsOfPartNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OfPart)

			return TRUE
		else
			return FALSE
		ok

	def IsOfSubPartNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OfSubPart)

			return TRUE
		else
			return FALSE
		ok

	#--

	def IsColNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and (This[1] = :Col or This[1] = :Column) )

			return TRUE
		else
			return FALSE
		ok

		def IsColumnNamedParam()
			return This.IsColNamedParam()

	def IsOfColNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and (This[1] = :OfCol or This[1] = :OfColumn) )

			return TRUE
		else
			return FALSE
		ok

		def IsOfColumnNamedParam()
			return This.IsOfColNamedParam()

	def IsOfColOrColumnNamedParam()
		if This.IsOfColNamedParam() or This.IsOfColumnNamedParam()
			return TRUE

		else
			return FALSE
		ok

		def IsOfColumnOrColNamedParam()
			return This.IsOfColOrColumnNamedParam()

		def IsOfColOrOfColumnNamedParam()
			return This.IsOfColOrColumnNamedParam()

		def IsOfColumnOrOfColNamedParam()
			return This.IsOfColOrColumnNamedParam()

		#--

		def IsOfColOrColumnNamedParams()
			return This.IsOfColOrColumnNamedParam()

		def IsOfColumnOrColNamedParams()
			return This.IsOfColOrColumnNamedParam()

		def IsOfColOrOfColumnNamedParams()
			return This.IsOfColOrColumnNamedParam()

		def IsOfColumnOrOfColNamedParams()
			return This.IsOfColOrColumnNamedParam()


	def IsInColNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and (This[1] = :InCol or This[1] = :InColumn) )

			return TRUE
		else
			return FALSE
		ok

		def IsInColumnNamedParam()
			return This.IsInColNamedParam()

	def IsInColOrColumnNamedParam()
		if This.IsInColNamedParam() or This.IsInColumnNamedParam()
			return TRUE

		else
			return FALSE
		ok

		def IsInColumnOrColNamedParam()
			return This.IsInColOrColumnNamedParam()

		def IsInColOrInColumnNamedParam()
			return This.IsInColOrColumnNamedParam()

		def IsInColumnOrInColNamedParam()
			return This.IsInColOrColumnNamedParam()

		#--

		def IsInColOrColumnNamedParams()
			return This.IsInColOrColumnNamedParam()

		def IsInColumnOrColNamedParams()
			return This.IsInColOrColumnNamedParams()

		def IsInColOrInColumnNamedParams()
			return This.IsInColOrColumnNamedParams()

		def IsInColumnOrInColNamedParams()
			return This.IsInColOrColumnNamedParam()

	def IsColsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and (This[1] = :Cols or This[1] = :Columns) )

			return TRUE
		else
			return FALSE
		ok

		def IsColumnsNamedParam()
			return This.IsColsNamedParam()

	def IsOfColsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and (This[1] = :OfCols or This[1] = :OfColumns) )

			return TRUE
		else
			return FALSE
		ok

		def IsOfColumnsNamedParam()
			return This.IsOfColsNamedParam()

	def IsOfColsOrColumnsNamedParam()
		if This.IsOfColsNamedParam() or This.IsOfColumnsNamedParam()
			return TRUE

		else
			return FALSE
		ok

		def IsOfColumnsOrColsNamedParam()
			return This.IsOfColsOrColumnsNamedParam()

		def IsOfColsOrOfColumnsNamedParam()
			return This.IsOfColsOrColumnsNamedParam()

		def IsOfColumnsOrOfColsNamedParam()
			return This.IsOfColsOrColumnsNamedParam()

		#--

		def IsOfColsOrColumnsNamedParams()
			return This.IsOfColsOrColumnsNamedParam()

		def IsOfColumnsOrColsNamedParams()
			return This.IsOfColsOrColumnsNamedParam()

		def IsOfColsOrOfColumnsNamedParams()
			return This.IsOfColsOrColumnsNamedParam()

		def IsOfColumnsOrOfColsNamedParams()
			return This.IsOfColsOrColumnsNamedParam()


	def IsInColsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and (This[1] = :InCols or This[1] = :InColumns) )

			return TRUE
		else
			return FALSE
		ok

		def IsInColumnsNamedParam()
			return This.IsInColsNamedParam()

	def IsInColsOrColumnsNamedParam()
		if This.IsInColsNamedParam() or This.IsInColumnsNamedParam()
			return TRUE

		else
			return FALSE
		ok

		def IsInColumnsOrColNamedParam()
			return This.IsInColsOrColumnsNamedParam()

		def IsInColsOrInColumnsNamedParam()
			return This.IsInColsOrColumnsNamedParam()

		def IsInColumnsOrInColNamedParam()
			return This.IsInColsOrColumnsNamedParam()

		#--

		def IsInColsOrColumnsNamedParams()
			return This.IsInColsOrColumnsNamedParam()

		def IsInColumnsOrColNamedParams()
			return This.IsInColsOrColumnsNamedParam()

		def IsInColsOrInColumnsNamedParams()
			return This.IsInColsOrColumnsNamedParam()

		def IsInColumnsOrInColNamedParams()
			return This.IsInColsOrColumnsNamedParam()

	#--

	def IsRowNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :Row)

			return TRUE
		else
			return FALSE
		ok

	def IsOfRowNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OfRow)

			return TRUE
		else
			return FALSE
		ok

	def IsInRowNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :InRow)

			return TRUE
		else
			return FALSE
		ok

	def IsRowsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :Rows)

			return TRUE
		else
			return FALSE
		ok

	def IsOfRowsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OfRows)

			return TRUE
		else
			return FALSE
		ok

	def IsInRowsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :InRows)

			return TRUE
		else
			return FALSE
		ok

	#--

	def IsOccurrenceNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :Occurrence)

			return TRUE
		else
			return FALSE
		ok

	def IsNthNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :Nth)

			return TRUE
		else
			return FALSE
		ok

	def IsNthOccurrenceNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :NthOccurrence)

			return TRUE
		else
			return FALSE
		ok

	def IsNNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :N)

			return TRUE
		else
			return FALSE
		ok
	#--

	def IsCaseSensitiveNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and (This[1] = :Casesensitive or This[1] = :CS) ) and
		   IsBoolean(This[2])

			return TRUE
		else
			return FALSE
		ok

	def IsRangeNamedParam()

		if This.IsEmpty()
			return TRUE
		ok

		if NOT (This.IsHashList() and This.NumberOfItems() <= 2)
			return FALSE
		ok

		if This.NumberOfItems() = 1

			if This[1][1] = :Start or This[1][1] = :Range
				return TRUE
			ok
		ok

		if This.NumberOfItems() = 2

			if StzHashListQ( This.List() ).KeysQ().IsEqualTo([ :Start, :Range ]) and
			   StzHashListQ( This.List() ).ValuesQ().BothAreNumbers()

				return TRUE

			else

				return FALSE
			ok
		ok


	#--

	def IsStartingAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StartingAt )

			return TRUE

		else
			return FALSE
		ok

	def IsStartingAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StartingAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsStartingAtOccurrenceNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StartingAtOccurrence )

			return TRUE

		else
			return FALSE
		ok

	def IsStartAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StartAt )

			return TRUE

		else
			return FALSE
		ok

	def IsStartAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StartAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsStartAtOccurrenceNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StartAtOccurrence )

			return TRUE

		else
			return FALSE
		ok


	#--

	def IsStoppingAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StoppingAt )

			return TRUE

		else
			return FALSE
		ok

	def IsStoppingAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StoppingAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsStoppingAtOccurrenceNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StoppingAtOccurrence )

			return TRUE

		else
			return FALSE
		ok

	def IsStopAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StopAt )

			return TRUE

		else
			return FALSE
		ok

	def IsStopAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StopAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsStopAtOccurrenceNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StopAtOccurrence )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsInStringNNamedParam()
		if This.NumberOfItems() = 2 and
vvv
		   ( isString(This[1]) and Q(This[1]).IsOneOfThese([
					:InStringAt, :InStringItemAt,
					:inStringAtPosition, :InStringItemAtPosition,
					:InStringN, :InStringItemN ]) )

			return TRUE

		else
			return FALSE
		ok

		def IsInStringItemNNamedParam()
			return This.IsInStringNNamedParam()

		def IsInStringAtPositionNNamedParam()
			return This.IsInStringNNamedParam()

		def IsInStringAtPositionNamedParam()
			return This.IsInStringNNamedParam()

	def IsExceptNamedParam()
		# Used initially by ReplaceWordsWithMarquersExceptXT(pcByOption, paExcept)
		# TODO: generalize to all the functions we want to provide exceptions to it

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :Except )

			return TRUE

		else
			return FALSE
		ok

	def IsAsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :As )

			return TRUE

		else
			return FALSE
		ok

	def IsThenNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  (This[1] = :Then or This[1] = :Then@) )

			return TRUE

		else
			return FALSE
		ok

	def IsAndThenNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  (This[1] = :AndThen or This[1] = :AndThen@) )

			return TRUE

		else
			return FALSE
		ok

	def IsFromNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  (This[1] = :From or This[1] = :FromPosition)  )

			return TRUE

		else
			return FALSE
		ok

	def IsFromOrOfNamedParam()
		if This.IsFromNamedParam() or This.IsOfNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsFromOrOfNamedParams()
			return This.IsFromOrOfNamedParam()

		def IsOfOrFromNamedParam()
			return This.IsFromOrOfNamedParam()

		def IsOfOrFromNamedParams()
			return This.IsFromOrOfNamedParam()

	def IsValueNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Value )

			return TRUE

		else
			return FALSE
		ok

	def IsOfValueNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OfValue )

			return TRUE

		else
			return FALSE
		ok

	def IsValuesNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Values )

			return TRUE

		else
			return FALSE
		ok

	def IsStringOrSubStringNamedParam()
		if This.IsStringNamedPAram() or This.IsSubStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsStringOrSubStringNamedParams()
			return This.IsStringOrSubStringNamedParam()

		def IsSubStringOrStringONamedParam()
			return This.IsStringOrSubStringNamedParam()

		def IsSubStringOrStringONamedParams()
			return This.IsStringOrSubStringNamedParam()

	#--

	def IsToOrOfNamedParam()
		if This.IsToNamedParam() or This.IsOfNamedParam()
			return TRUE

		else
			return FALSE
		ok

		def IsToOrOfNamedParams()
			return This.IsToOrOfNamedParam()

		def IsOfOrToNamedParam()
			return This.IsToOrOfNamedParam()

		def IsOfOrToNamedParams()
			return This.IsToOrOfNamedParam()

	#==

	def IsToNumberNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToNumber )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToString )

			return TRUE

		else
			return FALSE
		ok

	def IsToSubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToSubString )

			return TRUE

		else
			return FALSE
		ok

	def IsToCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToChar )

			return TRUE

		else
			return FALSE
		ok

	def IsToListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToList )

			return TRUE

		else
			return FALSE
		ok

	def IsToPairNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToPair )

			return TRUE

		else
			return FALSE
		ok

	def IsToHashListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToHashList )

			return TRUE

		else
			return FALSE
		ok

	def IsToSetNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToSet )

			return TRUE

		else
			return FALSE
		ok

	def IsToObjectNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToObject )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsToOrToNumberNamedParam()
		if This.IsToNamedParam() or This.IsToNumberNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsToNumberOrToNamedParam()
			return This.IsToOrToNumberNamedParam()

		def IsToOrToNumberNamedParams()
			return This.IsToOrToNumberNamedParam()

		def IsToNumberOrToNamedParams()
			return This.IsToOrToNumberNamedParam()

	def IsToOrToCharNamedParam()
		if This.IsToNamedParam() or This.IsToCharNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsToCharOrToNamedParam()
			return This.IsToOrToCharNamedParam()

		def IsToOrToCharNamedParams()
			return This.IsToOrToCharNamedParam()

		def IsToCharOrToNamedParams()
			return This.IsToOrToCharNamedParam()

	def IsToOrToStringNamedParam()
		if This.IsToNamedParam() or This.IsToStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsToStringOrToNamedParam()
			return This.IsToOrToStringNamedParam()

		def IsToOrToStringNamedParams()
			return This.IsToOrToStringNamedParam()

		def IsToStringOrToNamedParams()
			return This.IsToOrToStringNamedParam()

	def IsToOrToSubStringNamedParam()
		if This.IsToNamedParam() or This.IsToSubStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsToSubStringOrToNamedParam()
			return This.IsToOrToSubStringNamedParam()

		def IsToOrToSubStringNamedParams()
			return This.IsToOrToSubStringNamedParam()

		def IsToSubStringOrToNamedParams()
			return This.IsToOrToSubStringNamedParam()

	def IsToOrToListNamedParam()
		if This.IsToNamedParam() or This.IsToListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsToListOrToNamedParam()
			return This.IsToOrToListNamedParam()

		def IsToOrToListNamedParams()
			return This.IsToOrToListNamedParam()

		def IsToListOrToNamedParams()
			return This.IsToOrToListNamedParam()

	def IsToOrToHashListNamedParam()
		if This.IsToNamedParam() or This.IsToHashListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsToHashListOrToNamedParam()
			return This.IsToOrToHashListNamedParam()

		def IsToOrToHashListNamedParams()
			return This.IsToOrToHashListNamedParam()

		def IsToHashListOrToNamedParams()
			return This.IsToOrToHashListNamedParam()

	def IsToOrToPairNamedParam()
		if This.IsToNamedParam() or This.IsToPairNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsToPairOrToNamedParam()
			return This.IsToOrToPairNamedParam()

		def IsToOrToPairNamedParams()
			return This.IsToOrToPairNamedParam()

		def IsToPairOrToNamedParams()
			return This.IsToOrToPairNamedParam()

	def IsToOrToSetNamedParam()
		if This.IsToNamedParam() or This.IsToSetNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsToSetOrToNamedParam()
			return This.IsToOrToSetNamedParam()

		def IsToOrToSetNamedParams()
			return This.IsToOrToSetNamedParam()

		def IsToSetOrToNamedParams()
			return This.IsToOrToSetNamedParam()

	def IsToOrToObjectNamedParam()
		if This.IsToNamedParam() or This.IsToObjectNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsToStringOrToObjectParam()
			return This.IsToOrToStringNamedParam()

		def IsToOrToObjectNamedParams()
			return This.IsToOrToObjectNamedParam()

		def IsToStringOrToObjectParams()
			return This.IsToOrToStringNamedParam()

	#==

	def IsOfNumberNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OfNumber )

			return TRUE

		else
			return FALSE
		ok

	def IsOfStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OfString )

			return TRUE

		else
			return FALSE
		ok

	def IsOfSubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OfSubString )

			return TRUE

		else
			return FALSE
		ok

	def IsOfCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OfChar )

			return TRUE

		else
			return FALSE
		ok

	def IsOfListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OfList )

			return TRUE

		else
			return FALSE
		ok

	def IsOfPairNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OfPair )

			return TRUE

		else
			return FALSE
		ok

	def IsOfHashListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OfHashList )

			return TRUE

		else
			return FALSE
		ok

	def IsOfSetNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OfSet )

			return TRUE

		else
			return FALSE
		ok

	def IsOfObjectNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OfObject )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsOfOrOfNumberNamedParam()
		if This.IsOfNamedParam() or This.IsOfNumberNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOfNumberOrOfNamedParam()
			return This.IsOfOrOfNumberNamedParam()

		def IsOfOrOfNumberNamedParams()
			return This.IsOfOrOfNumberNamedParam()

		def IsOfNumberOrOfNamedParams()
			return This.IsOfOrOfNumberNamedParam()

	def IsOfOrOfCharNamedParam()
		if This.IsOfNamedParam() or This.IsOfCharNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOfCharOrOfNamedParam()
			return This.IsOfOrOfCharNamedParam()

		def IsOfOrOfCharNamedParams()
			return This.IsOfOrOfCharNamedParam()

		def IsOfCharOrOfNamedParams()
			return This.IsOfOrOfCharNamedParam()

	def IsOfOrOfStringNamedParam()
		if This.IsOfNamedParam() or This.IsOfStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOfStringOrOfNamedParam()
			return This.IsOfOrOfStringNamedParam()

		def IsOfOrOfStringNamedParams()
			return This.IsOfOrOfStringNamedParam()

		def IsOfStringOrOfNamedParams()
			return This.IsOfOrOfStringNamedParam()

	def IsOfOrOfSubStringNamedParam()
		if This.IsOfNamedParam() or This.IsOfSubStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOfSubStringOrOfNamedParam()
			return This.IsOfOrOfSubStringNamedParam()

		def IsOfOrOfSubStringNamedParams()
			return This.IsOfOrOfSubStringNamedParam()

		def IsOfSubStringOrOfNamedParams()
			return This.IsOfOrOfSubStringNamedParam()

	def IsOfOrOfListNamedParam()
		if This.IsOfNamedParam() or This.IsOfListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOfListOrOfNamedParam()
			return This.IsOfOrOfListNamedParam()

		def IsOfOrOfListNamedParams()
			return This.IsOfOrOfListNamedParam()

		def IsOfListOrOfNamedParams()
			return This.IsOfOrOfListNamedParam()

	def IsOfOrOfHashListNamedParam()
		if This.IsOfNamedParam() or This.IsOfHashListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOfHashListOrOfNamedParam()
			return This.IsOfOrOfHashListNamedParam()

		def IsOfOrOfHashListNamedParams()
			return This.IsOfOrOfHashListNamedParam()

		def IsOfHashListOrOfNamedParams()
			return This.IsOfOrOfHashListNamedParam()

	def IsOfOrOfPairNamedParam()
		if This.IsOfNamedParam() or This.IsOfPairNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOfPairOrOfNamedParam()
			return This.IsOfOrOfPairNamedParam()

		def IsOfOrOfPairNamedParams()
			return This.IsOfOrOfPairNamedParam()

		def IsOfPairOrOfNamedParams()
			return This.IsOfOrOfPairNamedParam()

	def IsOfOrOfSetNamedParam()
		if This.IsOfNamedParam() or This.IsOfSetNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOfSetOrOfNamedParam()
			return This.IsOfOrOfSetNamedParam()

		def IsOfOrOfSetNamedParams()
			return This.IsOfOrOfSetNamedParam()

		def IsOfSetOrOfNamedParams()
			return This.IsOfOrOfSetNamedParam()

	def IsOfOrOfObjectNamedParam()
		if This.IsOfNamedParam() or This.IsOfObjectNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOfStringOrOfObjectParam()
			return This.IsOfOrOfStringNamedParam()

		def IsOfOrOfObjectNamedParams()
			return This.IsOfOrOfObjectNamedParam()

		def IsOfStringOrOfObjectParams()
			return This.IsOfOrOfStringNamedParam()

	#==

	def IsByNumberNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ByNumber )

			return TRUE

		else
			return FALSE
		ok

	def IsByStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ByString )

			return TRUE

		else
			return FALSE
		ok

	def IsBySubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BySubString )

			return TRUE

		else
			return FALSE
		ok

	def IsByCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ByChar )

			return TRUE

		else
			return FALSE
		ok

	def IsByListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ByList )

			return TRUE

		else
			return FALSE
		ok

	def IsByPairNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ByPair )

			return TRUE

		else
			return FALSE
		ok

	def IsByHashListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ByHashList )

			return TRUE

		else
			return FALSE
		ok

	def IsBySetNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BySet )

			return TRUE

		else
			return FALSE
		ok

	def IsByObjectNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ByObject )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsByOrByNumberNamedParam()
		if This.IsByNamedParam() or This.IsByNumberNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsByNumberOrByNamedParam()
			return This.IsByOrByNumberNamedParam()

		def IsByOrByNumberNamedParams()
			return This.IsByOrByNumberNamedParam()

		def IsByNumberOrByNamedParams()
			return This.IsByOrByNumberNamedParam()

	def IsByOrByCharNamedParam()
		if This.IsByNamedParam() or This.IsByCharNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsByCharOrByNamedParam()
			return This.IsByOrByCharNamedParam()

		def IsByOrByCharNamedParams()
			return This.IsByOrByCharNamedParam()

		def IsByCharOrByNamedParams()
			return This.IsByOrByCharNamedParam()

	def IsByOrByStringNamedParam()
		if This.IsByNamedParam() or This.IsByStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsByStringOrByNamedParam()
			return This.IsByOrByStringNamedParam()

		def IsByOrByStringNamedParams()
			return This.IsByOrByStringNamedParam()

		def IsByStringOrByNamedParams()
			return This.IsByOrByStringNamedParam()

	def IsByOrBySubStringNamedParam()
		if This.IsByNamedParam() or This.IsBySubStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsBySubStringOrByNamedParam()
			return This.IsByOrBySubStringNamedParam()

		def IsByOrBySubStringNamedParams()
			return This.IsByOrBySubStringNamedParam()

		def IsBySubStringOrByNamedParams()
			return This.IsByOrBySubStringNamedParam()

	def IsByOrByListNamedParam()
		if This.IsByNamedParam() or This.IsByListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsByListOrByNamedParam()
			return This.IsByOrByListNamedParam()

		def IsByOrByListNamedParams()
			return This.IsByOrByListNamedParam()

		def IsByListOrByNamedParams()
			return This.IsByOrByListNamedParam()

	def IsByOrByHashListNamedParam()
		if This.IsByNamedParam() or This.IsByHashListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsByHashListOrByNamedParam()
			return This.IsByOrByHashListNamedParam()

		def IsByOrByHashListNamedParams()
			return This.IsByOrByHashListNamedParam()

		def IsByHashListOrByNamedParams()
			return This.IsByOrByHashListNamedParam()

	def IsByOrByPairNamedParam()
		if This.IsByNamedParam() or This.IsByPairNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsByPairOrByNamedParam()
			return This.IsByOrByPairNamedParam()

		def IsByOrByPairNamedParams()
			return This.IsByOrByPairNamedParam()

		def IsByPairOrByNamedParams()
			return This.IsByOrByPairNamedParam()

	def IsByOrBySetNamedParam()
		if This.IsByNamedParam() or This.IsBySetNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsBySetOrByNamedParam()
			return This.IsByOrBySetNamedParam()

		def IsByOrBySetNamedParams()
			return This.IsByOrBySetNamedParam()

		def IsBySetOrByNamedParams()
			return This.IsByOrBySetNamedParam()

	def IsByOrByObjectNamedParam()
		if This.IsByNamedParam() or This.IsByObjectNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsByStringOrByObjectParam()
			return This.IsByOrByStringNamedParam()

		def IsByOrByObjectNamedParams()
			return This.IsByOrByObjectNamedParam()

		def IsByStringOrByObjectParams()
			return This.IsByOrByStringNamedParam()

	#==

	def IsInNumberNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InNumber )

			return TRUE

		else
			return FALSE
		ok

	def IsInStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InString )

			return TRUE

		else
			return FALSE
		ok

	def IsInSubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InSubString )

			return TRUE

		else
			return FALSE
		ok

	def IsInCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InChar )

			return TRUE

		else
			return FALSE
		ok

	def IsInListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InList )

			return TRUE

		else
			return FALSE
		ok

	def IsInPairNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InPair )

			return TRUE

		else
			return FALSE
		ok

	def IsInHashListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InHashList )

			return TRUE

		else
			return FALSE
		ok

	def IsInSetNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InSet )

			return TRUE

		else
			return FALSE
		ok

	def IsInObjectNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InObject )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsInOrInNumberNamedParam()
		if This.IsInNamedParam() or This.IsInNumberNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInNumberOrInNamedParam()
			return This.IsInOrInNumberNamedParam()

		def IsInOrInNumberNamedParams()
			return This.IsInOrInNumberNamedParam()

		def IsInNumberOrInNamedParams()
			return This.IsInOrInNumberNamedParam()

	def IsInOrInCharNamedParam()
		if This.IsInNamedParam() or This.IsInCharNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInCharOrInNamedParam()
			return This.IsInOrInCharNamedParam()

		def IsInOrInCharNamedParams()
			return This.IsInOrInCharNamedParam()

		def IsInCharOrInNamedParams()
			return This.IsInOrInCharNamedParam()

	def IsInOrInStringNamedParam()
		if This.IsInNamedParam() or This.IsInStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInStringOrInNamedParam()
			return This.IsInOrInStringNamedParam()

		def IsInOrInStringNamedParams()
			return This.IsInOrInStringNamedParam()

		def IsInStringOrInNamedParams()
			return This.IsInOrInStringNamedParam()

	def IsInOrInSubStringNamedParam()
		if This.IsInNamedParam() or This.IsInSubStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInSubStringOrInNamedParam()
			return This.IsInOrInSubStringNamedParam()

		def IsInOrInSubStringNamedParams()
			return This.IsInOrInSubStringNamedParam()

		def IsInSubStringOrInNamedParams()
			return This.IsInOrInSubStringNamedParam()

	def IsInOrInListNamedParam()
		if This.IsInNamedParam() or This.IsInListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInListOrInNamedParam()
			return This.IsInOrInListNamedParam()

		def IsInOrInListNamedParams()
			return This.IsInOrInListNamedParam()

		def IsInListOrInNamedParams()
			return This.IsInOrInListNamedParam()

	def IsInOrInHashListNamedParam()
		if This.IsInNamedParam() or This.IsInHashListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInHashListOrInNamedParam()
			return This.IsInOrInHashListNamedParam()

		def IsInOrInHashListNamedParams()
			return This.IsInOrInHashListNamedParam()

		def IsInHashListOrInNamedParams()
			return This.IsInOrInHashListNamedParam()

	def IsInOrInPairNamedParam()
		if This.IsInNamedParam() or This.IsInPairNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInPairOrInNamedParam()
			return This.IsInOrInPairNamedParam()

		def IsInOrInPairNamedParams()
			return This.IsInOrInPairNamedParam()

		def IsInPairOrInNamedParams()
			return This.IsInOrInPairNamedParam()

	def IsInOrInSetNamedParam()
		if This.IsInNamedParam() or This.IsInSetNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInSetOrInNamedParam()
			return This.IsInOrInSetNamedParam()

		def IsInOrInSetNamedParams()
			return This.IsInOrInSetNamedParam()

		def IsInSetOrInNamedParams()
			return This.IsInOrInSetNamedParam()

	def IsInOrInObjectNamedParam()
		if This.IsInNamedParam() or This.IsInObjectNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInObjectOrInNamedParam()
			return This.IsInOrInStringNamedParam()

		def IsInOrInObjectNamedParams()
			return This.IsInOrInObjectNamedParam()

		def IsInObjectOrInNamedParams()
			return This.IsInOrInObjectNamedParam()

	#==

	def IsWithNumberNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :WithNumber )

			return TRUE

		else
			return FALSE
		ok

	def IsWithStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :WithString )

			return TRUE

		else
			return FALSE
		ok

	def IsWithSubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :WithSubString )

			return TRUE

		else
			return FALSE
		ok

	def IsWithCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :WithChar )

			return TRUE

		else
			return FALSE
		ok

	def IsWithListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :WithList )

			return TRUE

		else
			return FALSE
		ok

	def IsWithPairNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :WithPair )

			return TRUE

		else
			return FALSE
		ok

	def IsWithHashListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :WithHashList )

			return TRUE

		else
			return FALSE
		ok

	def IsWithSetNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :WithSet )

			return TRUE

		else
			return FALSE
		ok

	def IsWithObjectNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :WithObject )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsWithOrWithNumberNamedParam()
		if This.IsWithNamedParam() or This.IsWithNumberNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsWithNumberOrWithNamedParam()
			return This.IsWithOrWithNumberNamedParam()

		def IsWithOrWithNumberNamedParams()
			return This.IsWithOrWithNumberNamedParam()

		def IsWithNumberOrWithNamedParams()
			return This.IsWithOrWithNumberNamedParam()

	def IsWithOrWithCharNamedParam()
		if This.IsWithNamedParam() or This.IsWithCharNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsWithCharOrWithNamedParam()
			return This.IsWithOrWithCharNamedParam()

		def IsWithOrWithCharNamedParams()
			return This.IsWithOrWithCharNamedParam()

		def IsWithCharOrWithNamedParams()
			return This.IsWithOrWithCharNamedParam()

	def IsWithOrWithStringNamedParam()
		if This.IsWithNamedParam() or This.IsWithStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsWithStringOrWithNamedParam()
			return This.IsWithOrWithStringNamedParam()

		def IsWithOrWithStringNamedParams()
			return This.IsWithOrWithStringNamedParam()

		def IsWithStringOrWithNamedParams()
			return This.IsWithOrWithStringNamedParam()

	def IsWithOrWithSubStringNamedParam()
		if This.IsWithNamedParam() or This.IsWithSubStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsWithSubStringOrWithNamedParam()
			return This.IsWithOrWithSubStringNamedParam()

		def IsWithOrWithSubStringNamedParams()
			return This.IsWithOrWithSubStringNamedParam()

		def IsWithSubStringOrWithNamedParams()
			return This.IsWithOrWithSubStringNamedParam()

	def IsWithOrWithListNamedParam()
		if This.IsWithNamedParam() or This.IsWithListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsWithListOrWithNamedParam()
			return This.IsWithOrWithListNamedParam()

		def IsWithOrWithListNamedParams()
			return This.IsWithOrWithListNamedParam()

		def IsWithListOrWithNamedParams()
			return This.IsWithOrWithListNamedParam()

	def IsWithOrWithHashListNamedParam()
		if This.IsWithNamedParam() or This.IsWithHashListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsWithHashListOrWithNamedParam()
			return This.IsWithOrWithHashListNamedParam()

		def IsWithOrWithHashListNamedParams()
			return This.IsWithOrWithHashListNamedParam()

		def IsWithHashListOrWithNamedParams()
			return This.IsWithOrWithHashListNamedParam()

	def IsWithOrWithPairNamedParam()
		if This.IsWithNamedParam() or This.IsWithPairNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsWithPairOrWithNamedParam()
			return This.IsWithOrWithPairNamedParam()

		def IsWithOrWithPairNamedParams()
			return This.IsWithOrWithPairNamedParam()

		def IsWithPairOrWithNamedParams()
			return This.IsWithOrWithPairNamedParam()

	def IsWithOrWithSetNamedParam()
		if This.IsWithNamedParam() or This.IsWithSetNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsWithSetOrWithNamedParam()
			return This.IsWithOrWithSetNamedParam()

		def IsWithOrWithSetNamedParams()
			return This.IsWithOrWithSetNamedParam()

		def IsWithSetOrWithNamedParams()
			return This.IsWithOrWithSetNamedParam()

	def IsWithOrWithObjectNamedParam()
		if This.IsWithNamedParam() or This.IsWithObjectNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsWithObjectOrWithNamedParam()
			return This.IsWithOrWithObjectNamedParam()

		def IsWithOrWithObjectNamedParams()
			return This.IsWithOrWithObjectNamedParam()

		def IsWithObjectOrWithNamedParams()
			return This.IsWithOrWithObjectNamedParam()

	#==

	def IsInsideNumberNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InsideNumber )

			return TRUE

		else
			return FALSE
		ok

	def IsInsideStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InsideString )

			return TRUE

		else
			return FALSE
		ok

	def IsInsideSubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InsideSubString )

			return TRUE

		else
			return FALSE
		ok

	def IsInsideCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InsideChar )

			return TRUE

		else
			return FALSE
		ok

	def IsInsideListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InsideList )

			return TRUE

		else
			return FALSE
		ok

	def IsInsidePairNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InsidePair )

			return TRUE

		else
			return FALSE
		ok

	def IsInsideHashListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InsideHashList )

			return TRUE

		else
			return FALSE
		ok

	def IsInsideSetNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InsideSet )

			return TRUE

		else
			return FALSE
		ok

	def IsInsideObjectNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InsideObject )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsInsideOrInsideNumberNamedParam()
		if This.IsInsideNamedParam() or This.IsInsideNumberNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInsideNumberOrInsideNamedParam()
			return This.IsInsideOrInsideNumberNamedParam()

		def IsInsideOrInsideNumberNamedParams()
			return This.IsInsideOrInsideNumberNamedParam()

		def IsInsideNumberOrInsideNamedParams()
			return This.IsInsideOrInsideNumberNamedParam()

	def IsInsideOrInsideCharNamedParam()
		if This.IsInsideNamedParam() or This.IsInsideCharNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInsideCharOrInsideNamedParam()
			return This.IsInsideOrInsideCharNamedParam()

		def IsInsideOrInsideCharNamedParams()
			return This.IsInsideOrInsideCharNamedParam()

		def IsInsideCharOrInsideNamedParams()
			return This.IsInsideOrInsideCharNamedParam()

	def IsInsideOrInsideStringNamedParam()
		if This.IsInsideNamedParam() or This.IsInsideStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInsideStringOrInsideNamedParam()
			return This.IsInsideOrInsideStringNamedParam()

		def IsInsideOrInsideStringNamedParams()
			return This.IsInsideOrInsideStringNamedParam()

		def IsInsideStringOrInsideNamedParams()
			return This.IsInsideOrInsideStringNamedParam()

	def IsInsideOrInsideSubStringNamedParam()
		if This.IsInsideNamedParam() or This.IsInsideSubStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInsideSubStringOrInsideNamedParam()
			return This.IsInsideOrInsideSubStringNamedParam()

		def IsInsideOrInsideSubStringNamedParams()
			return This.IsInsideOrInsideSubStringNamedParam()

		def IsInsideSubStringOrInsideNamedParams()
			return This.IsInsideOrInsideSubStringNamedParam()

	def IsInsideOrInsideListNamedParam()
		if This.IsInsideNamedParam() or This.IsInsideListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInsideListOrInsideNamedParam()
			return This.IsInsideOrInsideListNamedParam()

		def IsInsideOrInsideListNamedParams()
			return This.IsInsideOrInsideListNamedParam()

		def IsInsideListOrInsideNamedParams()
			return This.IsInsideOrInsideListNamedParam()

	def IsInsideOrInsideHashListNamedParam()
		if This.IsInsideNamedParam() or This.IsInsideHashListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInsideHashListOrInsideNamedParam()
			return This.IsInsideOrInsideHashListNamedParam()

		def IsInsideOrInsideHashListNamedParams()
			return This.IsInsideOrInsideHashListNamedParam()

		def IsInsideHashListOrInsideNamedParams()
			return This.IsInsideOrInsideHashListNamedParam()

	def IsInsideOrInsidePairNamedParam()
		if This.IsInsideNamedParam() or This.IsInsidePairNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInsidePairOrInsideNamedParam()
			return This.IsInsideOrInsidePairNamedParam()

		def IsInsideOrInsidePairNamedParams()
			return This.IsInsideOrInsidePairNamedParam()

		def IsInsidePairOrInsideNamedParams()
			return This.IsInsideOrInsidePairNamedParam()

	def IsInsideOrInsideSetNamedParam()
		if This.IsInsideNamedParam() or This.IsInsideSetNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInsideSetOrInsideNamedParam()
			return This.IsInsideOrInsideSetNamedParam()

		def IsInsideOrInsideSetNamedParams()
			return This.IsInsideOrInsideSetNamedParam()

		def IsInsideSetOrInsideNamedParams()
			return This.IsInsideOrInsideSetNamedParam()

	def IsInsideOrInsideObjectNamedParam()
		if This.IsInsideNamedParam() or This.IsInsideObjectNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsInsideObjectOrInsideNamedParam()
			return This.IsInsideOrInsideObjectNamedParam()

		def IsInsideOrInsideObjectNamedParams()
			return This.IsInsideOrInsideObjectNamedParam()

		def IsInsideObjectOrInsideNamedParams()
			return This.IsInsideOrInsideObjectNamedParam()

	#==

	def IsOnNumberNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OnNumber )

			return TRUE

		else
			return FALSE
		ok

	def IsOnStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OnString )

			return TRUE

		else
			return FALSE
		ok

	def IsOnSubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OnSubString )

			return TRUE

		else
			return FALSE
		ok

	def IsOnCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OnChar )

			return TRUE

		else
			return FALSE
		ok

	def IsOnListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OnList )

			return TRUE

		else
			return FALSE
		ok

	def IsOnPairNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OnPair )

			return TRUE

		else
			return FALSE
		ok

	def IsOnHashListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OnHashList )

			return TRUE

		else
			return FALSE
		ok

	def IsOnSetNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OnSet )

			return TRUE

		else
			return FALSE
		ok

	def IsOnObjectNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OnObject )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsOnOrOnNumberNamedParam()
		if This.IsOnNamedParam() or This.IsOnNumberNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOnNumberOrOnNamedParam()
			return This.IsOnOrOnNumberNamedParam()

		def IsOnOrOnNumberNamedParams()
			return This.IsOnOrOnNumberNamedParam()

		def IsOnNumberOrOnNamedParams()
			return This.IsOnOrOnNumberNamedParam()

	def IsOnOrOnCharNamedParam()
		if This.IsOnNamedParam() or This.IsOnCharNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOnCharOrOnNamedParam()
			return This.IsOnOrOnCharNamedParam()

		def IsOnOrOnCharNamedParams()
			return This.IsOnOrOnCharNamedParam()

		def IsOnCharOrOnNamedParams()
			return This.IsOnOrOnCharNamedParam()

	def IsOnOrOnStringNamedParam()
		if This.IsOnNamedParam() or This.IsOnStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOnStringOrOnNamedParam()
			return This.IsOnOrOnStringNamedParam()

		def IsOnOrOnStringNamedParams()
			return This.IsOnOrOnStringNamedParam()

		def IsOnStringOrOnNamedParams()
			return This.IsOnOrOnStringNamedParam()

	def IsOnOrOnSubStringNamedParam()
		if This.IsOnNamedParam() or This.IsOnSubStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOnSubStringOrOnNamedParam()
			return This.IsOnOrOnSubStringNamedParam()

		def IsOnOrOnSubStringNamedParams()
			return This.IsOnOrOnSubStringNamedParam()

		def IsOnSubStringOrOnNamedParams()
			return This.IsOnOrOnSubStringNamedParam()

	def IsOnOrOnListNamedParam()
		if This.IsOnNamedParam() or This.IsOnListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOnListOrOnNamedParam()
			return This.IsOnOrOnListNamedParam()

		def IsOnOrOnListNamedParams()
			return This.IsOnOrOnListNamedParam()

		def IsOnListOrOnNamedParams()
			return This.IsOnOrOnListNamedParam()

	def IsOnOrOnHashListNamedParam()
		if This.IsOnNamedParam() or This.IsOnHashListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOnHashListOrOnNamedParam()
			return This.IsOnOrOnHashListNamedParam()

		def IsOnOrOnHashListNamedParams()
			return This.IsOnOrOnHashListNamedParam()

		def IsOnHashListOrOnNamedParams()
			return This.IsOnOrOnHashListNamedParam()

	def IsOnOrOnPairNamedParam()
		if This.IsOnNamedParam() or This.IsOnPairNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOnPairOrOnNamedParam()
			return This.IsOnOrOnPairNamedParam()

		def IsOnOrOnPairNamedParams()
			return This.IsOnOrOnPairNamedParam()

		def IsOnPairOrOnNamedParams()
			return This.IsOnOrOnPairNamedParam()

	def IsOnOrOnSetNamedParam()
		if This.IsOnNamedParam() or This.IsOnSetNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOnSetOrOnNamedParam()
			return This.IsOnOrOnSetNamedParam()

		def IsOnOrOnSetNamedParams()
			return This.IsOnOrOnSetNamedParam()

		def IsOnSetOrOnNamedParams()
			return This.IsOnOrOnSetNamedParam()

	def IsOnOrOnObjectNamedParam()
		if This.IsOnNamedParam() or This.IsOnObjectNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOnObjectOrOnNamedParam()
			return This.IsOnOrOnObjectNamedParam()

		def IsOnOrOnObjectNamedParams()
			return This.IsOnOrOnObjectNamedParam()

		def IsOnObjectOrOnNamedParams()
			return This.IsOnOrOnObjectNamedParam()

	#==

	def IsOverNumberNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverNumber )

			return TRUE

		else
			return FALSE
		ok

	def IsOverStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverString )

			return TRUE

		else
			return FALSE
		ok

	def IsOverSubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverSubString )

			return TRUE

		else
			return FALSE
		ok

	def IsOverCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverChar )

			return TRUE

		else
			return FALSE
		ok

	def IsOverListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverList )

			return TRUE

		else
			return FALSE
		ok

	def IsOverPairNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverPair )

			return TRUE

		else
			return FALSE
		ok

	def IsOverHashListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverHashList )

			return TRUE

		else
			return FALSE
		ok

	def IsOverSetNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverSet )

			return TRUE

		else
			return FALSE
		ok

	def IsOverObjectNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverObject )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsOverOrOverNumberNamedParam()
		if This.IsOverNamedParam() or This.IsOverNumberNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOverNumberOrOverNamedParam()
			return This.IsOverOrOverNumberNamedParam()

		def IsOverOrOverNumberNamedParams()
			return This.IsOverOrOverNumberNamedParam()

		def IsOverNumberOrOverNamedParams()
			return This.IsOverOrOverNumberNamedParam()

	def IsOverOrOverCharNamedParam()
		if This.IsOverNamedParam() or This.IsOverCharNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOverCharOrOverNamedParam()
			return This.IsOverOrOverCharNamedParam()

		def IsOverOrOverCharNamedParams()
			return This.IsOverOrOverCharNamedParam()

		def IsOverCharOrOverNamedParams()
			return This.IsOverOrOverCharNamedParam()

	def IsOverOrOverStringNamedParam()
		if This.IsOverNamedParam() or This.IsOverStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOverStringOrOverNamedParam()
			return This.IsOverOrOverStringNamedParam()

		def IsOverOrOverStringNamedParams()
			return This.IsOverOrOverStringNamedParam()

		def IsOverStringOrOverNamedParams()
			return This.IsOverOrOverStringNamedParam()

	def IsOverOrOverSubStringNamedParam()
		if This.IsOverNamedParam() or This.IsOverSubStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOverSubStringOrOverNamedParam()
			return This.IsOverOrOverSubStringNamedParam()

		def IsOverOrOverSubStringNamedParams()
			return This.IsOverOrOverSubStringNamedParam()

		def IsOverSubStringOrOverNamedParams()
			return This.IsOverOrOverSubStringNamedParam()

	def IsOverOrOverListNamedParam()
		if This.IsOverNamedParam() or This.IsOverListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOverListOrOverNamedParam()
			return This.IsOverOrOverListNamedParam()

		def IsOverOrOverListNamedParams()
			return This.IsOverOrOverListNamedParam()

		def IsOverListOrOverNamedParams()
			return This.IsOverOrOverListNamedParam()

	def IsOverOrOverHashListNamedParam()
		if This.IsOverNamedParam() or This.IsOverHashListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOverHashListOrOverNamedParam()
			return This.IsOverOrOverHashListNamedParam()

		def IsOverOrOverHashListNamedParams()
			return This.IsOverOrOverHashListNamedParam()

		def IsOverHashListOrOverNamedParams()
			return This.IsOverOrOverHashListNamedParam()

	def IsOverOrOverPairNamedParam()
		if This.IsOverNamedParam() or This.IsOverPairNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOverPairOrOverNamedParam()
			return This.IsOverOrOverPairNamedParam()

		def IsOverOrOverPairNamedParams()
			return This.IsOverOrOverPairNamedParam()

		def IsOverPairOrOverNamedParams()
			return This.IsOverOrOverPairNamedParam()

	def IsOverOrOverSetNamedParam()
		if This.IsOverNamedParam() or This.IsOverSetNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOverSetOrOverNamedParam()
			return This.IsOverOrOverSetNamedParam()

		def IsOverOrOverSetNamedParams()
			return This.IsOverOrOverSetNamedParam()

		def IsOverSetOrOverNamedParams()
			return This.IsOverOrOverSetNamedParam()

	def IsOverOrOverObjectNamedParam()
		if This.IsOverNamedParam() or This.IsOverObjectNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsOverObjectOrOverNamedParam()
			return This.IsOverOrOverObjectNamedParam()

		def IsOverOrOverObjectNamedParams()
			return This.IsOverOrOverObjectNamedParam()

		def IsOverObjectOrOverNamedParams()
			return This.IsOverOrOverObjectNamedParam()

	#==

	def IsAgainstNumberNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverNumber )

			return TRUE

		else
			return FALSE
		ok

	def IsAgainstStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverString )

			return TRUE

		else
			return FALSE
		ok

	def IsAgainstSubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverSubString )

			return TRUE

		else
			return FALSE
		ok

	def IsAgainstCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverChar )

			return TRUE

		else
			return FALSE
		ok

	def IsAgainstListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverList )

			return TRUE

		else
			return FALSE
		ok

	def IsAgainstPairNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverPair )

			return TRUE

		else
			return FALSE
		ok

	def IsAgainstHashListNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverHashList )

			return TRUE

		else
			return FALSE
		ok

	def IsAgainstSetNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverSet )

			return TRUE

		else
			return FALSE
		ok

	def IsAgainstObjectNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OverObject )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAgainstOrAgainstNumberNamedParam()
		if This.IsAgainstNamedParam() or This.IsAgainstNumberNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsAgainstNumberOrAgainstNamedParam()
			return This.IsAgainstOrAgainstNumberNamedParam()

		def IsAgainstOrAgainstNumberNamedParams()
			return This.IsAgainstOrAgainstNumberNamedParam()

		def IsAgainstNumberOrAgainstNamedParams()
			return This.IsAgainstOrAgainstNumberNamedParam()

	def IsAgainstOrAgainstCharNamedParam()
		if This.IsAgainstNamedParam() or This.IsAgainstCharNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsAgainstCharOrAgainstNamedParam()
			return This.IsAgainstOrAgainstCharNamedParam()

		def IsAgainstOrAgainstCharNamedParams()
			return This.IsAgainstOrAgainstCharNamedParam()

		def IsAgainstCharOrAgainstNamedParams()
			return This.IsAgainstOrAgainstCharNamedParam()

	def IsAgainstOrAgainstStringNamedParam()
		if This.IsAgainstNamedParam() or This.IsAgainstStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsAgainstStringOrAgainstNamedParam()
			return This.IsAgainstOrAgainstStringNamedParam()

		def IsAgainstOrAgainstStringNamedParams()
			return This.IsAgainstOrAgainstStringNamedParam()

		def IsAgainstStringOrAgainstNamedParams()
			return This.IsAgainstOrAgainstStringNamedParam()

	def IsAgainstOrAgainstSubStringNamedParam()
		if This.IsAgainstNamedParam() or This.IsAgainstSubStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsAgainstSubStringOrAgainstNamedParam()
			return This.IsAgainstOrAgainstSubStringNamedParam()

		def IsAgainstOrAgainstSubStringNamedParams()
			return This.IsAgainstOrAgainstSubStringNamedParam()

		def IsAgainstSubStringOrAgainstNamedParams()
			return This.IsAgainstOrAgainstSubStringNamedParam()

	def IsAgainstOrAgainstListNamedParam()
		if This.IsAgainstNamedParam() or This.IsAgainstListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsAgainstListOrAgainstNamedParam()
			return This.IsAgainstOrAgainstListNamedParam()

		def IsAgainstOrAgainstListNamedParams()
			return This.IsAgainstOrAgainstListNamedParam()

		def IsAgainstListOrAgainstNamedParams()
			return This.IsAgainstOrAgainstListNamedParam()

	def IsAgainstOrAgainstHashListNamedParam()
		if This.IsAgainstNamedParam() or This.IsAgainstHashListNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsAgainstHashListOrAgainstNamedParam()
			return This.IsAgainstOrAgainstHashListNamedParam()

		def IsAgainstOrAgainstHashListNamedParams()
			return This.IsAgainstOrAgainstHashListNamedParam()

		def IsAgainstHashListOrAgainstNamedParams()
			return This.IsAgainstOrAgainstHashListNamedParam()

	def IsAgainstOrAgainstPairNamedParam()
		if This.IsAgainstNamedParam() or This.IsAgainstPairNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsAgainstPairOrAgainstNamedParam()
			return This.IsAgainstOrAgainstPairNamedParam()

		def IsAgainstOrAgainstPairNamedParams()
			return This.IsAgainstOrAgainstPairNamedParam()

		def IsAgainstPairOrAgainstNamedParams()
			return This.IsAgainstOrAgainstPairNamedParam()

	def IsAgainstOrAgainstSetNamedParam()
		if This.IsAgainstNamedParam() or This.IsAgainstSetNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsAgainstSetOrAgainstNamedParam()
			return This.IsAgainstOrAgainstSetNamedParam()

		def IsAgainstOrAgainstSetNamedParams()
			return This.IsAgainstOrAgainstSetNamedParam()

		def IsAgainstSetOrAgainstNamedParams()
			return This.IsAgainstOrAgainstSetNamedParam()

	def IsAgainstOrAgainstObjectNamedParam()
		if This.IsAgainstNamedParam() or This.IsAgainstObjectNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsAgainstObjectOrAgainstNamedParam()
			return This.IsAgainstOrAgainstObjectNamedParam()

		def IsAgainstOrAgainstObjectNamedParams()
			return This.IsAgainstOrAgainstObjectNamedParam()

		def IsAgainstObjectOrAgainstNamedParams()
			return This.IsAgainstOrAgainstObjectNamedParam()

	#==

	def IsToNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :To )

			return TRUE

		else
			return FALSE
		ok

	def IsToPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsToOrToPositionNamedParam()

		if This.IsToNamedParam() or This.IsToPositionNamedParam()
			return TRUE

		else
			return FALSE
		ok

		#< @FunctionAlternativeForms

		def IsToOrToPositionNamedParams()
			return This.IsToOrToPositionNamedParam()

		def IsToPositionOrToNamedParam()
			return This.IsToOrToPositionNamedParam()

		def IsToPositionOrToNamedParams()
			return This.IsToOrToPositionNamedParam()

		#>

	def IsToPositionOfItemNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToPositionOfItem )

			return TRUE

		else
			return FALSE
		ok

	def IsToPositionOfStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToPositionOfString )

			return TRUE

		else
			return FALSE
		ok

	def IsToPositionOfStringItemNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToPositionOfStringItem )

			return TRUE

		else
			return FALSE
		ok

	def IsToPositionOfCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToPositionOfChar )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsFromPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsFromPositionOfItemNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromPositionOfItem )

			return TRUE

		else
			return FALSE
		ok

	def IsFromPositionOfStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromPositionOfString )

			return TRUE

		else
			return FALSE
		ok

	def IsFromPositionOfStringItemNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromPositionOfStringItem )

			return TRUE

		else
			return FALSE
		ok

	def IsFromPositionOfCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromPositionOfChar )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsOfNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Of )

			return TRUE

		else
			return FALSE
		ok

	def IsOnNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :On )

			return TRUE

		else
			return FALSE
		ok

	def IsInNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :In )

			return TRUE

		else
			return FALSE
		ok

	def IsInANamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InA )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsInSideNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :InSide or This[1] = :Inside@) )

			return TRUE

		else
			return FALSE
		ok

	def IsInSideANamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and 
			(This[1] = :InSideA or This[1] = :InsideA@) )

			return TRUE

		else
			return FALSE
		ok

	def IsInOrInsideNamedParam()
		if This.IsInNamedParam() or This.IsInsideNamedParam()
			return TRUE

		else
			return FALSE
		ok

		def IsInOrInsideNamedParams()
			return This.IsInOrInsideNamedParam()

		def IsInsideOrInNamedParam()
			return This.IsInOrInsideNamedParam()

		def IsInsideOrInNamedParams()
			return This.IsInOrInsideNamedParam()

	def IsWhereNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Where ) and
		   isString( This[2] )

			return TRUE

		else
			return FALSE
		ok

	def IsThatNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :That ) and
		   isString( This[2] )

			return TRUE

		else
			return FALSE
		ok

	def IsThatOrWhereNamedParam()
		if This.IsThatNamedParam() or This.IsWhatNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsThatOrWhereNamedParams()
			return This.IsThatOrWhereNamedParam()

		def IsWhereOrThatNamedParam()
			return This.IsThatOrWhereNamedParam()

		def IsWhereOrThatNamedParams()
			return This.IsThatOrWhereNamedParam()

	def IsPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Position )

			return TRUE

		else
			return FALSE
		ok

	def IsThisPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ThisPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Positions )

			return TRUE

		else
			return FALSE
		ok

	def IsThesePositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ThesePositions )

			return TRUE

		else
			return FALSE
		ok

	def IsPositionOrPositionsNamedParam()
		if This.IsPositionNamedParam() or This.IsPositionsNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsPositionOrPositionsNamedParams()
			return This.IsPositionOrPositionsNamedParam()

	def IsAlongWithNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  (This[1] = :AlongWith or This[1] = :AlongWith@)  )

			return TRUE

		else
			return FALSE
		ok

	def IsAlongWithTheirNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  (This[1] = :AlongWithTheir or This[1] = :AlongWithTheir@)  )

			return TRUE

		else
			return FALSE
		ok

	def IsAndNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  (This[1] = :And or This[1] = :And@)  )

			return TRUE

		else
			return FALSE
		ok

	def IsAndTheirNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  (This[1] = :AndTheir or This[1] = :AndTheir@)  )

			return TRUE

		else
			return FALSE
		ok

	def IsAndItemNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndItem )

			return TRUE

		else
			return FALSE
		ok

	def IsAndStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndString )

			return TRUE

		else
			return FALSE
		ok

	def IsAndStringItemNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndStringItem )

			return TRUE

		else
			return FALSE
		ok

	def IsAndCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndChar )

			return TRUE

		else
			return FALSE
		ok

	def IsAndPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsAndPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsAndItemAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndItemAt )

			return TRUE

		else
			return FALSE
		ok

	def IsAndItemAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndItemAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsAndStringAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndStringAt )

			return TRUE

		else
			return FALSE
		ok

	def IsAndStringAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndStringAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsAndStringItemAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndStringItemAt )

			return TRUE

		else
			return FALSE
		ok

	def IsAndStringItemAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndStringItemAtPosition )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsOrNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Or )

			return TRUE

		else
			return FALSE
		ok

	def IsOrANamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OrA )

			return TRUE

		else
			return FALSE
		ok

	def IsOrAnNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OrAn )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsNorNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Nor )

			return TRUE

		else
			return FALSE
		ok

	def IsWhileNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :While )

			return TRUE

		else
			return FALSE
		ok

	def IsNotNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Not )

			return TRUE

		else
			return FALSE
		ok

	def IsIfNamedParam()
		if This.NumberOfItems() = 2 and
		   This[1] = :If and
		   isString(This[2])

			return TRUE

		else
			return FALSE
		ok

	def IsIfOrWhereNamedParam()
		return This.IsIfNamedParam() or This.IsWhereNamedParam()

		def IsWhereOrIfNamedParam()
			return This.IsIfOrWhereNamedParam()

		def IsWhereOrIfNamedParams()
			return This.IsIfOrWhereNamedParam()

		def IsIfOrWhereNamedParams()
			return This.IsIfOrWhereNamedParam()


	def IsWithNamedParam()
		if This.NumberOfItems() = 2 and

		   ( isString(This[1]) and Q(This[1]).IsOneOfThese([ :With, :With@ ]) )

			return TRUE

		else
			return FALSE
		ok

	def IsWithOrAndNamedParam()
		if This.IsWithNamedParam() or This.IsAndNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsWithOrAndNamedParams()
			return This.IsWithOrAndNamedParam()

		def IsAndOrWithNamedParam()
			return This.IsWithOrAndNamedParam()

		def IsAndOrWithNamedParams()
			return This.IsWithOrAndNamedParam()

	def IsWithItemsInNamedParam() 
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and Q(This[1]).IsOneOfThese([ :WithItemsIn, :WithItemsIn@ ]) )

			return TRUE

		else
			return FALSE
		ok

	def IsWithCharsInNamedParam() 
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and Q(This[1]).IsOneOfThese([ :WithcharsIn, :WithCharsIn@ ]) )

			return TRUE

		else
			return FALSE
		ok

	def IsByItemsInNamedParam()
		if This.NumberOfItems() = 2 and

		   ( isString(This[1]) and Q(This[1]).IsOneOfThese([ :ByItemsIn, :ByItemsIn@ ]) )

			return TRUE

		else
			return FALSE
		ok

	def IsUsingItemsInNamedParam()
		if This.NumberOfItems() = 2 and

		   ( isString(This[1]) and Q(This[1]).IsOneOfThese([ :UsingItemsIn, :UsingItemsIn@ ]) )

			return TRUE

		else
			return FALSE
		ok

	def IsWithTheirNamedParam()
		if This.NumberOfItems() = 2 and

		   ( isString(This[1]) and Q(This[1]).IsOneOfThese([ :WithTheir, :WithTheir@ ]) )

			return TRUE

		else
			return FALSE
		ok

	def IsByNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  StzStringQ(This[1]).IsOneOfThese([ :By, :By@ ]) )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsByColNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  StzStringQ(This[1]).IsOneOfThese([ :ByCol, :ByCol@ ]) )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsByColumnNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  StzStringQ(This[1]).IsOneOfThese([ :ByColumn, :ByColumn@ ]) )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsUsingColNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  StzStringQ(This[1]).IsOneOfThese([ :UsingCol, :UsingCol@ ]) )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsUsingColumnNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  StzStringQ(This[1]).IsOneOfThese([ :UsingColumn, :UsingColumn@ ]) )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsWithColNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  StzStringQ(This[1]).IsOneOfThese([ :WithCol, :WithCol@ ]) )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsWithColumnNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  StzStringQ(This[1]).IsOneOfThese([ :WithColumn, :WithColumn@ ]) )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsByRowNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ByRow )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsWithRowNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :WithRow )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsUsingRowNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :UsingRow )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsByCellNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ByCell )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsWithCellNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :WithCell )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsUsingCellNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :UsingCell )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsWithOrByNamedParam()
		return This.IsWithNamedParam() OR This.IsByNamedParam()

		def IsByOrWithNamedParam()
			return This.IsWithOrByNamedParam()

		def IsByOrWithNamedParams()
			return This.IsWithOrByNamedParam()

		def IsWithOrByNamedParams()
			return This.IsWithOrByNamedParam()

	def IsUsingNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Using )

			return TRUE

		else
			return FALSE
		ok

	def IsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and This[1] = :At
			return TRUE

		else
			return FALSE
		ok

	def IsAtOrUsingNamedParam()
		if This.IsAtNamedParam() or This.IsUsingNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsUsingOrAtNamedParam()
			return This.IsAtOrUsingNamedParam()

		def IsUsingOrAtNamedParams()
			return This.IsAtOrUsingNamedParam()

		def IsAtOrUsingNamedParams()
			return This.IsAtOrUsingNamedParam()

	#--

	def IsAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisPositionNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsAtPositionsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThesePositionsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThesePositions )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyPositionsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyPositions )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtOrAtPositionNamedParam()
		if This.IsAtNamedParam() or
		   This.IsAtPositionNamedParam()

			return TRUE

		else
			return FALSE
		ok

		def IsAtPositionOrAtNamedParam()
			return This.IsAtOrAtPositionNamedParam()

		def IsAtPositionOrAtNamedParams()
			return This.IsAtOrAtPositionNamedParam()

		def IsAtOrAtPositionNamedParams()
			return This.IsAtOrAtPositionNamedParam()

	def IsAtOrAtPositionsNamedParam()
		if This.IsAtNamedParam() or
		   This.IsAtPositionsNamedParam()

			return TRUE

		else
			return FALSE
		ok

		def IsAtPositionsOrAtNamedParam()
			return This.IsAtOrAtPositionsNamedParam()

		def IsAtPositionsOrAtNamedParams()
			return This.IsAtOrAtPositionsNamedParam()

		def IsAtOrAtPositionsNamedParams()
			return This.IsAtOrAtPositionsNamedParam()

	#==

	def IsAtItemNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtItem )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisItemNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisItem )

			return TRUE

		else
			return FALSE
		ok

	def IsAtItemsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtItems )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseItemsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseItems )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyItemsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyItems )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtStringNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtString )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisStringNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisString )

			return TRUE

		else
			return FALSE
		ok

	def IsAtStringsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseStringsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyStringsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyStrings )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtStringItemNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtStringItem )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisStringItemNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisStringItem )

			return TRUE

		else
			return FALSE
		ok

	def IsAtStringItemsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtStringItems )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseStringItemsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseStringItems )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyStringItemsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyStringItems )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtSubStringNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtSubString )

			return TRUE

		else
			return FALSE
		ok

	def IsAtOrAtSubStringNamedParam()
		if This.IsAtNamedParam() or This.IsAtSubStringNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IfAtSubStringOrAtNamedParam()
			return This.IsAtOrAtSubStringNamedParam()

		def IsAtOrAtSubStringNamedParams()
			return This.IsAtOrAtSubStringNamedParam()

		def IfAtSubStringOrAtNamedParams()
			return This.IsAtOrAtSubStringNamedParam()

	def IsAtThisSubStringNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisSubString )

			return TRUE

		else
			return FALSE
		ok

	def IsAtSubStringsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtSubStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseSubStringsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseSubStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManySubStringsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManySubStrings )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtCharNamedParam()
		if This.NumberOfItems() = 2 and
			( isChar(This[1]) and  This[1] = :AtChar )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisCharNamedParam()
		if This.NumberOfItems() = 2 and
			( isChar(This[1]) and  This[1] = :AtThisChar )

			return TRUE

		else
			return FALSE
		ok

	def IsAtCharsNamedParam()
		if This.NumberOfItems() = 2 and
			( isChar(This[1]) and  This[1] = :AtChars )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseCharsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseChars )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyCharsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyChars )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtNumberNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtNumber )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisNumberNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisNumber )

			return TRUE

		else
			return FALSE
		ok

	def IsAtNumbersNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtNumbers )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseNumbersNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseNumbers )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyNumbersNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyNumbers )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtListNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtList )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisListNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisList )

			return TRUE

		else
			return FALSE
		ok

	def IsAtListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyLists )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtSubListNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtSubList )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisSubListNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisSubList )

			return TRUE

		else
			return FALSE
		ok

	def IsAtSubListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtSubLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseSubListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseSubLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManySubListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManySubLists )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtPairNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtPair )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisPairNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisPair )

			return TRUE

		else
			return FALSE
		ok

	def IsAtPairsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtPairs )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThesePairsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThesePairs )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyPairsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyPairs )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtListOfNumbersNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListOfNumbers )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisListOfNumbersNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisListOfNumbers )

			return TRUE

		else
			return FALSE
		ok

	def IsAtListsOfNumbersNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListsOfNumbers )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseListsOfNumbersNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseListsOfNumbers )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyListsOfNumbersNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyListsOfNumbers )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtListOfCharsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListOfChars )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisListOfCharsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisListOfChars )

			return TRUE

		else
			return FALSE
		ok

	def IsAtListsOfCharsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListsOfChars )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseListsOfCharsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseListsOfChars )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyListsOfCharsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyListsOfChars )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtListOfStringsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListOfStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisListOfStringsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisListOfStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsAtListsOfStringsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListsOfStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseListsOfStringsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseListsOfStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyListsOfStringsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyListsOfStrings )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtListOfStringItemsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListOfStringItems )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisListOfStringItemsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisListOfStringItems )

			return TRUE

		else
			return FALSE
		ok


	def IsAtListsOfStringItemsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListsOfStringItems )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseListsOfStringItemsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseListsOfStringItems )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyListsOfStringItemsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyListsOfStringItems )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtListOfListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListOfLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisListOfListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisListOfLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtListsOfListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListsOfLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseListsOfListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseListsOfLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyListsOfListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyListsOfLists )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtListOfSubListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListOfSubLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisListOfSubListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisListOfSubLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtListsOfSubListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListsOfSubLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseListsOfSubListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseListsOfSubLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyListsOfSubListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyListsOfSubLists )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtListOfPairsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListOfPairs )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisListOfPairsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisListOfPairs )

			return TRUE

		else
			return FALSE
		ok
	def IsAtListsOfPairsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListsOfPairs )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseListsOfPairsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseListsOfPairs )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyListsOfPairsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyListsOfPairs )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtListOfHashListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListOfHashLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisListOfHashListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisListOfHashLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtListsOfHashListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListsOfHashLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseListsOfHashListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseListsOfHashLists )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyListsOfHashListsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyListsOfHashLists )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtObjectNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtObject )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisObjectNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisObject )

			return TRUE

		else
			return FALSE
		ok

	def IsAtObjectsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtObjects )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseObjectsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseObjects )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyObjectsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyObjects )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtSectionNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtSection )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisSectionNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisSection )

			return TRUE

		else
			return FALSE
		ok

	def IsAtSectionsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtSections )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseSectionsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseSections )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManySectionsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManySections )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtListOfSectionsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListOfSections )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisListOfSectionsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisListOfSections )

			return TRUE

		else
			return FALSE
		ok

	def IsAtListsOfSectionsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListsOfSections )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseListsOfSectionsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseListsOfSections )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyListsOfSectionsNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyListsOfSections )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtRangeNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtRange )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisRangeNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisRange )

			return TRUE

		else
			return FALSE
		ok

	def IsAtRangesNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtRanges )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseRangesNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseRanges )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyRangesNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyRanges )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAtListOfRangesNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListOfRanges )

			return TRUE

		else
			return FALSE
		ok

	def IsAtThisListOfRangesNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtThisListOfRanges )

			return TRUE

		else
			return FALSE
		ok

	def IsAtListsOfRangesNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtListsOfRanges )

			return TRUE

		else
			return FALSE
		ok

	def IsAtTheseListsOfRangesNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtTheseListsOfRanges )

			return TRUE

		else
			return FALSE
		ok

	def IsAtManyListsOfRangesNamedParam()
		if This.NumberOfItems() = 2 and
			( isString(This[1]) and  This[1] = :AtManyListsOfRanges )

			return TRUE

		else
			return FALSE
		ok


	#==

	def IsUsingOrAtOrWhereNamedParam()
		# Use IsOneOfTheseNamedParams([ ..., ..., ... ]) instead

		if This.IsUsingNamedParam() or
		   This.IsAtNamedParam() or
		   This.IsWhereNamedParam()

			return TRUE
		else
			return FALSE
		ok

		def IsUsingOrWhereOrAtNamedParam()
			return This.IsUsingOrAtOrWhereNamedParam()
		
		def IsAtOrUsingOrWhereNamedParam()
			return This.IsUsingOrAtOrWhereNamedParam()
	
		def IsAtOrWhereOrUsingNamedParam()
			return This.IsUsingOrAtOrWhereNamedParam()

		def IsWhereOrAtOrUsingNamedParam()
			return This.IsUsingOrAtOrWhereNamedParam()
	
		def IsWhereOrUsingOrAtNamedParam()
			return This.IsUsingOrAtOrWhereNamedParam()

		#--

		def IsUsingOrWhereOrAtNamedParams()
			return This.IsUsingOrAtOrWhereNamedParam()
		
		def IsAtOrUsingOrWhereNamedParams()
			return This.IsUsingOrAtOrWhereNamedParam()
	
		def IsAtOrWhereOrUsingNamedParams()
			return This.IsUsingOrAtOrWhereNamedParam()

		def IsWhereOrAtOrUsingNamedParams()
			return This.IsUsingOrAtOrWhereNamedParam()
	
		def IsWhereOrUsingOrAtNamedParams()
			return This.IsUsingOrAtOrWhereNamedParam()

		def IsUsingOrAtOrWhereNamedParams()
			return This.IsUsingOrAtOrWhereNamedParam()


	def IsStepNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  Q(This[1]).IsOneOfThese([ :Step, :Steps ]) ) and
		   isNumber( This[2] )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsNameNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Name ) and
		   isString(This[2])
		  
			return TRUE

		else
			return FALSE
		ok

	def IsNamedNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Named ) and
		   isString(This[2])
		  
			return TRUE

		else
			return FALSE
		ok

	def IsNamedAsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :NamedAs ) and
		   isString(This[2])
		  
			return TRUE

		else
			return FALSE
		ok

	def IsRaiseNamedParam()
		if This.NumberOfItems() <= 4 and
		   This.IsHashList() and
		   This.ToStzHashList().KeysQ().IsMadeOfSome([ :Where, :What, :Why, :Todo ]) and
		   This.ToStzHashList().ValuesQ().AllItemsVerifyW("isString(@item) and @item != NULL")

			return TRUE

		else
			return FALSE
		ok

	def IsReturnedAsNamedParam()

		if This.NumberOfItems() = 2 and This[1] = :ReturnedAs

			return TRUE

		else
			return FALSE
		ok

	def IsAndReturnedAsNamedParam()

		if This.NumberOfItems() = 2 and This[1] = :AndReturnedAs

			return TRUE

		else
			return FALSE
		ok

	def IsReturnNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and This[1] = :Return

			return TRUE

		else
			return FALSE
		ok

	def IsReturnAsNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and This[1] = :ReturnAs

			return TRUE

		else
			return FALSE
		ok

	def IsAndReturnAsNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and This[1] = :AndReturnAs

			return TRUE

		else
			return FALSE
		ok

	def IsReturnItAsNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and This[1] = :ReturnItAs

			return TRUE

		else
			return FALSE
		ok

	def IsAndReturnItAsNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and This[1] = :AndReturnItAs

			return TRUE

		else
			return FALSE
		ok

	def IsReturnThemAsNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and This[1] = :ReturnThemAs

			return TRUE

		else
			return FALSE
		ok

	def IsAndReturnThemAsNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and This[1] = :AndReturnThemAs

			return TRUE

		else
			return FALSE
		ok

	def IsReturningNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and Q(This[1]).IsEqualToCS(:Returning, :CS = FALSE)

			return TRUE

		else
			return FALSE
		ok

	def IsAndReturnNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and Q(This[1]).IsEqualToCS(:AndReturn, :CS = FALSE)

			return TRUE

		else
			return FALSE
		ok

	def IsAndReturningNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and Q(This[1]).IsEqualToCS(:AndReturning, :CS = FALSE)

			return TRUE

		else
			return FALSE
		ok

	def IsReturnNthNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and Q(This[1]).IsEqualToCS(:ReturnNth, :CS = FALSE)

			return TRUE

		else
			return FALSE
		ok

	def IsReturningNthNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and Q(This[1]).IsEqualToCS(:ReturningNth, :CS = FALSE)

			return TRUE

		else
			return FALSE
		ok

	def IsAndReturnNthNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and Q(This[1]).IsEqualToCS(:AndReturnNth, :CS = FALSE)

			return TRUE

		else
			return FALSE
		ok

	def IsAndReturningNthNamedParam()
		if This.NumberOfItems() = 2 and
		   isString(This[1]) and Q(This[1]).IsEqualToCS(:AndReturningNth, :CS = FALSE)

			return TRUE

		else
			return FALSE
		ok

	def IsUpToNCharsNamedParam()
		if This.NumberOfItems() = 2 and
 		   isString(This[1]) and  This[1] = :UpToNChars
		  
			return TRUE

		else
			return FALSE
		ok

	def IsUpToNItemsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
 		   ( isString(This[1]) and  This[1] = :UpToNItems )
		  
			return TRUE

		else
			return FALSE
		ok

	def IsBeforeNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :Before )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforePositionNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforePosition )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforeThisPositionNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeThisPosition )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforePositionsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforePositions )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforeThesePositionsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeThesePositions )

			return TRUE
		else
			return FALSE
		ok

	#--

	def IsBeforeSubStringNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeSubString )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforeThisSubStringNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeThisSubString )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforeSubStringsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeSubStrings )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforeTheseSubStringsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeTheseSubStrings )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforeSubStringPositionNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeSubStringPosition )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforeThisSubStringPositionNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeThisSubStringPosition )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforeSubStringsPositionsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeSubStringsPositions )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforeTheseSubStringsPositionsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeTheseSubStringsPositions )

			return TRUE
		else
			return FALSE
		ok

	#--

	def IsAfterSubStringNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterSubString )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterThisSubStringNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterThisSubString )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterSubStringsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterSubStrings )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterTheseSubStringsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterTheseSubStrings )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterSubStringPositionNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterSubStringPosition )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterThisSubStringPositionNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterThisSubStringPosition )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterSubStringsPositionsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterSubStringsPositions )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterTheseSubStringsPositionsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterTheseSubStringsPositions )

			return TRUE
		else
			return FALSE
		ok

	#--

	def IsBeforeSectionNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeSection )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforeThisSectionNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeThisSection )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforeSectionsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeSections )

			return TRUE
		else
			return FALSE
		ok

	def IsBeforeTheseSectionsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :BeforeTheseSections )

			return TRUE
		else
			return FALSE
		ok

	#--

	def IsAfterSectionNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterSection )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterThisSectionNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterThisSection )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterSectionsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterSections )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterTheseSectionsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterTheseSections )

			return TRUE
		else
			return FALSE
		ok

	#--

	def IsBeforeOrAtNamedParam()
		if This.IsBeforeNamedParam() or This.IsAtNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsAtOrBeforeNamedParam()
			return This.IsBeforeOrAtNamedParam()

	def IsAfterNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :After )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterPositionNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterPosition )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterThisPositionNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterThisPosition )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterPositionsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterPositions )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterThesePositionsNamedParam()
		if ( This.NumberOfItems() = 2 ) and
		   ( isString(This[1]) and This[1] = :AfterThesePositions )

			return TRUE
		else
			return FALSE
		ok

	def IsAfterOrAtNamedParam()
		if This.IsAfterNamedParam() or This.IsAtNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsAtOrAfterNamedParam()
			return This.IsAfterOrAtNamedParam()

	def IsBeforeOrAfterNamedParam()
		if This.IsBeforeNamedPAram() or This.IsAfterNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsAfterOrBeforeNamedParam()
			return This.IsBeforeOrAfterNamedParam()

	def IsWidthNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Width )

			return TRUE

		else
			return FALSE
		ok

	def IsWithOrUsingNamedParam()
		if This.IsWithNamedParam() or This.IsUsingNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsWithOrUsingNamedParams()
			return This.IsWithOrUsingNamedParam()

		def IsUsingOrWithNamedParam()
			return This.IsWithOrUsingNamedParam()

		def IsUsingOrWithNamedParams()
			return This.IsWithOrUsingNamedParam()

	def IsMadeOfNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :MadeOf )

			return TRUE

		else
			return FALSE
		ok

	def IsNthTofirstNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :NthToFirst )

			return TRUE

		else
			return FALSE
		ok

	def IsNthToFirstCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :NthToFirstChar )

			return TRUE

		else
			return FALSE
		ok

	def IsNthToFirstItemNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :NthToFirstItem )

			return TRUE

		else
			return FALSE
		ok

	def IsNthToLastNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :NthToLast )

			return TRUE

		else
			return FALSE
		ok

	def IsNthToLastCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :NthToLastChar )

			return TRUE

		else
			return FALSE
		ok

	def IsNthToLastItemNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :NthToLastItem )

			return TRUE

		else
			return FALSE
		ok

	def IsStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :String )

			return TRUE

		else
			return FALSE
		ok

	def IsThisStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ThisString )

			return TRUE

		else
			return FALSE
		ok

	def IsStringItemNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringItem )

			return TRUE

		else
			return FALSE
		ok

	def IsThisStringItemNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ThisStringItem )

			return TRUE

		else
			return FALSE
		ok

	def IsStringOrStringItemNamedParam()
		if This.IsStringNamedParam() or This.IsStringItemNamedParam()
			return TRUE
		else
			return FALSE
		ok

		def IsStringItemOrStringNamedParam()
			return This.IsStringOrStringItemNamedParam()

	#--

	def IsNumberNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Number )

			return TRUE

		else
			return FALSE
		ok

	def IsThisNumberNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ThisNumber )

			return TRUE

		else
			return FALSE
		ok

	def IsNumbersNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Numbers )

			return TRUE

		else
			return FALSE
		ok

	def IsTheseNumbersNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :TheseNumbers )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsCharNamedParam()
		if This.CharOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Char )

			return TRUE

		else
			return FALSE
		ok

	def IsThisCharNamedParam()
		if This.CharOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ThisChar )

			return TRUE

		else
			return FALSE
		ok

	def IsCharsNamedParam()
		if This.CharOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Chars )

			return TRUE

		else
			return FALSE
		ok

	def IsTheseCharsNamedParam()
		if This.CharOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :TheseChars )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsItemNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Item )

			return TRUE

		else
			return FALSE
		ok

	def IsItemsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Items )

			return TRUE

		else
			return FALSE
		ok

	def IsItemAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ItemAt )

			return TRUE

		else
			return FALSE
		ok

	def IsItemsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Items )

			return TRUE

		else
			return FALSE
		ok

	def IsItemAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ItemAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsItemsAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ItemsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsStringsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Strings )

			return TRUE

		else
			return FALSE
		ok

	def IsTheseStringsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :TheseStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsStringAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringAt )

			return TRUE

		else
			return FALSE
		ok

	def IsThisStringAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ThisStringAt )

			return TRUE

		else
			return FALSE
		ok

	def IsStringAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsStringAtPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsItemAtPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ItemAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsItemsAtPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ItemsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsStringItemAtPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringItemAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsCharAtPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :CharAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsCharsAtPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :CharsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsStringItemAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringItemAt )

			return TRUE

		else
			return FALSE
		ok

	def IsStringItemAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringItemAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsSubStringAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :SubStringAt )

			return TRUE

		else
			return FALSE
		ok

	def IsThisSubStringAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ThisSubStringAt )

			return TRUE

		else
			return FALSE
		ok

	def IsSubStringsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :SubStringsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsTheseSubStringsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :TheseSubStringsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsSubStringAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :SubStringAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsSubStringsAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :SubStringsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Between )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenXTNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenXT )

			return TRUE

		else
			return FALSE
		ok

	def IsInBetweenNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InBetween )

			return TRUE

		else
			return FALSE
		ok

	def IsInBetweenXTNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InBetweenXT )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenIBNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenIB )

			return TRUE

		else
			return FALSE
		ok

	def IsInBetweenIBNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InBetweenIB )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenIBSNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenIBS )

			return TRUE

		else
			return FALSE
		ok

	def IsInBetweenIBSNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InBetweenIBS )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenSNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenS )

			return TRUE

		else
			return FALSE
		ok

	def IsInBetweenSNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InBetweenS )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenCSNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenCS )

			return TRUE

		else
			return FALSE
		ok

	def IsInBetweenCSNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :InBetweenCS )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenPositions )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsBetweenRowNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenRow )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenRowAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenRowAt )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenRowAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenRowAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenRowsAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenRowsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenRowsAtPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenRowsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenRowsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenRows )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenRowsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenRowsAt )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsBetweenColNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenCol )

			return TRUE

		else
			return FALSE
		ok

		def IsBetweenColumnNamedParam()
			if This.NumberOfItems() = 2 and
			   ( isString(This[1]) and  This[1] = :BetweenColumn )
	
				return TRUE
	
			else
				return FALSE
			ok

	def IsBetweenColAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenColAt )

			return TRUE

		else
			return FALSE
		ok

		def IsBetweenColumnAtNamedParam()
			if This.NumberOfItems() = 2 and
			   ( isString(This[1]) and  This[1] = :BetweenColumnAt )
	
				return TRUE
	
			else
				return FALSE
			ok

	def IsBetweenColAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenColAtPosition )

			return TRUE

		else
			return FALSE
		ok

		def IsBetweenColumnAtPositionNamedParam()
			if This.NumberOfItems() = 2 and
			   ( isString(This[1]) and  This[1] = :BetweenColumnAtPosition )
	
				return TRUE
	
			else
				return FALSE
			ok
	
	def IsBetweenColsAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenColsAtPosition )

			return TRUE

		else
			return FALSE
		ok

		def IsBetweenColumnsAtPositionNamedParam()
			if This.NumberOfItems() = 2 and
			   ( isString(This[1]) and  This[1] = :BetweenColumnsAtPosition )
	
				return TRUE
	
			else
				return FALSE
			ok

	def IsBetweenColsAtPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenColsAtPositions )

			return TRUE

		else
			return FALSE
		ok

		def IsBetweenColumnsAtPositionsNamedParam()
			if This.NumberOfItems() = 2 and
			   ( isString(This[1]) and  This[1] = :BetweenColumnsAtPositions )
	
				return TRUE
	
			else
				return FALSE
			ok

	def IsBetweenColsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenCols )

			return TRUE

		else
			return FALSE
		ok

		def IsBetweenColumnsNamedParam()
			if This.NumberOfItems() = 2 and
			   ( isString(This[1]) and  This[1] = :BetweenColumns )
	
				return TRUE
	
			else
				return FALSE
			ok

	def IsBetweenColsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenColsAt )

			return TRUE

		else
			return FALSE
		ok

		def IsBetweenColumnsAtNamedParam()
			if This.NumberOfItems() = 2 and
			   ( isString(This[1]) and  This[1] = :BetweenColumnsAt )
	
				return TRUE
	
			else
				return FALSE
			ok

	#--

	def IsFromPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsToPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToPositions )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsItemFromPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ItemFromPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsItemsFromPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ItemsFromPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsItemFromNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ItemFrom )

			return TRUE

		else
			return FALSE
		ok

	def IsItemsFromNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ItemsFrom )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenItemAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenItemAt )

			return TRUE

		else
			return FALSE
		ok

	def IsFromItemAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromItemAt )

			return TRUE

		else
			return FALSE
		ok

	def IsToItemAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToItemAt )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenItemsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenItemsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsFromItemsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromItemsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsToItemsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToItemsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenItemAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenItemAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsFromItemAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromItemAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsToItemAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToItemAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenItemNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenItem )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenItemsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenItems )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenItemAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenItemAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsToItemAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToItemAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsFromItemAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromItemAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsFromItemPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromItemPosition )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsStringFromPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringFromPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsStringsFromPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringsFromPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsStringFromNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringFrom )

			return TRUE

		else
			return FALSE
		ok

	def IsStringsFromNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringsFrom )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenString )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringItemNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringItem )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringItemsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringItems )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringAt )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStringAt )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringAt )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStringAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStringAtPositions )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsStringItemFromPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringItemFromPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsStringItemsFromPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringItemsFromPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsStringItemFromNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringItemFrom )

			return TRUE

		else
			return FALSE
		ok

	def IsStringItemsFromNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringItemsFrom )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringItemPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringItemPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringItemAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringItemAt )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringItemAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringItemAt )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringItemAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStringItemAt )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringItemAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringItemAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringItemAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringItemAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringItemAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStringItemAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringItemAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringItemAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringItemAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringItemAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringItemAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStringItemAtPositions )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsCharFromPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :CharFromPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsCharsFromPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :CharsFromPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsCharFromNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :CharFrom )

			return TRUE

		else
			return FALSE
		ok

	def IsCharsFromNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :CharsFrom )

			return TRUE

		else
			return FALSE
		ok

	def IsFromCharPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromCharPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsCharAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :CharAt )

			return TRUE

		else
			return FALSE
		ok

	def IsCharAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :CharAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenCharNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenChar )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenCharsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenChars )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenCharAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenCharAt )

			return TRUE

		else
			return FALSE
		ok

	def IsFromCharAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromCharAt )

			return TRUE

		else
			return FALSE
		ok

	def IsFirstPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FirstPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsLastPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :LastPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsToCharAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToCharAt )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenCharsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenCharsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsFromCharsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromCharsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsToCharsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToCharsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenCharAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenCharAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsFromCharAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromCharAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsToCharAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToCharAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenCharAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenCharAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsToCharAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToCharAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsFromCharAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromCharAtPositions )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsStringsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Strings )

			return TRUE

		else
			return FALSE
		ok

	def IsTheseStringsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :TheseStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsStringsAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsTheseStringsAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :theseStringsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsStringsAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsTheseStringsAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :TheseStringsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringsAtNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringsAtNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringsAtNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStringsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringsAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringsAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringsAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStringsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringsAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringsAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringsAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStringsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsStringItemsFromPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringItemsFromPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsStringItemsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringItems )

			return TRUE

		else
			return FALSE
		ok

	def IsStringItemsAtNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringItemsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsStringItemsAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringItemsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsStringItemsAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :StringItemsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringItemsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringItems )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringItemsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStringItems )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringItemsAtNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringItemsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringItemsAtNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringItemsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringItemsAtNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStringItemsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringItemsAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringItemsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringItemsAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringItemsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringItemsAtPositionNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStringItemsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsBetweenStringItemsAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :BetweenStringItemsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsFromStringItemsAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :FromStringItemsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsToStringItemsAtPositionsNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToStringItemsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAndColNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndCol )

			return TRUE

		else
			return FALSE
		ok

	def IsAndColumnNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndColumn )

			return TRUE

		else
			return FALSE
		ok

	def IsAndColAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndColat )

			return TRUE

		else
			return FALSE
		ok

	def IsAndColumnAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndColumnAt )

			return TRUE

		else
			return FALSE
		ok

	def IsAndColAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndColAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsAndColumnAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndColumnAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsAndColNamedNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndColNamed )

			return TRUE

		else
			return FALSE
		ok

	def IsAndColumnNamedNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndColumnNamed )

			return TRUE

		else
			return FALSE
		ok

	def IsColsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Cols )

			return TRUE

		else
			return FALSE
		ok

	def IsColumnsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Columns )

			return TRUE

		else
			return FALSE
		ok

	def IsColsAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ColsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsColumnsAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ColumnsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsColsAtPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ColsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	def IsColumnsAtPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ColumnsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsAndRowNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndRow )

			return TRUE

		else
			return FALSE
		ok

	def IsAndRowAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndRowAt )

			return TRUE

		else
			return FALSE
		ok

	def IsAndRowAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndRowAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsRowsAtNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :RowsAt )

			return TRUE

		else
			return FALSE
		ok

	def IsRowsAtPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :RowsAtPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsRowsAtPositionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :RowsAtPositions )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsThisNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :This )

			return TRUE

		else
			return FALSE
		ok

	def IsAndThisNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndThis )

			return TRUE

		else
			return FALSE
		ok

	def IsAndThatNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :AndThat )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsEvalNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Eval )

			return TRUE

		else
			return FALSE
		ok

	def IsEvaluateNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Evaluate )

			return TRUE

		else
			return FALSE
		ok

	def IsEvalFromNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :EvalFrom )

			return TRUE

		else
			return FALSE
		ok

	def IsEvaluateFromNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :EvaluateFrom )

			return TRUE

		else
			return FALSE
		ok

	def IsEvalDirectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :EvalDirection )

			return TRUE

		else
			return FALSE
		ok

	def IsEvaluationDirectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :EvaluationDirection )

			return TRUE

		else
			return FALSE
		ok

	def IsOrThisNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OrThis )

			return TRUE

		else
			return FALSE
		ok

	def IsOrThatNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OrThat )

			return TRUE

		else
			return FALSE
		ok

	#--

	def IsSubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :SubString )

			return TRUE
		else
			return FALSE
		ok

	def IsThisSubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :ThisSubString )

			return TRUE
		else
			return FALSE
		ok

	def IsAndSubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndSubString )

			return TRUE
		else
			return FALSE
		ok

	def IsBetweenSubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :BetweenSubString )

			return TRUE
		else
			return FALSE
		ok

	def IsBoundedBySubStringNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :BoundedBySubString )

			return TRUE
		else
			return FALSE
		ok

	def IsSubStringsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :SubStrings )

			return TRUE
		else
			return FALSE
		ok

	def IsTheseSubStringsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :TheseSubStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsAndSubStringsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndSubStrings )

			return TRUE
		else
			return FALSE
		ok

	def IsOfSubStringsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OfSubStrings )

			return TRUE
		else
			return FALSE
		ok

	def IsInSubStringsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :InSubStrings )

			return TRUE
		else
			return FALSE
		ok

	def IsBetweenSubStringsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :BetweenSubStrings )

			return TRUE
		else
			return FALSE
		ok

	def IsBoundedBySubStringsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :BoundedBySubStrings )

			return TRUE
		else
			return FALSE
		ok

	#--

	def IsBoundedByNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :BoundedBy )

			return TRUE
		else
			return FALSE
		ok

	def IsBoundedByIBNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :BoundedByIB )

			return TRUE
		else
			return FALSE
		ok


	def IsIsBoundedByNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :IsBoundedBy )

			return TRUE
		else
			return FALSE
		ok

	#--

	def IsSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :Section )

			return TRUE
		else
			return FALSE
		ok

	def IsThisSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :ThisSection )

			return TRUE
		else
			return FALSE
		ok

	def IsAndSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndSection )

			return TRUE
		else
			return FALSE
		ok

	def IsOfSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OfSection )

			return TRUE
		else
			return FALSE
		ok

	def IsInSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :InSection )

			return TRUE
		else
			return FALSE
		ok

	def IsSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :Sections )

			return TRUE
		else
			return FALSE
		ok

	def IsTheseSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :TheseSections )

			return TRUE
		else
			return FALSE
		ok

	def IsAndSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :AndSections )

			return TRUE
		else
			return FALSE
		ok

	def IsOfSubSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :OfSections )

			return TRUE
		else
			return FALSE
		ok

	def IsInSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and This[1] = :InSections )

			return TRUE
		else
			return FALSE
		ok

	def IsSectionOrInSectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and (This[1] = :Section or This[1] = :InSection) )

			return TRUE
		else
			return FALSE
		ok

	def IsSectionsOrInSectionsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and (This[1] = :Sections or This[1] = :InSections) )

			return TRUE
		else
			return FALSE
		ok

		def IsSectionsOrInSectionsNamedParams()
			return This.IsSectionsOrInSectionsNamedParam()

	#--

	def IsOfSizeNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :OfSize )

			return TRUE

		else
			return FALSE
		ok

	def IsSizeNamedParam()

		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Size )

			return TRUE

		else
			return FALSE
		ok

	def IsDoNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Do )

			return TRUE

		else
			return FALSE
		ok

	def IsUntilNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Until )

			return TRUE

		else
			return FALSE
		ok

	def IsUntilPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :UntilPosition )

			return TRUE

		else
			return FALSE
		ok

	def IsUntilXTNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :UntilXT )

			return TRUE

		else
			return FALSE
		ok

	def IsUptoNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :UpTo )

			return TRUE

		else
			return FALSE
		ok

	def IsUptoPositionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :UpToPosition )

			return TRUE

		else
			return FALSE
		ok

		# Misspelled form

		def IsUpToPosionNamedParam()
			return This.IsUptoPositionNamedParam()

	def IsUpToNNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :UpToN or This[1] = :UpToN@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsUnderNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Under )

			return TRUE

		else
			return FALSE
		ok

	def IsExpressionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :Expression )

			return TRUE

		else
			return FALSE
		ok

	def IsToNCharsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToNChars )

			return TRUE

		else
			return FALSE
		ok

	def IsToNItemsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToNItems )

			return TRUE

		else
			return FALSE
		ok

	def IsToNStringsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToNStrings )

			return TRUE

		else
			return FALSE
		ok

	def IsToNStringItemsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToNStringItems )

			return TRUE

		else
			return FALSE
		ok

	def IsToNNumbersNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToNNumbers )

			return TRUE

		else
			return FALSE
		ok

	def IsToNListsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToNLists )

			return TRUE

		else
			return FALSE
		ok

	def IsToNObjectsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and  This[1] = :ToNObjects )

			return TRUE

		else
			return FALSE
		ok

	def IsLastSepNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :LastSep or This[1] = :LastSep@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsToEachNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :ToEach or This[1] = :ToEach@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsBeforeEachNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :BeforeEach or This[1] = :BeforeEach@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsAfterEachNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :AfterEach or This[1] = :AfterEach@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsToNthNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :ToNth or This[1] = :ToNth@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsToFirstNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :ToFirst or This[1] = :ToFirst@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsToLastNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :ToLast or This[1] = :ToLast@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsAfterNthNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :AfterNth or This[1] = :AfterNth@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsAfterFirstNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :AfterFirst or This[1] = :AfterFirst@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsAfterLastNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :AfterLast or This[1] = :AfterLast@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsBeforeNthNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :BeforeNth or This[1] = :BeforeNth@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsBeforeFirstNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :BeforeFirst or This[1] = :BeforeFirst@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsBeforeLastNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :BeforeLast or This[1] = :BeforeLast@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsAroundNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :Around or This[1] = :Around@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsAroundEachNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :AroundEach or This[1] = :AroundEach@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsAroundNthNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :AroundNth or This[1] = :AroundNth@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsAroundFirstNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :AroundFirst or This[1] = :AroundFirst@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsAroundLastNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :AroundLast or This[1] = :AroundLast@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsEachNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :Each or This[1] = :Each@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsFirstNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :First or This[1] = :First@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsLastNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :Last or This[1] = :Last@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsConcatenatedNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :Concatenated or This[1] = :Concatenated@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsConcatenatedUsingNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :ConcatenatedUsing or This[1] = :ConcatenatedUsing@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsConcatenatedWithNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :ConcatenatedWith or This[1] = :ConcatenatedWith@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsEachNCharsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :EachNChars or This[1] = :EachNChars@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsEachNItemsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :EachNItems or This[1] = :EachNItems@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsEachNStringsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :EachNStrings or This[1] = :EachNStrings@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsEachNNumbersNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :EachNNumbers or This[1] = :EachNNumbers@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsEachNListsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :EachNLists or This[1] = :EachNLists@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsEachNPairsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :EachNPairs or This[1] = :EachNPairs@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsEachNObjectsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :EachNObjects or This[1] = :EachNObjects@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsDirectionNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :Direction or This[1] = :Direction@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsGoingNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :Going or This[1] = :Going@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsComingNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :Coming or This[1] = :Coming@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsSteppingNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :Stepping or This[1] = :Stepping@ ) )

			return TRUE

		else
			return FALSE
		ok

	
	def IsUsingOrWithOrByNamedParam()

		if This.IsUsingNamedParam() or
		   This.IsWithNamedParam() or
		   This.IsOrNamedParam()

			return TRUE
		else
			return FALSE
		ok

		#< @FunctionAlternativeForms

		def IsUsingOrByOrWithNamedParam()
			return This.IsUsingOrWithOrByNamedParam()

		def IsByOrWithOrUsingNamedParam()
			return This.IsUsingOrWithOrByNamedParam()

		def IsByOrUsingOrWithNamedParam()
			return This.IsUsingOrWithOrByNamedParam()

		def IsWithOrByOrUsingNamedParam()
			return This.IsUsingOrWithOrByNamedParam()

		def IsWithOrUsingOrByNamedParam()
			return This.IsUsingOrWithOrByNamedParam()

		#--

		def IsUsingOrWithOrByNamedParams()
			return This.IsUsingOrWithOrByNamedParam()

		def IsUsingOrByOrWithNamedParams()
			return This.IsUsingOrWithOrByNamedParam()

		def IsByOrWithOrUsingNamedParams()
			return This.IsUsingOrWithOrByNamedParam()

		def IsByOrUsingOrWithNamedParams()
			return This.IsUsingOrWithOrByNamedParam()

		def IsWithOrByOrUsingNamedParams()
			return This.IsUsingOrWithOrByNamedParam()

		def IsWithOrUsingOrByNamedParams()
			return This.IsUsingOrWithOrByNamedParam()

		#>

	def IsNextNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :Next or This[1] = :Next@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsNextNthNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :NextNth or This[1] = :NextNth@  or 
			 This[1] = :NthNext or This[1] = :NthNext@) )

			return TRUE

		else
			return FALSE
		ok

		def IsNthNextNamedParam()
			return This.IsNextNthNamedParam()

	def IsPreviousNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :Previous or This[1] = :Previous@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsPreviousNthNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :PreviousNth or This[1] = :PreviousNth@  or 
			 This[1] = :NthPrevious or This[1] = :NthPrevious@) )

			return TRUE

		else
			return FALSE
		ok

		def IsNthPreviousNamedParam()
			return This.IsPreviousNthNamedParam()

	#--

	def IsExactlyNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :Exactly or This[1] = :Exactly@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsMoreThenNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :MoreThen or This[1] = :MoreThen@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsLessThenNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :LessThen or This[1] = :LessThen@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsOfTheseNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :OfThese or This[1] = :OfThese@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsOfTheseSubStringsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :OfTheseSubStrings or This[1] = :OfTheseSubStrings@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsOfTheseNumbersNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :OfTheseNumbers or This[1] = :OfTheseNumbers@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsOfTheseListsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :OfTheseLists or This[1] = :OfTheseLists@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsOfTheseObjectsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :OfTheseObjects or This[1] = :OfTheseObjects@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsOfTheseCharsNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :OfTheseChars or This[1] = :OfTheseChars@ ) )

			return TRUE

		else
			return FALSE
		ok

	def IsOfTheseLettersNamedParam()
		if This.NumberOfItems() = 2 and
		   ( isString(This[1]) and
			(This[1] = :OfTheseLetters or This[1] = :OfTheseLetters@ ) )

			return TRUE

		else
			return FALSE
		ok

	  #===========================================#
	 #  GETTING THE UNICODES CODES OF EACH ITEM  #
	#===========================================#

	def Unicodes()
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen
			if isObject(aContent[i])
				i++
			ok

			aResult + Q(aContent[i]).Unicode()
		next

		return aResult

		def Unicode()
			return This.Unicodes()

	def HexUnicodes()
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen
			if isObject(aContent[i])
				i++
			ok

			aResult + Q(aContent[i]).HexUnicode()
		next

		return aResult

		def HexUnicode()
			return This.HexUnicodes()

	  #-----------------------------------------------------------#
	 #  GETTING THE NAMES (IN UNICODE) OF THE CHARS IN THE LIST  #
	#-----------------------------------------------------------#

	def Names()
		acChars = This.Chars()
		nLen = len(acChars)

		acResult = []

		for i = 1 to nLen
			acResult + StzCharQ(acChars[i]).Name()
		next

		return acResult

		#< @FunctionAlternativeForms

		def NamesInUnicode()
			return This.Names()

		def UnicodeNames()
			return This.Names()

		#--

		def CharsNames()
			return This.Names()

		def CharsNamesInUnicode()
			return This.Names()

		def UnicodeCharsNames()
			return This.Names()

		#>

	  #==========================================#
	 #  TRANSFORMING THE LIST TO AN OTHER FORM  #
	#==========================================#

	def ToStzListOfChars()
		if NOT This.IsListOfChars()
			StzRaise("Can't cast the list into a stzListOfChars!")
		ok

		return new stzListOfChars( This.Content() )

	func ToListOfStzChars()
		if NOT This.IsListOfChars()
			StzRaise("Can't cast the list into a stzListOfChars!")
		ok

		acChars = This.Content()
		nLen = len(acChars)

		aResult = []

		for i = 1 to nLen
			oChar = new stzChar(acChars[i])
			aResult + oChar
		next

		return aResult

	  #========================================================#
	 #  TRANSFORMING THE LIST TO RING CODE (COMPUTABLE FORM)  #
	#========================================================#
 
	def ToListInStringInShortForm()
		cResult = This.ToCodeQ().ToListInShortForm()
		return cResult

		def ToListInShortForm()
			return This.ToListInStringInShortForm()

		def ToListInAStringInShortForm()
			return This.ToListInStringInShortForm()

	def ComputableForm()
		return @@( This.Content() )

		def ToListInString()
			return ComputableForm()

		def ToListInAString()
			return ComputableForm()

	  #=======================================#
	 #  GETTING A RANDOM ITEM FROM THE LIST  #
	#=======================================#

	def AnyItem()
		nLen = This.NumberOfItems() 
		if nLen = 0
			StzRaise("Can't return any item because the list is empty!")
		ok

		if nLen = 1
			return This.Item(1)
		ok

		n = ARandomNumberBetweenIB(1, nLen)
		return This.Item(n)

		#< @FunctionAlternativeForms

		def RandomItem()
			return This.AnyItem()

		def ARandomItem()
			return This.AnyItem()

		def AnItem()
			return This.AnyItem()

		#>

	  #---------------------------------------------------------------#
	 #  GETTING A RANDOM ITEM FROM THE LIST ALONG WITH ITS POSITION  #
	#---------------------------------------------------------------#

	def AnyItemZ() # AnyItemAndItsPosition()
		nLen = This.NumberOfItems() 
		if nLen = 0
			StzRaise("Can't return any item because the list is empty!")
		ok

		if nLen = 1
			return This.Item(1)
		ok

		aRresult = [ This.Item(n), ARandomNumberBetweenIB(1, nLen) ]
		return aResult

		#< @FunctionAlternativeForms

		def RandomItemZ()
			return This.AnyItemZ()

		def ARandomItemZ()
			return This.AnyItemZ()

		def AnItemZ()
			return This.AnyItemZ()

		#--

		def AnyItemAndItsPosition()
			return This.AnyItemZ()

		def RandomItemAndItsPosition()
			return This.AnyItemZ()

		def ARandomItemAndItsPosition()
			return This.AnyItemZ()

		def AnItemAndItsPosition()
			return This.AnyItemZ()

		#>

	  #----------------------------------------#
	 #  GETIING N RANDOM ITEMS FROM THE LIST  #
	#----------------------------------------#

	def NRandomItemsCS(pCaseSensitive)
		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT IsBoolean(pCaseSensitive)
			StzRaise("Incorrect param type! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		if pCaseSensitive = TRUE
			anPos = NRandomNumbersBetween(1, This.NumberOfItems())
			return This.ItemsAtPositions(anPos)

		else
#>>>>>>>		# TODO: Add case sensitivity
			StzRaise("Case sensitivity is not supported yet for this fucntion!")
		ok
	
		#< @functionAlternativeForm

		def NAnyItemsCS(pCaseSensitive)
			return This.NRandomItemsCS(pCaseSensitive)

		def AnyNItemsCS(pCaseSensitive)
			return This.NRandomItemsCS(pCaseSensitive)

		def NItemsCS(pCaseSensitive)
			return This.NRandomItemsCS(pCaseSensitive)

		def RandomNItemsCS(pCaseSensitive)
			return This.NRandomItemsCS(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def NRandomItems()
		return This.NRandomItemsCS(:CaseSensitive = TRUE)

		#< @functionAlternativeForm

		def NAnyItems()
			return This.NRandomItems()

		def AnyNItems(pCaseSensitive)
			return This.NRandomItems()

		def NItems(pCaseSensitive)
			return This.NRandomItems()

		def RandomNItems(pCaseSensitive)
			return This.NRandomItems()

		#>

	  #-------------------------------------------------------------------#
	 #  GETIING N RANDOM ITEMS FROM THE LIST ALONG WITH THEIR POSITIONS  #
	#-------------------------------------------------------------------#

	def NRandomItemsCSZ(pCaseSensitive) # NRandomItemsAndTheirPositions()
		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT IsBoolean(pCaseSensitive)
			StzRaise("Incorrect param type! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		if pCaseSensitive = TRUE
			anPos = NRandomNumbersBetween(1, This.NumberOfItems())
			aItems = This.ItemsAtPositions(anPos)
			return [ aItems, anPos ]

		else
#>>>>>>>		# TODO: Add case sensitivity
			StzRaise("Case sensitivity is not supported yet for this fucntion!")
		ok
		
		#< @FunctionAlternativeForms

		def NAnyItemsCSZ(pCaseSensitive)
			return This.NRandomItemsCSZ(pCaseSensitive)

		def NItemsCSZ(pCaseSensitive)
			return This.NRandomItemsCSZ(pCaseSensitive)

		def NRandomItemsAndTheirPositionsCS(pCaseSensitive)
			return This.NRandomItemsCSZ(pCaseSensitive)

		def NAnyItemsAndTheirPositionsCS(pCaseSensitive)
			return This.NRandomItemsCSZ(pCaseSensitive)

		def NItemsAndTheirPositionsCS(pCaseSensitive)
			return This.NRandomItemsCSZ(pCaseSensitive)

		def RandomItemsAndTheirPositionsCS(pCaseSensitive)
			return This.NRandomItemsCSZ(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def NRandomItemsZ()
		return This.NRandomItemsCSZ(:CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def NAnyItemsZ()
			return This.NRandomItemsZ()

		def NItemsZ()
			return This.NRandomItemsZ()

		def NRandomItemsAndTheirPositions()
			return This.NRandomItemsZ()

		def NAnyItemsAndTheirPositions()
			return This.NRandomItemsZ()

		def NItemsAndTheirPositions()
			return This.NRandomItemsZ()

		def RandomItemsAndTheirPositions()
			return This.NRandomItemsZ()

		#>

	  #-------------------------------------------#
	 #  GETIING SOME RANDOM ITEMS FROM THE LIST  #
	#-------------------------------------------#

	def SomeRandomItemsCS(pCaseSensitive)
		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT IsBoolean(pCaseSensitive)
			StzRaise("Incorrect param type! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		if pCaseSensitive = TRUE

			n = ARandomNumberBetweenIB( 1, This.NumberOfItems() )
			aResult = This.NRandomItems(n)
	
			return aResult
		else
#>>>>>>>		# TODO: Add case sensitivity
			StzRaise("Case sensitivity is not supported yet for this fucntion!")
		ok

		#< @FunctionAlternativeForms

		def RandomItemsCS(pCaseSensitive)
			return This.SomeRandomItemsCS(pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def SomeRandomItems()
		return This.SomeRandomItemsCS(pCaseSensitive)

		#< @FunctionAlternativeForms

		def RandomItems()
			return This.SomeRandomItems()

		#>

	  #----------------------------------------------------------------------#
	 #  GETIING SOME RANDOM ITEMS FROM THE LIST ALONG WITH THEIR POSITIONS  #
	#----------------------------------------------------------------------#

	def SomeRandomItemsCSZ(pCaseSensitive) # SomeRandomItemsAndTheirPositions
		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT IsBoolean(pCaseSensitive)
			StzRaise("Incorrect param type! pCaseSensitive must be a boolean (TRUE or FALSE).")
		ok

		if pCaseSensitive = TRUE

			n = ARandomNumberBetweenIB( 1, This.NumberOfItems() )
			aResult = This.NRandomItemsZ(n)
	
			return aResult
		else
#>>>>>>>		# TODO: Add case sensitivity
			StzRaise("Case sensitivity is not supported yet for this fucntion!")
		ok

		#< @FunctionAlternativeForms

		def SomeRandomItemsAndTheirPosotionsCS(pCaseSensitive)
			return This.SomeRandomItemsCSZ(pCaseSensitive)

		def RandomItemsCSZ(pCaseSensitive)
			return This.SomeRandomItemsCSZ(pCaseSensitive)

		def RandomItemsAndTheirPositionsZ(pCaseSensitive)
			return This.SomeRandomItemsCSZ(pCaseSensitive)

		#>

	  #---------------------------------------------------------#
	 #  GETTING AN ITEM FROM THE LIST OTHER THEN A GIVEN ITEM  #
	#---------------------------------------------------------#

	def AnItemOtherThanCS(pItem, pCaseSensitive)
		if isList(pItem)
			return This.AnyRandomItemOtherThanManyCS(pItem, pCaseSensitive)
		ok

		if NOT This.ContainsCS(pItem, pCaseSensitive)
			return This.AnyItem()

		else
			nPos = This.ToSetQ().FindFirstCS(pItem, pCaseSensitive)
			n = StzListOfNumbersQ( 1: len(aSet) ).AnyNumberOtherThan(nPos)
			return This.Item(n)
		ok
	
		#< @FunctionAlternativeForms
	
		def AnItemDifferentThanCS(pItem, pCaseSensitive)
			return This.AnItemOtherThanCS(pItem, pCaseSensitive)
	
		def AnItemDifferentOfCS(pItem, pCaseSensitive)
			return This.AnItemOtherThanCS(pItem, pCaseSensitive)

		def AnItemDifferentToCS(pItem, pCaseSensitive)
			return This.AnItemOtherThanCS(pItem, pCaseSensitive)

		def AnItemDifferentFromCS(pItem, pCaseSensitive)
			return This.AnItemOtherThanCS(pItem, pCaseSensitive)
	
		#--
	
		def ItemOtherThanCS(pItem, pCaseSensitive)
			return This.ANumberOtherThanCS(pItem, pCaseSensitive)
		
		def ItemDifferentToCS(pItem, pCaseSensitive)
			return This.ANumberOtherThanCS(pItem, pCaseSensitive)

		def ItemDifferentFromCS(pItem, pCaseSensitive)
			return This.ANumberOtherThanCS(pItem, pCaseSensitive)
	
		#--
	
		def AnyItemOtherThanCS(pItem, pCaseSensitive)
			return This.ANumberOtherThanCS(pItem, pCaseSensitive)
	
		def AnyItemDifferentThanCS(pItem, pCaseSensitive)
			return This.ANumberOtherThanCS(pcChar, pCaseSensitive)
	
		def AnyItemDifferentToCS(pItem, pCaseSensitive)
			return This.ANumberOtherThanCS(pItem, pCaseSensitive)

		def AnyItemDifferentFromCS(pItem, pCaseSensitive)
			return This.ANumberOtherThanCS(pItem, pCaseSensitive)
	
		#--

		def RandomItemOtherThanCS(pItem, pCaseSensitive)
			return This.ANumberOtherThanCS(pItem, pCaseSensitive)

		def ARandomItemOtherThanCS(pItem, pCaseSensitive)
			return This.ANumberOtherThanCS(pItem, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def AnItemOtherThan(pItem)
		return This.AnItemOtherThanCS(pItem, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms
	
		def AnItemDifferentThan(pItem)
			return This.ANumberOtherThan(pItem)
	
		def AnItemDifferentOf(pItem)
			return This.ANumberOtherThan(pItem)

		def AnItemDifferentTo(pItem)
			return This.ANumberOtherThan(pItem)

		def AnItemDifferentFrom(pItem)
			return This.ANumberOtherThan(pItem)
	
		#--
	
		def ItemOtherThan(pItem)
			return This.ANumberOtherThan(pItem)
	
		def ItemDifferentThan(pItem)
			return This.ANumberOtherThan(pItem)
	
		def ItemDifferentTo(pItem)
			return This.ANumberOtherThan(pItem)

		def ItemDifferentFrom(pItem)
			return This.ANumberOtherThan(pItem)
	
		#--
	
		def AnyItemOtherThan(pItem)
			return This.ANumberOtherThan(pItem)
	
		def AnyItemDifferentThan(pItem)
			return This.ANumberOtherThan(pItem)
	
		def AnyItemDifferentTo(pItem)
			return This.ANumberOtherThan(pItem)

		def AnyItemDifferentFrom(pItem)
			return This.ANumberOtherThan(pItem)
	
		#--

		def RandomItemOtherThan(pItem)
			return This.ANumberOtherThan(pItem)

		def ARandomItemOtherThan(pItem)
			return This.ANumberOtherThan(pItem, pCaseSensitive)

		#>

	  #---------------------------------------------------------------------------------#
	 #  GETTING AN ITEM FROM THE LIST OTHER THEN A GIVEN ITEM ALONG WITH ITS POSITION  #
	#---------------------------------------------------------------------------------#

	def AnItemOtherThanCSZ(pItem, pCaseSensitive)
		if isList(pItem)
			return This.AnyRandomItemOtherThanManyCSZ(pItem, pCaseSensitive)
		ok

		if NOT This.ContainsCS(pItem, pCaseSensitive)
			return This.AnyItemZ()

		else
			nPos = This.ToSetQ().FindFirstCS(pItem, pCaseSensitive)
			n = StzListOfNumbersQ( 1 : len(aSet) ).AnyNumberOtherThan(nPos)
			return [ This.Item(n), n ]
		ok
	

		#< @FunctionAlternativeForms
	
		def AnItemDifferentThanCSZ(pItem, pCaseSensitive)
			return This.AnItemOtherThanCSZ(pItem, pCaseSensitive)
	
		def AnItemDifferentOfCSZ(pItem, pCaseSensitive)
			return This.AnItemOtherThanCSZ(pItem, pCaseSensitive)

		def AnItemDifferentToCSZ(pItem, pCaseSensitive)
			return This.AnItemOtherThanCSZ(pItem, pCaseSensitive)

		def AnItemDifferentFromCSZ(pItem, pCaseSensitive)
			return This.AnItemOtherThanCSZ(pItem, pCaseSensitive)
	
		#--
	
		def ItemOtherThanCSZ(pItem, pCaseSensitive)
			return This.ANumberOtherThanCSZ(pItem, pCaseSensitive)
		
		def ItemDifferentToCSZ(pItem, pCaseSensitive)
			return This.ANumberOtherThanCSZ(pItem, pCaseSensitive)

		def ItemDifferentFromCSZ(pItem, pCaseSensitive)
			return This.ANumberOtherThanCSZ(pItem, pCaseSensitive)
	
		#--
	
		def AnyItemOtherThanCSZ(pItem, pCaseSensitive)
			return This.ANumberOtherThanCSZ(pItem, pCaseSensitive)
	
		def AnyItemDifferentThanCSZ(pItem, pCaseSensitive)
			return This.ANumberOtherThanCSZ(pcChar, pCaseSensitive)
	
		def AnyItemDifferentToCSZ(pItem, pCaseSensitive)
			return This.ANumberOtherThanCSZ(pItem, pCaseSensitive)

		def AnyItemDifferentFromCSZ(pItem, pCaseSensitive)
			return This.ANumberOtherThanCSZ(pItem, pCaseSensitive)
	
		#--

		def RandomItemOtherThanCSZ(pItem, pCaseSensitive)
			return This.ANumberOtherThanCSZ(pItem, pCaseSensitive)

		def ARandomItemOtherThanCSZ(pItem, pCaseSensitive)
			return This.ANumberOtherThanCSZ(pItem, pCaseSensitive)

		#>


	#-- WITHOUT CASESENSITIVITY

	def AnItemOtherThanZ(pItem)
		return This.AnItemOtherThanCSZ(pItem, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms
	
		def AnItemDifferentThanZ(pItem)
			return This.ANumberOtherThanZ(pItem)
	
		def AnItemDifferentOfZ(pItem)
			return This.ANumberOtherThanZ(pItem)

		def AnItemDifferentToZ(pItem)
			return This.ANumberOtherThanZ(pItem)

		def AnItemDifferentFromZ(pItem)
			return This.ANumberOtherThanZ(pItem)
	
		#--
	
		def ItemOtherThanZ(pItem)
			return This.ANumberOtherThanZ(pItem)
	
		def ItemDifferentThanZ(pItem)
			return This.ANumberOtherThanZ(pItem)
	
		def ItemDifferentToZ(pItem)
			return This.ANumberOtherThanZ(pItem)

		def ItemDifferentFromZ(pItem)
			return This.ANumberOtherThanZ(pItem)
	
		#--
	
		def AnyItemOtherThanZ(pItem)
			return This.ANumberOtherThanZ(pItem)
	
		def AnyItemDifferentThanZ(pItem)
			return This.ANumberOtherThanZ(pItem)
	
		def AnyItemDifferentToZ(pItem)
			return This.ANumberOtherThanZ(pItem)

		def AnyItemDifferentFromZ(pItem)
			return This.ANumberOtherThanZ(pItem)
	
		#--

		def RandomItemOtherThanZ(pItem)
			return This.ANumberOtherThanZ(pItem)

		def ARandomItemOtherThanZ(pItem)
			return This.ANumberOtherThanZ(pItem, pCaseSensitive)

		#>

	  #-------------------------------------------------------#
	 #  GETTING A EANDOM ITEM OTHER THAN THE ITEMS PROVIDED  #
	#-------------------------------------------------------#

	def AnyRandomItemOtherThanManyCS(paItems, pCaseSensitive)
		anPos = This.FindManyCS(paItems, pCaseSensitive)
		aResult = This.AnyItemsInPositionsOtherThan(anPos)

		return aResult

	#-- WITHOUT CASESENSITIVITY

	def AnyRandomItemOtherThanMany(paItems)
		return This.AnyRandomItemOtherThanManyCS(paItems, :CaseSensitive = TRUE)

	  #----------------------------------------------------------------------------------#
	 #  GETTING A EANDOM ITEM OTHER THAN THE ITEMS PROVIDED ALONG WITH THEIR POSITIONS  #
	#----------------------------------------------------------------------------------#

	def AnyRandomItemOtherThanManyCSZ(paItems, pCaseSensitive)
		anPos = This.FindManyCS(paItems, pCaseSensitive)
		aResult = [ This.AnyItemsInPositionsOtherThan(anPos), anPos ]

		return aResult

	#-- WITHOUT CASESENSITIVITY

	def AnyRandomItemOtherThanManyZ(paItems)
		return This.AnyRandomItemOtherThanManyCSZ(paItems, :CaseSensitive = TRUE)

	  #--------------------------------------------------#
	 #  GETTING N RANDOM ITEMS OTHER THAN A GIVEN ITEM  #
	#--------------------------------------------------#

	def NRandomItemsOtherThanCS(pItem, pCaseSensitive)
		anPos = ( Q(1 : This.NumberOfItems()) -
			  This.FindCS(pItem, pCaseSensitive) ).
			Content()

		anRandomPos = NRandomNumbersIn(anPos)
		aResult = This.ItemsAtPositions(anRandomPos)

		return aResult

		def NItemsOtherThanCS(pItem, pCaseSensitive)
			return This.NRandomItemsOtherThanCS(pItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def NRandomItemsOtherThanS(pItem)
		return This.NRandomItemsOtherThanCS(pItem, :CaseSensitive = TRUE)

		def NItemsOtherThan(pItem)
			return This.NRandomItemsOtherThan(pItem)

	  #----------------------------------------------------------------#
	 #  GETTING N RANDOM ITEMS OTHER THAN A GIVEN ITEM -- Z/EXTENDED  #
	#----------------------------------------------------------------#

	def NRandomItemsOtherThanCSZ(pItem)

		anPos = ( Q(1 : This.NumberOfItems()) -
			  This.FindCS(pItem, pCaseSensitive) ).
			Content()

		anRandomPos = NRandomNumbersIn(anPos)
		aResult = This.ItemsAtPositionsQ(anRandomPos).AssociatedWith(anRandomPos)

		return aResult

		def NItemsOtherThanCSZ(pItem, pCaseSensitive)
			return This.NRandomItemsOtherThanCSZ(pItem, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def NRandomItemsOtherThanZ(pItem)
		return This.NRandomItemsOtherThanCSZ(pItem, :CS = TRUE)

		def NItemsOtherThanZ(pItem)
			return This.NRandomItemsOtherThanZ(pItem)

	  #----------------------------------------------------------------#
	 #  GETTING N RANDOM ITEMS OTHER THAN A GIVEN ITEM -- U/EXTENDED  #
	#----------------------------------------------------------------#

	#TODO

	  #-----------------------------------------------------------------#
	 #  GETTING N RANDOM ITEMS OTHER THAN A GIVEN ITEM -- UZ/EXTENDED  #
	#-----------------------------------------------------------------#

	#TODO

	  #-----------------------------------------------------#
	 #  GETTING SOME RANDOM ITEMS OTHER THAN A GIVEN ITEM  #
	#-----------------------------------------------------#

	def SomeRandomItemsOtherThanCS(pItem)
		anPos = ( Q(1 : This.NumberOfItems()) -
			  This.FindCS(pItem, pCaseSensitive) ).
			Content()

		anRandomPos = SomeRandomNumbersIn(anPos)
		aResult = This.ItemsAtPositions(anRandomPos)

		return aResult

	  #-------------------------------------------------------------------#
	 #  GETTING SOME RANDOM ITEMS OTHER THAN A GIVEN ITEM -- Z/EXTENDED  #
	#-------------------------------------------------------------------#

	def SomeRandomItemsOtherThanCSZ(pItem, pCaseSensitive)
		anPos = ( Q(1 : This.NumberOfItems()) -
			  This.FindCS(pItem, pCaseSensitive) ).
			Content()

		anRandomPos = SomeRandomNumbersIn(anPos)
		aResult = This.ItemsAtPositionsQ(anRandomPos).AssociatedWith(anRandomPos)

		return aResult

	#-- WITHOUT CASESENSITIVITY

	def SomeRandomItemsOtherThanZ(pItem)
		return This.SomeRandomItemsOtherThanCSZ(pItem, :CS = TRUE)

	  #-------------------------------------------------------------------#
	 #  GETTING SOME RANDOM ITEMS OTHER THAN A GIVEN ITEM -- U/EXTENDED  #
	#-------------------------------------------------------------------#

	#TODO

	  #--------------------------------------------------------------------#
	 #  GETTING SOME RANDOM ITEMS OTHER THAN A GIVEN ITEM -- UZ/EXTENDED  #
	#--------------------------------------------------------------------#

	#TODO

	  #------------------------------------------------------#
	 #  GETTING N RANDOM ITEMS OTHER THAN MANY GIVEN ITEMS  #
	#------------------------------------------------------#

	def NRandomItemsOtherThanManyCS(paItems, pCaseSensitive)
		#TODO
		StzRaise("Unsupported feature yet!")

	#-- WITHOUT CASESENSITIVITY

	def NRandomItemsOtherThanMany(paItems)
		return This.NRandomItemsOtherThanManyCS(paItems, :CS = TRUE)

	  #---------------------------------------------------------------------#
	 #  GETTING N RANDOM ITEMS OTHER THAN MANY GIVEN ITEMS  -- Z/EXTENDED  #
	#---------------------------------------------------------------------#

	def NRandomItemsOtherThanManyCSZ(pItem, pCaseSensitive)
		#TODO
		StzRaise("Unsupported feature yet!")

	#-- WITHOUT CASESENSITIVITY

	def NRandomItemsOtherThanManyZ(pItem)
		return This.NRandomItemsOtherThanManyCSZ(pItem, :CS = TRUE)

	#-- U/EXTENDED FORM

	#TODO

	#-- UZ/EXTENDED FORM

	#TODO

	  #-----------------------------------------------------------#
	 #  GETTING SOME RANDOM ITEMS OTHER THAN A MANY GIVEN ITEMS  #
	#-----------------------------------------------------------#

	def SomeRandomItemsOtherThanManyCS(pItem)
		# TODO
		StzRaise("Unsupported feature yet!")

	#-- Z/EXTENDED FORM

	def SomeRandomItemsOtherThanManyCSZ(pItem)
		# TODO
		StzRaise("Unsupported feature yet!")

	#-- U/EXTENDED FORM

	#TODO

	#-- UZ/EXTENDED FORM

	#TODO

	  #--------------------------------------------------------#
	 #  GETTING AN ITEM BETWEEN TWO OTHER ITEMS OR POSITIONS  #
	#========================================================#

	def AnItemBetweenCS(pMin, pMax, pCaseSensitive) # InSection
		# TODO
		StzRaise("Unsupported feature yet!")

	#-- Z/EXTENDED FORM

	def AnItemBetweenCSZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	#-- IB/EXTENDED FORM

	def AnItemBetweenCSIB(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	#-- IBZ/EXTENDED FORM

	def AnItemBetweenCSIBZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #------------------------------------------------------------#
	 #  GETTING AN ITEM NOT BETWEEN TWO OTHER ITEMS OR POSITIONS  #
	#------------------------------------------------------------#

	def AnItemNotBetweenCS(pMin, pMax, pCaseSensitive) # OutsideInSection
		# TODO
		StzRaise("Unsupported feature yet!")

	def AnItemNotBetweenCSZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	#---------------

	def AnItemNotBetweenCSIB(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	def AnItemNotBetweenCSIBZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #---------------------------------------------#
	 #  GETTING AN ITEM INSIDE THE GIVEN SECTIONS  #
	#=============================================#

	def AnItemBetweenManyCS(pMin, pMax, pCaseSensitive) # InSections
		# TODO
		StzRaise("Unsupported feature yet!")

	def AnItemBetweenManyCSZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	#---------------

	def AnItemBetweenManyCSIB(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	def AnItemBetweenManyCSIBZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #----------------------------------------------#
	 #  GETTING AN ITEM OUTSIDE THE GIVEN SECTIONS  #
	#----------------------------------------------#

	def AnItemNotBetweenManyCS(pMin, pMax, pCaseSensitive) # OutsideSections
		# TODO
		StzRaise("Unsupported feature yet!")

	def AnItemNotBetweenManyCSZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	#---------------

	def AnItemNotBetweenManyCSIB(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	def AnItemNotBetweenManyCSIBZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #--------------------------------------------------------#
	 #  GETTING N ITEMS BETWEEN TWO OTHER ITEMS OR POSITIONS  #
	#========================================================#

	def NItemsBetweenCS(pMin, pMax, pCaseSensitive) # InSection
		# TODO
		StzRaise("Unsupported feature yet!")

	def NItemsBetweenCSZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	#---------------

	def NItemsBetweenCSIB(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	def NItemsBetweenCSIBZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #-----------------------------------------------------------#
	 #  GETTING SOME ITEMS BETWEEN TWO OTHER ITEMS OR POSITIONS  #
	#-----------------------------------------------------------#

	def SomeItemsBetweenCS(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	def SomeItemsBetweenCSZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	#---------------

	def SomeItemsBetweenCSIB(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	def SomeItemsBetweenCSIBZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #------------------------------------------------------------#
	 #  GETTING N ITEMS NOT BETWEEN TWO OTHER ITEMS OR POSITIONS  #
	#------------------------------------------------------------#

	def NItemsNotBetweenCS(pMin, pMax, pCaseSensitive) # OutsideSection
		# TODO
		StzRaise("Unsupported feature yet!")

	def NItemsNotBetweenCSZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	#---------------

	def NItemsNotBetweenCSIB(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	def NItemsNotBetweenCSIBZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #---------------------------------------------------------------#
	 #  GETTING SOME ITEMS NOT BETWEEN TWO OTHER ITEMS OR POSITIONS  #
	#---------------------------------------------------------------#

	def SomeItemsNotBetweenCS(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	def SomeItemsNotBetweenCSZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	#---------------

	def SomeItemsNotBetweenCSIB(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	def SomeItemsNotBetweenCSIBZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #---------------------------------------------#
	 #  GETTING N ITEMS INSIDE THE GIVEN SECTIONS  #
	#=============================================#

	def NItemsBetweenManyCS(pMin, pMax, pCaseSensitive) # InSections
		# TODO
		StzRaise("Unsupported feature yet!")

	def NItemsBetweenManyCSZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	#---------------

	def NItemsBetweenManyCSIB(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	def NItemsBetweenManyCSIBZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #------------------------------------------------#
	 #  GETTING SOME ITEMS INSIDE THE GIVEN SECTIONS  #
	#------------------------------------------------#

	def SomeItemsBetweenManyCS(pMin, pMax, pCaseSensitive) # InSections
		# TODO
		StzRaise("Unsupported feature yet!")

	def SomeItemsBetweenManyCSZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	#---------------

	def SomeItemsBetweenManyCSIB(pMin, pMax, pCaseSensitivity)
		# TODO
		StzRaise("Unsupported feature yet!")

	def SomeItemsBetweenManyCSIBZ(pMin, pMax, pCaseSensitivity)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #----------------------------------------------#
	 #  GETTING N ITEMS OUTSIDE THE GIVEN SECTIONS  #
	#----------------------------------------------#

	def NItemsNotBetweenManyCS(pMin, pMax, pCaseSensitive) # NotInSections
		# TODO
		StzRaise("Unsupported feature yet!")

	def NItemsNotBetweenManyCSZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	#---------------

	def NItemsNotBetweenManyCSIB(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	def NItemsNotBetweenManyCSIBZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #-------------------------------------------------#
	 #  GETTING SOME ITEMS OUTSIDE THE GIVEN SECTIONS  #
	#-------------------------------------------------#

	def SomeItemsNotBetweenManyCS(pMin, pMax, pCaseSensitive) # NotInSections
		# TODO
		StzRaise("Unsupported feature yet!")

	def SomeItemsNotBetweenManyCSZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	#---------------

	def SomeItemsNotBetweenManyCSIB(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	def SomeItemsNotBetweenManyCSIBZ(pMin, pMax, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #-------------------------------------------#
	 #  GETTING AN ITEM NOT IN A GIVEN POSITION  #
	#===========================================#

	def AnItemOutsidePosition(nPos)
		# TODO
		StzRaise("Unsupported feature yet!")

	def AnItemOutsidePositionZ(nPos)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #---------------------------------------------#
	 #  GETTING AN ITEM NOT BETWEEN TWO POSITIONS  #
	#---------------------------------------------#

	def AnItemOutsidePositions(panPos)
		# TODO
		StzRaise("Unsupported feature yet!")

	def AnItemOutsidePositionsZ(panPos)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #---------------------------------------------#
	 #  GETTING N ITEMS NOT IN THE GIVEN POSITION  #
	#=============================================#

	def NItemsOutsidePosition(nPos)
		# TODO
		StzRaise("Unsupported feature yet!")

	def NItemsOutsidePositionZ(anPos)
		# TODO
		StzRaise("Unsupported feature yet!")

  	  #------------------------------------------------#
	 #  GETTING SOME ITEMS NOT IN THE GIVEN POSITION  #
	#------------------------------------------------#

	def SomeItemsOutsidePosition(anPos)
		# TODO
		StzRaise("Unsupported feature yet!")

	def SomeItemsOutsidePositionZ(anPos)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #----------------------------------------------#
	 #  GETTING N ITEMS NOT IN THE GIVEN POSITIONS  #
	#----------------------------------------------#

	def NItemsOutsidePositions(panPos, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	def NItemsOutsidePositionsZ(panPos, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

	  #-------------------------------------------------#
	 #  GETTING SOME ITEMS NOT IN THE GIVEN POSITIONS  #
	#-------------------------------------------------#

	def SomeItemsOutsidePositions(panPos, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

		def SomeItemsInPositionsOtherThan(panPos, pCaseSensitive)
			return This.SomeItemsOutsidePositions(panPos, pCaseSensitive)

	def SomeItemsOutsidePositionsZ(panPos, pCaseSensitive)
		# TODO
		StzRaise("Unsupported feature yet!")

		def SomeItemsInPositionsOtherThanZ(panPos, pCaseSensitive)
			return This.SomeItemsOutsidePositionsZ(panPos, pCaseSensitive)

	  #--------------------------------------------------------#
	 #  GETTING A RANDOM ITEM AFTER A GIVEN ITEM OR POSITION  #
	#--------------------------------------------------------#

	def AnyItemAfter(p) #TODO

	def AnytemAfterZ(p) #TODO

	  #------------------------------------------------#
	 #  GETTING A RANDOM ITEM AFTER A GIVEN POSITION  #
	#------------------------------------------------#

	def AnytemAfterPosition(n) #TODO

	def AnyItemAfterPositionZ(n) #TODO

	  #---------------------------------------------------------#
	 #  GETTING A RANDOM ITEM BEFORE A GIVEN ITEM OR POSITION  #
	#---------------------------------------------------------#

	def AnyItemBefore(p) #TODO

	def AnyItemBeforeZ(n) #TODO

	  #-------------------------------------------------#
	 #  GETTING A RANDOM ITEM BEFORE A GIVEN POSITION  #
	#-------------------------------------------------#

	def AnyItemBeforeOrAfter(n) #TODO

	def AnyItemBeforeOrAfterZ(n) #TODO

	  #-----------------------------------------------------#
	 #  GETTING SOME RANDOM ITEMS BEFORE A GIVEN POSITION  #
	#-----------------------------------------------------#

	def AnyItemsBeforePosition(n) #TODO

	def AnyItemBeforePositionZ(n) #TODO

	  #----------------------------------------------------#
	 #  GETTING SOME RANDOM ITEMS AFTER A GIVEN POSITION  #
	#----------------------------------------------------#

	def AnyItemsAfterPosition(n) #TODO

	def AnyItemsAfterPositionZ(n) #TODO

	  #---------------------------------------------------#
	 #  GETTING SOME RANDOM BETWEEN TWO GIVEN POSITIONS  #
	#---------------------------------------------------#

	def AnyItemBetweenPositions(n1, n2) #TODO

	def AnyItemBetweenPositionsZ(n1, n2) #TODO

	  #------------------------------------------------#
	 #  RANDOMINZING THE ITEMS POSITIONS IN THE LIST  #
	#================================================#

	def Randomize()
		anPos = NRandomNumbersBetween(1, This.NumberOfItems())
		This.UpdateWith( This.ItemsAtPositions(anPos) )

		#< @FunctionFluentForm

		def RandomizeQ()
			This.Randomize()
			return This

		#>

		#< @FunctionAlternativeForms

		def RandomizePositions()
			This.Randomise()

			def RandomizePositonsQ()
				This.RandomizePositions()
				return This

		#--

		def Randomise()
			This.Randomize()

			def RandomiseQ()
				This.Randomise()
				return This

		def RandomisePositions()
			This.Randomize()

			def RandomisePositionsQ()
				This.RandomisePositions()
				return This

		#>

	def Randomized()
		aResult = This.Copy().RandomizeQ().Content()
		return aResult

		def Randomised()

	  #---------------------------------------------------------------------#
	 #  RANDOMINZING THE ITEMS POSITIONS IN THE GIVEN SECTION OF THE LIST  #
	#---------------------------------------------------------------------#

	def RandomizeSection(n1, n2)
		anPos = NRandomNumbersBetween(n1, n2)
		This.UpdateWith( This.ItemsAtPositions(anPos) )

		#< @FunctionFluentForm

		def RandomizeSectionQ(n1, n2)
			This.RandomizeSection(n1, n2)
			return This

		#>

		#< @FunctionAlternativeForms

		def RandomizePositionsInSection(n1, n2)
			This.RandomiseSection(n1, n2)

			def RandomizePositionsInSectionQ(n1, n2)
				This.RandomizePositionsInSection(n1, n2)
				return This

		#--

		def RandomiseSection(n1, n2)
			This.RandomizeSection(n1, n2)

			def RandomiseSectionQ(n1, n2)
				This.RandomiseSection(n1, n2)
				return This

		def RandomisePositionsInSection(n1, n2)
			This.RandomizeSection(n1, n2)

			def RandomisePositionsInSectionQ(n1, n2)
				This.RandomisePositionsInSection(n1, n2)
				return This

		#>

	def SectionRandomized(n1, n2)
		aResult = This.Copy().RandomizeSectionQ(n1, n2).Content()
		return aResult

		#< @FunctionAlternativeForms

		def PositionsInSectionRandomized(n1, n2)
			return This.SectionRandomized(n1, n2)

		#--

		def SectionRandomised(n1, n2)
			return This.SectionRandomized(n1, n2)

		def PositionsInSectionRandomised(n1, n2)
			return This.SectionRandomized(n1, n2)

		#>

	  #----------------------------------------------------------------------#
	 #  RANDOMINZING THE ITEMS POSITIONS IN THE GIVEN SECTIONS OF THE LIST  #
	#----------------------------------------------------------------------#

	def RandomizeSections(panSections)
		if CheckParams() = TRUE # Generalise this all over the library
			if NOT isList(panSections) and Q(panSections).IsListOfPairsOfNumbers()
				StzRaise("Incorrect param type! panSections must be a list of pairs of numbers.")
			ok
		ok

		nLen = len(panSections)

		for i = 1 to nLen
			This.RandomizeSection(panSections[i][1], panSections[i][2])
		next

		#< @FunctionFluentForm

		def RandomizeSectionsQ(panSections)
			This.RandomizeSections(panSections)
			return This

		#>

		#< @FunctionAlternativeForms

		def RandomizePositionsInSections(panSections)
			This.RandomiseSections(panSections)

			def RandomizePositionsInSectionsQ(panSections)
				This.RandomizePositionsInSections(panSections)
				return This

		#--

		def RandomiseSections(panSections)
			This.RandomizeSections(panSections)

			def RandomiseSectionsQ(panSections)
				This.RandomiseSections(panSections)
				return This

		def RandomisePositionsInSections(panSections)
			This.RandomizeSections(panSections)

			def RandomisePositionsInSectionsQ(panSections)
				This.RandomisePositionsInSections(panSections)
				return This

		#>

	def SectionsRandomized(panSections)
		aResult = This.Copy().RandomizeSectionsQ(n1, n2).Content()
		return aResult

		#< @FunctionAlternativeForms

		def PositionsInSectionsRandomized(n1, n2)
			return This.SectionsRandomized(n1, n2)

		#--

		def SectionsRandomised(n1, n2)
			return This.SectionsRandomized(n1, n2)

		def PositionsInSectionsRandomised(n1, n2)
			return This.SectionsRandomized(n1, n2)

		#>

	  #-------------------------------------------------------------------#
	 #  RANDOMINZING THE ITEMS POSITIONS BETWEEN TWO POSITIONS OR ITEMS  #
	#-------------------------------------------------------------------#

	def RandomizeBetweenCS(p1, p2, pCaseSensitive)
		if isList(p1) and Q(p1).IsPositionOrPositionsNamedParam()
			p1 = p1[2]

			This.RandomizeBetweenPositions(p1, p2) # Or RandomizSection
		ok

		n1 = This.FindFirstCS(p1, pCaseSensitive)
		n2 = This.FindLastCS(p2, pCaseSensitive)

		This.RandomizeSection(n1, n2)


		#< @FunctionFluentForm

		def RandomizeBetweenCSQ(p1, p2, pCaseSensitive)
			This.RandomizeBetweenCS(p1, p2, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForms

		def RandomiseBetweenCS(p1, p2, pCaseSensitive)
			This.RandomizeBetweenCS(p1, p2, pCaseSensitive)

			def RandomiseBetweenCSQ(p1, p2, pCaseSensitive)
				This.RandomiseBetweenCSQ(p1, p2, pCaseSensitive)
				return This

		#--

		def RandomizePositionsBetweenCS(p1, p2, pCaseSensitive)
			This.RandomizeBetweenCS(p1, p2, pCaseSensitive)

			def RandomizePositionsBetweenCSQ(p1, p2, pCaseSensitive)
				This.RandomizePositionsBetweenCSQ(p1, p2, pCaseSensitive)
				return This

		def RandomisePositionsBetweenCS(p1, p2, pCaseSensitive)
			This.RandomizeBetweenCS(p1, p2, pCaseSensitive)

			def RandomisePositionsBetweenCSQ(p1, p2, pCaseSensitive)
				This.RandomisePositionsBetweenCSQ(p1, p2, pCaseSensitive)
				return This

		#>

	def RandomizedBetweenCS(p1, p2, pCaseSensitive)
		aResult = This.RandomizeBetweenCSQ(p1, p2, pCaseSensitive).Content()
		return This

		def RanomisedBetweenCS(p1, p2, pCaseSensitive)
			return This.RandomizedBetweenCS(p1, p2, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RandomizeBetween(p1, p2)
		This.RandomizeBetweenCS(p1, p2, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RandomizeBetweenQ(p1, p2)
			This.RandomizeBetween(p1, p2)
			return This

		#>

		#< @FunctionAlternativeForms

		def RandomiseBetween(p1, p2)
			This.RandomizeBetween(p1, p2)

			def RandomiseBetweenQ(p1, p2)
				This.RandomiseBetweenQ(p1, p2)
				return This

		#--

		def RandomizePositionsBetween(p1, p2)
			This.RandomizeBetween(p1, p2)

			def RandomizePositionsBetweenQ(p1, p2)
				This.RandomizePositionsBetweenQ(p1, p2)
				return This

		def RandomisePositionsBetween(p1, p2)
			This.RandomizeBetween(p1, p2)

			def RandomisePositionsBetweenQ(p1, p2)
				This.RandomisePositionsBetweenQ(p1, p2)
				return This

		#>

	def RandomizedBetween(p1, p2)
		aResult = This.RandomizeBetweenQ(p1, p2).Content()
		return This

		def RanomisedBetween(p1, p2)
			return This.RandomizedBetween(p1, p2)

	  #-------------------------------------------------------------#
	 #  RANDOMIZING ITEMS POSITIONS BETWEEN TWO ITEMS IN THE LIST  #
	#-------------------------------------------------------------#

	def RandomizeBetweenItemsCS(p1, p2, pCaseSensitive)
		n1 = This.FindFirstCS(p1, pCaseSensitive)
		n2 = This.FindLastCS(p2, pCaseSensitive)

		This.RandomizeSection(n1, n2)
	
		#< @FunctionFluentForm

		def RandomizeBetweenItemsCSQ(p1, p2, pCaseSensitive)
			This.RandomizeBetweenItemsCS(p1, p2, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForm

		def RandomiseBetweenItemsCS(p1, p2, pCaseSensitive)
			This.RandomizeBetweenItemsCS(p1, p2, pCaseSensitive)

			def RandomiseBetweenItemsCSQ(p1, p2, pCaseSensitive)
				This.RandomiseBetweenItemsCS(p1, p2, pCaseSensitive)
				return This

		#>

	#-- WITHOUT CASESENSITIVITY

	def RandomizeBetweenItems(p1, p2)
		This.RandomizeBetweenItemsCS(p1, p2, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RandomizeBetweenItemsQ(p1, p2)
			This.RandomizeBetweenItems(p1, p2)
			return This

		#>

		#< @FunctionAlternativeForm

		def RandomiseBetweenItems(p1, p2)
			This.RandomizeBetweenItems(p1, p2)

			def RandomiseBetweenItemsQ(p1, p2)
				This.RandomiseBetweenItems(p1, p2)
				return This

		#>

	  #-----------------------------------------------------------------------#
	 #  RANDOMINZING THE ITEMS POSITIONS NOT BETWEEN TWO POSITIONS OR ITEMS  #
	#-----------------------------------------------------------------------#

	def RandomizeNotBetweenCS(p1, p2, pCaseSensitive)
		if isList(p1) and Q(p1).IsPositionOrPositionsNamedParam()
			p1 = p1[2]

			This.RandomizeNotBetweenPositions(p1, p2) # Or RandomizSection
		ok

		n1 = This.FindFirstCS(p1, pCaseSensitive)
		n2 = This.FindLastCS(p2, pCaseSensitive)

		This.RandomizeSection(n1, n2)


		#< @FunctionFluentForm

		def RandomizeNotBetweenCSQ(p1, p2, pCaseSensitive)
			This.RandomizeNotBetweenCS(p1, p2, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForms

		def RandomiseNotBetweenCS(p1, p2, pCaseSensitive)
			This.RandomizeNotBetweenCS(p1, p2, pCaseSensitive)

			def RandomiseNotBetweenCSQ(p1, p2, pCaseSensitive)
				This.RandomiseNotBetweenCSQ(p1, p2, pCaseSensitive)
				return This

		#--

		def RandomizePositionsNotBetweenCS(p1, p2, pCaseSensitive)
			This.RandomizeNotBetweenCS(p1, p2, pCaseSensitive)

			def RandomizePositionsNotBetweenCSQ(p1, p2, pCaseSensitive)
				This.RandomizePositionsNotBetweenCSQ(p1, p2, pCaseSensitive)
				return This

		def RandomisePositionsNotBetweenCS(p1, p2, pCaseSensitive)
			This.RandomizeNotBetweenCS(p1, p2, pCaseSensitive)

			def RandomisePositionsNotBetweenCSQ(p1, p2, pCaseSensitive)
				This.RandomisePositionsNotBetweenCSQ(p1, p2, pCaseSensitive)
				return This

		#>

	def RandomizedNotBetweenCS(p1, p2, pCaseSensitive)
		aResult = This.RandomizeNotBetweenCSQ(p1, p2, pCaseSensitive).Content()
		return This

		def RanomisedNotBetweenCS(p1, p2, pCaseSensitive)
			return This.RandomizedNotBetweenCS(p1, p2, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RandomizeNotBetween(p1, p2)
		This.RandomizeNotBetweenCS(p1, p2, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RandomizeNotBetweenQ(p1, p2)
			This.RandomizeNotBetween(p1, p2)
			return This

		#>

		#< @FunctionAlternativeForms

		def RandomiseNotBetween(p1, p2)
			This.RandomizeNotBetween(p1, p2)

			def RandomiseNotBetweenQ(p1, p2)
				This.RandomiseNotBetweenQ(p1, p2)
				return This

		#--

		def RandomizePositionsNotBetween(p1, p2)
			This.RandomizeNotBetween(p1, p2)

			def RandomizePositionsNotBetweenQ(p1, p2)
				This.RandomizePositionsNotBetweenQ(p1, p2)
				return This

		def RandomisePositionsNotBetween(p1, p2)
			This.RandomizeNotBetween(p1, p2)

			def RandomisePositionsNotBetweenQ(p1, p2)
				This.RandomisePositionsNotBetweenQ(p1, p2)
				return This

		#>

	def RandomizedNotBetween(p1, p2)
		aResult = This.RandomizeNotBetweenQ(p1, p2).Content()
		return This

		def RanomisedNotBetween(p1, p2)
			return This.RandomizedNotBetween(p1, p2)

	  #-----------------------------------------------------------------#
	 #  RANDOMIZING ITEMS POSITIONS NOT BETWEEN TWO ITEMS IN THE LIST  #
	#-----------------------------------------------------------------#

	def RandomizeNotBetweenItemsCS(p1, p2, pCaseSensitive)
		n1 = This.FindFirstCS(p1, pCaseSensitive)
		n2 = This.FindLastCS(p2, pCaseSensitive)

		This.RandomizeAntiSection(n1, n2)
	
		#< @FunctionFluentForm

		def RandomizeNotBetweenItemsCSQ(p1, p2, pCaseSensitive)
			This.RandomizeNotBetweenItemsCS(p1, p2, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForm

		def RandomiseNotBetweenItemsCS(p1, p2, pCaseSensitive)
			This.RandomizeNotBetweenItemsCS(p1, p2, pCaseSensitive)

			def RandomiseNotBetweenItemsCSQ(p1, p2, pCaseSensitive)
				This.RandomiseNotBetweenItemsCS(p1, p2, pCaseSensitive)
				return This

		#>

	#-- WITHOUT CASESENSITIVITY

	def RandomizeNotBetweenItems(p1, p2)
		This.RandomizeNotBetweenItemsCS(p1, p2, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RandomizeNotBetweenItemsQ(p1, p2)
			This.RandomizeNotBetweenItems(p1, p2)
			return This

		#>

		#< @FunctionAlternativeForm

		def RandomiseNotBetweenItems(p1, p2)
			This.RandomizeNotBetweenItems(p1, p2)

			def RandomiseNotBetweenItemsQ(p1, p2)
				This.RandomiseNotBetweenItems(p1, p2)
				return This

		#>

	  #------------------------------------------------------------#
	 #  RANDOMIZING POSITIONS OF ITEMS OUTSIDE THE GIVEN SECTION  #
	#------------------------------------------------------------#

	def RandomizeAntiSection(n1, n2)
		anSections = This.FindAntiSections([ [n1, n2] ]) # Or maybe AntiSectionsAsSections()
		This.RandomizeSections(anSections)

		#< @FunctionFluentForm

		def RandomizeAntiSectionQ(n1, n2)
			This.RandomizeAntiSection(n1, n2)
			return This

		#>

		#< @FunctionAlternativeForms

		def RandomizeOutsideSection(n1, n2)
			This.RandomizeAntiSection(n1, n2)
	
			def RandomizeOutsideSectionQ(n1, n2)
				This.RandomizeOutsideSection(n1, n2)
				return This

		#--

		def RandomiseAntiSection(n1, n2)
			This.RandomizeAntiSection(n1, n2)

			def RandomiseAntiSectionQ(n1, n2)
				This.RandomiseAntiSection(n1, n2)
				return This

		def RandomiseOutsideSection(n1, n2)
			This.RandomizeAntiSection(n1, n2)
	
			def RandomiseOutsideSectionQ(n1, n2)
				This.RandomizeOutsideSection(n1, n2)
				return This

		#>

	def AntiSectionRandomized(n1, n2)
		aResult = This.Copy().RandomizeAntiSectionQ(n1, n2).Content()
		return aResult

		#< @FunctionAlternativeForms

		def OutsideSectionRandomized(n1, n2)
			return This.AntiSectionRandomized(n1, n2)

		#--

		def AntiSectionRandomised(n1, n2)
			return This.AntiSectionRandomized(n1, n2)

		def OutsideSectionRandomised(n1, n2)
			return This.AntiSectionRandomized(n1, n2)

		#>

	  #-------------------------------------------------------------#
	 #  RANDOMIZING POSITIONS OF ITEMS OUTSIDE THE GIVEN SECTIONS  #
	#-------------------------------------------------------------#

	def RandomizeAntiSections(panSections)
		anSections = This.FindAntiSections(panSections) # Or maybe AntiSectionsAsSections()
		This.RandomizeSections(anSections)

		#< @FunctionFluentForm

		def RandomizeAntiSectionsQ(panSections)
			This.RandomizeAntiSections(panSections)
			return This

		#>

		#< @FunctionAlternativeForms

		def RandomizeOutsideSections(panSections)
			This.RandomizeAntiSections(panSections)
	
			def RandomizeOutsideSectionsQ(panSections)
				This.RandomizeOutsideSections(panSections)
				return This

		#--

		def RandomiseAntiSections(panSections)
			This.RandomizeAntiSections(panSections)

			def RandomiseAntiSectionsQ(panSections)
				This.RandomiseAntiSections(panSections)
				return This

		def RandomiseOutsideSections(panSections)
			This.RandomizeAntiSections(panSections)
	
			def RandomiseOutsideSectionsQ(panSections)
				This.RandomizeOutsideSections(panSections)
				return This

		#>

	def AntiSectionsRandomized(panSections)
		aResult = This.Copy().RandomizeAntiSectionsQ(panSections).Content()
		return aResult

		#< @FunctionAlternativeForms

		def OutsideSectionsRandomized(panSections)
			return This.AntiSectionsRandomized(panSections)

		#--

		def AntiSectionsRandomised(panSections)
			return This.AntiSectionsRandomized(panSections)

		def OutsideSectionsRandomised(panSections)
			return This.AntiSectionsRandomized(panSections)

		#>

	  #=========#
	 #  WHERE  #
	#=========#

	def Where(pcCondition)
		/* EXAMPLE

		o1 = new stzList([ :StartingAt, 5 ])
		? o1.IsAPairQ().Where('{ isString(@pair[1]) and isNumber(@pair[2]) }')
		#--> TRUE

		o1 = new stzList([ "ONE", "TWO", "THREE" ])
		? o1.IsAPairQ().Where('{ Q(@Pair).AllItemsAre([ :Uppercase, :Strings ]) }')
		#--> FALSE

		*/

		if NOT isString(pcCondition)
			StzRaise("Incorrect param type! pcCondition must be a string.")
		ok

		cCondition = Q(pcCondition).
				TrimQ().
				RemoveTheseBoundsQ("{","}").
				ReplaceManyCSQ([ "@list", "@pair" ], "This", :CS = FALSE).
				Content()

		cCode = 'bOk = (' + cCondition + ')'

		eval(cCode)
		return bOk

	  #-----------------------------------------#
	 #  GETTING THE LIST OF CHARS IN THE LIST  #
	#-----------------------------------------#

	def Chars()
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen
			item = aContent[i]
			if isString(item) and StzStringQ(item).IsChar()
				aResult + item
			ok
		next

		return aResult

	def NumberOfChars()
		return len(This.Chars())

	  #-------------------------------------------#
	 #  GETTING THE LIST OF LETTERS IN THE LIST  #
	#-------------------------------------------#

	def Letters()
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen
			item = aContent[i]
			if isString(item) and Q(item).IsLetter()
				aResult + item
			ok
		next

		return aResult

	def NumberOfLetters()
		return len(This.Letters())

	  #=========================================#
	 #  GETTING THE LIST OF PAIRS IN THE LIST  # TODO: Add case sensitivity
	#=========================================#

	def ContainsPairs()
		aContent = This.Content()
		nLen = len(aContent)

		bResult = FALSE

		for i = 1 to nLen
			item = aContent[i]
			if isList(item) and Q(item).IsPair()
				bResult = TRUE
				exit
			ok
		next

		return bResult

	def NumberOfPairs()
		return len(This.Pairs())

	def FindPairs()
		aContent = This.Content()
		nLen = len(aContent)

		anResult = []

		for i = 1 to nLen
			item = aContent[i]
			if isList(item) and Q(item).IsPair()
				anResult + i
			ok
		next

		return anResult

	def Pairs()
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen
			item = aContent[i]
			if isList(item) and Q(item).IsPair()
				aResult + item
			ok
		next

		return aResult

	def PairsU()
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []
		acSeen = []

		for i = 1 to nLen

			item = aContent[i]

			if NOT (isList(item) and Q(item).IsPair())
				loop
			ok

			cItem = @@(item)

			if ring_find(acSeen, cItem) = 0
				aResult + item
				acSeen + cItem
			ok
	
		next

		return aResult

	def PairsZ()
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []
		acSeen = []

		for i = 1 to nLen

			item = acontent[i]

			if NOT (isList(item) and Q(item).IsPair())
				loop
			ok

			if ring_find(acSeen, @@(item)) = 0
				anPos = This.Find(aContent[i])
				aResult + [ item, anPos ]
				acSeen + @@(item)
			ok
	
		next

		return aResult

	  #--------------------------------------------------------#
	 #  PAIRIFYING THE LIST BY TRANFORMING EACH ITEM TO PAIR  #
	#--------------------------------------------------------#

	def Pairify()
		
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen

			aPair = []

			if isList(aContent[i])

				nLenTemp = len(aContent[i])
				if nLenTemp = 0
					aPair + NULL + NULL

				but nLenTemp = 1
					aPair + aContent[i][1] + NULL

				but nLenTemp = 2
					aPair = aContent[i]

				else
					aPair + aContent[i][1] + aContent[i][2]
				ok
			
			else
				aPair + aContent[i] + NULL
			ok

			aResult + aPair
		next

		This.UpdateWith(aResult)

		def PairifyQ()
			This.Pairify()
			return This

	def Pairified()
		aResult = This.Copy().PairifyQ().Content()
		return aResult

	  #===========================================#
	 #  GETTING THE LIST OF SINGLES IN THE LIST  # TODO: Add case sensitivity
	#===========================================#

	def ContainsSingles()
		aContent = This.Content()
		nLen = len(aContent)

		bResult = FALSE

		for i = 1 to nLen
			item = aContent[i]
			if isList(item) and Q(item).IsSingle()
				bResult = TRUE
				exit
			ok
		next

		return bResult

	def NumberOfSingles()
		return len(This.Singles())

		def HowManySingles()
			return This.NumberOfSingles()

		def HowManySingle()
			return This.NumberOfSingles()

	def FindSingles()
		aContent = This.Content()
		nLen = len(aContent)

		anResult = []

		for i = 1 to nLen
			item = aContent[i]
			if isList(item) and Q(item).IsSingle()
				anResult + i
			ok
		next

		return anResult

	def Singles()
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen
			item = aContent[i]
			if isList(item) and Q(item).IsSingle()
				aResult + item
			ok
		next

		return aResult

	def SinglesU()
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []
		acSeen = []

		for i = 1 to nLen

			item = aContent[i]

			if NOT (isList(item) and Q(item).IsSingle())
				loop
			ok

			cItem = @@(item)

			if ring_find(acSeen, cItem) = 0
				aResult + item
				acSeen + cItem
			ok
	
		next

		return aResult

	def SinglesZ()
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []
		acSeen = []

		for i = 1 to nLen

			item = acontent[i]

			if NOT (isList(item) and Q(item).IsSingle())
				loop
			ok

			if ring_find(acSeen, @@(item)) = 0
				anPos = This.Find(aContent[i])
				aResult + [ item, anPos ]
				acSeen + @@(item)
			ok
	
		next

		return aResult

	  #-----------------------------------------------------------#
	 #  SINGLIFYING THE LIST BY TRANFORMING EACH ITEM TO SINGLE  #
	#-----------------------------------------------------------#

	def Singlify()
		
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen

			aSingle = []

			if isList(aContent[i])

				nLenTemp = len(aContent[i])
				if nLenTemp = 0
					aSingle + NULL

				else
					aSingle + aContent[i][1]
				ok
			
			else
				aSingle + aContent[i]
			ok

			aResult + aSingle
		next

		This.UpdateWith(aResult)

		def SinglifyQ()
			This.Singlify()
			return This

	def Singlified()
		aResult = This.Copy().SinglifyQ().Content()
		return aResult

	  #========================================================#
	 #  LISTIFYING THE LIST BY TRANFORMING EACH ITEM TO LIST  #
	#========================================================#

	def Listify()
		
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen

			aList = []

			if isList(aContent[i])
				aList = aContent[i]

			else
				aList + aContent[i]
			ok

			aResult + aList
		next

		This.UpdateWith(aResult)
			 
		def ListifyQ()
			This.Listify()
			return This

	def Listified()
		aResult = This.Copy().ListifyQ().Content()
		return aResult

	  #-------------------------------------------------------------#
	 #  LISTIYING THE ITEMS OF THE LIST BY SIZING THEM TO N ITEMS  #
	#-------------------------------------------------------------#

	def NListify(n)
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen

			aList = []

			if NOT isList(aContent[i])
				aList + aContent[i]
				if n > 1
					for j = 1 to n-1
						aList + NULL
					next
				ok
			else

				nLenList = len(aContent[i])

				if n = nLenList
					aList = aContent[i]

				but n > nLenList
					aList = aContent[i]
					for j = 1 to n - nLenList
						aList + NULL
					next

				but n < nLenList
					for j = 1 to n
						aList + aContent[i][j]
					next
				ok
						
			ok

			aResult + aList
		next

		This.UpdateWith(aResult)

		#< @FunctionFluentForm

		def NListifyQ(n)
			This.NListify(n)
			return This

		#>

	def NListified(n)
		aResult = This.Copy().NListifyQ(n).Content()
		return aResult
	  #============================================================#
	 #  NUMBERIFYING THE LIST BY TRANFORMING EACH ITEM TO NUMBER  #
	#============================================================#

	def Numberify()
		
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen

			n = 0

			if isNumber(aContent[i])
				n = aContent[i]

			but isString(aContent[i])

				if Q(aContent[i]).IsNumberInString()
					n = (0+ aContent[i])

				else
					n = Q(aContent[i]).NumberOfChars()
				ok

			but isList(aContent[i])
				n = len(aContent[i])

			but isObject(aContent[i]) and Q(aContent[i]).IsStzNumber()
				aList + aContent[i].NumericValue()

			ok

			aResult + n
		next

		This.UpdateWith(aResult)
			 
		def NumberifyQ()
			This.Numberify()
			return This

		def Numbrify()
			This.Numberify()

			def NumbrifyQ()
				This.Numbrify()
				return This

	def Numberified()
		aResult = This.Copy().NumberifyQ().Content()
		return aResult

		def Numbrified()
			return This.Numberified()

	  #----------------------------------------------------------------#
	 #  OBJECTIFYING THE LIST BY TRANFORMING EACH ITEM TO STZ OBJECT  #
	#----------------------------------------------------------------#

	def Objectify()
		
		aContent = This.Content()
		nLen = len(aContent)

		aResult = []

		for i = 1 to nLen
			aResult + Q(aContent[i])
		next

		This.UpdateWith(aResult)

		def ObjectifyQ()
			This.Objectify()
			return This

		def Softanzify()
			This.Objectify()

			def SoftanzifyQ()
				This.Softanzify()
				return This

	def Objectified()
		aResult = This.Copy().ObjectifyQ().Content()
		return aResult

		def Softanzified()
			return This.Objecified()

	def AndThen()
		return This

		def AndThenQ()
			return This.AndThen()

		def AndQ()
			return This.AndThen()
