extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/movement.gd"


func enter():
	.enter()
	owner.play_directional_animation("idle")


func update(delta):
	.update(delta)
	if get_input_direction() != Vector2():
		emit_signal("finished", "move")