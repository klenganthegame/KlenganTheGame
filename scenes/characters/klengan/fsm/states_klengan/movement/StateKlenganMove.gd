extends StateKlenganMovement
class_name StateKlenganMove


func update(_delta):
	.update(_delta)
	if velocity == Vector2():
		emit_signal("finished", "idle")
	elif Input.is_action_just_pressed("sneak"):
		emit_signal("finished","sneak")


func apply_forces():
	.apply_forces()
	apply_horizontal_velocity("walk")

