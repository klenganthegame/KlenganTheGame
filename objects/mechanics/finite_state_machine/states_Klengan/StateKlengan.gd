extends "res://objects/mechanics/finite_state_machine/State.gd"


func handle_input():
	if Input.is_action_pressed("jump"):
		emit_signal("finished", "jump")
