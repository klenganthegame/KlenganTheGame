extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/movement.gd"


func update(delta):
	.update(delta)
	if velocity == Vector2():
		emit_signal("finished", "idle")
	elif velocity != Vector2() && !sneak:
		emit_signal("finished","move")


func apply_forces():
	.apply_forces()
	var input_direction = get_input_direction()
	if input_direction == Vector2():
		velocity.x = int(lerp(velocity.x, 0, 0.4))*0.5
	else:
		velocity.x = clamp(velocity.x + input_direction.x * ACCELERATON, -MAX_SPEED, MAX_SPEED)*0.5
		owner.play_directional_animation("walk", (input_direction.x > 0))

