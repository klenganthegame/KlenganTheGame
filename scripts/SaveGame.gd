extends Node

const LIFE = "life"
const SCORE = "score"
const LEVELSTATE = "levelstate"
const save_const = "data"

const path = "user://save.data"

func save_level(life: int, score : int, levelstate : int) -> bool:
	var savedict = to_dict(life, score, levelstate)
	var file = File.new()
	file.open(path, file.WRITE)
	file.store_line(JSON.print(savedict))
	file.close()
	return true

func load_level() -> Dictionary:
	var file = File.new()
	var error = file.open(path, file.READ)
	var text = file.get_as_text()
	var r : JSONParseResult = JSON.parse(text)
	return r[save_const]

func to_dict(life: int, score : int, levelstate : int) -> Dictionary:
	var result = {
		save_const : {
			LIFE : life,
			SCORE : score,
			LEVELSTATE : levelstate
		}
	}
	return {}
