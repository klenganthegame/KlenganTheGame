"""
Handles Game Saving and Loading
"""
extends Node

const LIFE = "life"
const SCORE = "score"
const LEVELSTATE = "levelstate"

const GAMEDATA = "gamedata"
const SETTINGS = "settings"
const RUMBLE = "rumble"

const MASTER = "master"
const MUSIC = "music"
const AMBIENT = "ambient"
const SFX = "sfx"
const PROFILE = "profile"


const path = "user://save.data"

func save_level(life: int, score : int, levelstate : int) -> bool:
	"""
	Saves Game-State into file
	"""
	var savedict = to_dict(life, score, levelstate)
	var file = File.new()
	file.open(path, file.WRITE)
	file.store_line(JSON.print(savedict))
	file.close()
	return true

func load_level() -> Dictionary:
	"""
	Loads a level and returns a dictionary
	"""
	var file = File.new()
	var error = file.open(path, file.READ)
	var text = file.get_as_text()
	var r = JSON.parse(text)
	return {}#r[save_const]

func to_dict(life: int, score : int, levelstate : int) -> Dictionary:
	"""
	Converts parameters into Ditionary
	"""
	var result = {
		save_const : {
			LIFE : life,
			SCORE : score,
			LEVELSTATE : levelstate
		}
	}
	return {}
