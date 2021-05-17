class_name Profile

var life : int = 10
var max_life : int = 10
var score : int = 0
var weapons : Array = [1]

var lastlevel : int = 0
var last_boss_defeated : bool = false
var saved_checkpoint = -1


const LIFE = "life"
const MAX_LIFE = "max_life"
const SCORE = "score"
const WEAPONS = "weapons"
const LASTLEVEL = "lastlevel"
const LASTBOSSDEFEATED = "last_boss_defeated"
const SAVEDCHECKPOINT = "saved_checkpoint"

# describes a "Klengan"-Profile of a User

func to_dict() -> Dictionary:
	return {
		MAX_LIFE : self.max_life,
		LIFE : self.life,
		SCORE : self.score,
		WEAPONS : self.weapons,
		LASTLEVEL : self.lastlevel,
		LASTBOSSDEFEATED : self.last_boss_defeated,
		SAVEDCHECKPOINT : self.saved_checkpoint
	}

func from_dict(dict : Dictionary = {}):
	self.max_life = dict[MAX_LIFE]
	self.life = dict[LIFE]
	self.score = dict[SCORE]
	self.weapons = dict[WEAPONS]
	self.lastlevel = dict[LASTLEVEL]
	self.last_boss_defeated = dict[LASTBOSSDEFEATED]
	self.saved_checkpoint = dict[SAVEDCHECKPOINT]
