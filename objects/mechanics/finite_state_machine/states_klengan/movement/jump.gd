extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/movement.gd"

func enter():
	.enter()
	velocity.y += -JUMP_VELOCITY


func update(delta):
	.update(delta)
	if Input.is_action_just_pressed("sneak"):
		emit_signal("finished", "dash")
	elif Input.is_action_just_pressed("jump"):
		emit_signal("finished","doubleJump")
	elif owner.is_on_floor():
		emit_signal("finished", "move")


func apply_forces():
	.apply_forces()
	var input_direction = get_input_direction()
	if input_direction == Vector2():
		velocity.x = int(lerp(velocity.x, 0, LERP_FACTOR))
	else:
		velocity.x = clamp(velocity.x + input_direction.x * ACCELERATON, -MAX_SPEED, MAX_SPEED)
		owner.play_directional_animation("walk", (input_direction.x > 0))
