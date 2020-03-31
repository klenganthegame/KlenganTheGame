"""
Represents an Attack of a FightableObject
"""

class_name Attack

var id : int 
var atk : int
var reload_time : float = 0 
var distance : float = 0

func _init(var _id : int, _atk : int, _reload_time : int, _distance : float):
	"""
	ID: Attack id (you can use Enums)
	ATK: Attack value
	ReloadTime: Reloadtime for Attack
	Distance: AttackDistance (dont know if needed)
	"""
	id = _id
	atk = _atk
	reload_time = _reload_time
	distance = _distance
