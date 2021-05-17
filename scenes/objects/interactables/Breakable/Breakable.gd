extends FightableObject
class_name Breakable

func _ready():
	max_life = 1
	actual_life = 1

func update_life():
	pass

func dying():
	print("destroyed") 
	queue_free()


func hit(damage : int):
	.hit(damage)
	AudioHandler.play_sound("enemy_hurt")
	if has_node("StateMachine"):
		$StateMachine._change_state("damage")
