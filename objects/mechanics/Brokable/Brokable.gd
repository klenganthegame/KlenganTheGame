extends FightableObject
class_name Brokable

func _ready():
	max_life = 1
	actual_life = 1

func update_life():
	pass

func dying():
	print("destroyed") 
	queue_free()
	remove_child(self)
