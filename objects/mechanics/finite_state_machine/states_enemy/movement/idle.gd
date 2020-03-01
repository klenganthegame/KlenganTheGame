extends "res://objects/mechanics/finite_state_machine/states_enemy/movement/movement.gd"


func enter():
	owner.play_directional_animation("idle")
