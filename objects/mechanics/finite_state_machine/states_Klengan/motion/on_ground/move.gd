extends "res://objects/mechanics/finite_state_machine/states_Klengan/motion/motion.gd"

func enter():
	velocity = Vector2()


func update(delta):
	var input_direction = get_input_direction()
	if input_direction == Vector2() and owner.is_on_floor():
		emit_signal("finished", "idle")
	update_look_direction(input_direction)
	
	velocity.x = clamp(velocity.x + input_direction.x * ACCELERATON, -MAX_SPEED, MAX_SPEED)
	if !owner.is_on_floor():
		velocity.y += GRAVITY
	else:
		velocity.y = 0
	
	var new_velocity = owner.move_and_slide(velocity, Vector2(0, -1))
	velocity = new_velocity
	return .update(delta)