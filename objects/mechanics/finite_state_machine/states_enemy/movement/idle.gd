extends "res://objects/mechanics/finite_state_machine/states_enemy/movement/movement.gd"


func enter():
	owner.play_directional_animation("idle")

func update(_delta):
	if rand_range(0,1) < 0.1:
		emit_signal("finished","move")
