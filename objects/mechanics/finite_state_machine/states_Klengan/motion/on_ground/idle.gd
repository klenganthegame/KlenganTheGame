extends "res://objects/mechanics/finite_state_machine/states_Klengan/motion/motion.gd"


func enter():
	owner.play_directional_animation("idle")


func update(delta):
	if get_input_direction() != Vector2() or !owner.is_on_floor():
		emit_signal("finished", "move")