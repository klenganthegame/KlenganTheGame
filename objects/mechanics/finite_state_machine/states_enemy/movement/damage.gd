extends "res://objects/mechanics/finite_state_machine/states_enemy/movement/move.gd"


func enter():
	.enter()
	throw_back()


func throw_back():
	velocity.x += -JUMP_VELOCITY
	velocity.y += -JUMP_VELOCITY
