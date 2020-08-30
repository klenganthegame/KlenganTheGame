extends StateKlenganMovement
class_name StateKlenganDoublejump

func enter():
	.enter()
	velocity.y = -500


func update(delta):
	.update(delta)
	if Input.is_action_just_pressed("sneak"):
		emit_signal("finished", "dash")
	elif owner.is_on_floor():
		emit_signal("finished", "move")


func apply_forces():
	.apply_forces()
	var input_direction = get_input_direction()
	if input_direction == Vector2():
		velocity.x = int(lerp(velocity.x, 0, LERP_FACTOR))
	else:
		if Input.is_action_pressed("sneak"):
			velocity.x = clamp(velocity.x + input_direction.x * ACCELERATON, -MAX_SPEED/4*1.5, MAX_SPEED/4*1.5)
		else:
			velocity.x = clamp(velocity.x + input_direction.x * ACCELERATON, -MAX_SPEED, MAX_SPEED)
		owner.play_directional_animation("walk", (input_direction.x > 0))
