extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/movement.gd"

func enter():
	.enter()
	if owner.is_on_floor():
		velocity.y = 0
		velocity.y += -JUMP_VELOCITY*1.2
	else:
		velocity.y = JUMP_VELOCITY
	set_ascending(true)


func update(delta):
	.update(delta)
	if Input.is_action_just_pressed("sneak"):
		velocity.y = JUMP_VELOCITY
	if owner.is_on_floor() and velocity == Vector2():
		emit_signal("finished", "idle")
	elif owner.is_on_floor():
		emit_signal("finished", "move")


func apply_forces():
	.apply_forces()
	var input_direction = get_input_direction()
	if !sneak:
		velocity.x = clamp(velocity.x + input_direction.x * ACCELERATON, -MAX_SPEED, MAX_SPEED)
	else:
		velocity.x = clamp(velocity.x + input_direction.x * ACCELERATON, -MAX_SPEED, MAX_SPEED)*0.75
	if input_direction != Vector2():
		owner.play_directional_animation("walk", (input_direction.x > 0))
