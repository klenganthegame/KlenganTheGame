class_name Attack

var id : int 
var atk : int
var reload_time : float = 0 
var distance : float = 0

func _init(var _id : int, _atk : int, _reload_time : int, _distance : float):
	id = _id
	atk = _atk
	reload_time = _reload_time
	distance = _distance
