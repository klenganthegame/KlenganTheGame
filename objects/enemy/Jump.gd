extends "res://objects/mechanics/finite_state_machine/states_enemy/movement/move.gd"


func enter():
	.enter()
	velocity.y -= JUMP_VELOCITY


func update(_delta):
	.update(_delta)
	if owner.is_on_floor():
		emit_signal("finished", "move")
