extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/movement.gd"


func update(delta):
	.update(delta)
	if velocity == Vector2() && !sneak:
		emit_signal("finished", "idle")
	elif sneak:
		emit_signal("finished","sneak")
	


func apply_forces():
	.apply_forces()
	var input_direction = get_input_direction()
	if input_direction == Vector2():
		velocity.x = int(lerp(velocity.x, 0, 0.4))
	else:
		velocity.x = clamp(velocity.x + input_direction.x * ACCELERATON, -MAX_SPEED, MAX_SPEED)
		owner.play_directional_animation("walk", (input_direction.x > 0))

