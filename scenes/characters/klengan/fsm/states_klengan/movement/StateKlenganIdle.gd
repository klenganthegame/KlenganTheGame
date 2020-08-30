extends StateKlenganMovement
class_name StateKlenganIdle


func enter():
	.enter()
	owner.play_directional_animation("idle")


func update(_delta):
	.update(_delta)
	if get_input_direction() != Vector2() and Input.is_action_pressed("sneak"):
		emit_signal("finished","sneak")
	elif get_input_direction() != Vector2():
		emit_signal("finished", "move")
