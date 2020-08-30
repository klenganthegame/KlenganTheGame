extends "res://scenes/objects/mechanics/finite_state_machine/states_klengan/movement/move.gd"

func update(delta):
	.update(delta)
	if velocity == Vector2():
		emit_signal("finished", "idle")
	elif velocity != Vector2() and !Input.is_action_pressed("sneak"):
		emit_signal("finished","move")
