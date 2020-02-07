extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/movement.gd"

func enter():
	.enter()
	if owner.is_on_floor():
		velocity.y = -JUMP_VELOCITY * 1.2
	else:
		velocity.y = JUMP_VELOCITY
	set_ascending(true)


func update(_delta):
	.update(_delta)
	if Input.is_action_just_pressed("sneak"):
		velocity.y = JUMP_VELOCITY
	if owner.is_on_floor() and velocity == Vector2():
		emit_signal("finished", "idle")
	elif owner.is_on_floor() and !Input.is_action_pressed("sneak"):
		emit_signal("finished", "move")
	elif owner.is_on_floor() and Input.is_action_pressed("sneak"):
		emit_signal("finished","sneak")

