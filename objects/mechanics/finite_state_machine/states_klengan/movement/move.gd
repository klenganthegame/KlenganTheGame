extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/movement.gd"


func update(delta):
	.update(delta)
	if velocity == Vector2():
		emit_signal("finished", "idle")
	elif Input.is_action_just_pressed("sneak"):
		emit_signal("finished","sneak")


func apply_forces():
	.apply_forces()
	apply_horizontal_velocity("walk")

