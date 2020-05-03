"""
Handles Game Saving and Loading
"""
extends Node

const path = "user://save.data"

var profile : Profile
var settings : Settings

const GAMEDATA = "gamedata"
const SETTINGS = "settings"

func save_game():
	"""
	Saves Game-State into file
	"""
	var savedict = to_dict()
	var file = File.new()
	file.open(path, file.WRITE)
	file.store_line(JSON.print(savedict))
	file.close()


func load_data():
	"""
	Loads a level and returns a dictionary
	"""
	var file = File.new()
	var error = file.open(path, file.READ)
	var text = file.get_as_text()
	var r = JSON.parse(text)

	profile.from_dict(r.result[GAMEDATA])
	settings.from_dict(r.result[SETTINGS])


func to_dict() -> Dictionary:
	"""
	Converts parameters into Ditionary
	"""
	return {
		SETTINGS : settings.to_dict(),
		GAMEDATA : profile.to_dict()
	}

