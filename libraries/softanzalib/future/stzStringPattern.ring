

func IsStringPattern(pcString)
	return TRUE // TODO

class stzStringPattern from stzObject
	cPattern

	def init(pcStr)
		if IsStringPattern(pcStr)
			cPattern = pcStr
		else
			StzRaise(stzStringPattern(:CanNotCreateStringPattern))
		ok

	def MatchWith(pcOtherStr)
		// TODO

	def MatchWithMany(paStr)
		// TODO
