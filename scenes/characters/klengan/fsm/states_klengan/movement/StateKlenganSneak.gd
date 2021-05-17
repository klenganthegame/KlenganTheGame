extends StateKlenganMovement
class_name StateKlenganSneak

func update(delta):
	.update(delta)
	if velocity == Vector2():
		emit_signal("finished", "idle")
	elif velocity != Vector2() and !Input.is_action_pressed("sneak"):
		emit_signal("finished","move")
