extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/movement.gd"

var ascending = true

func enter():
	.enter()
	set_ascending(true)
	velocity.y = -JUMP_VELOCITY


func exit():
	set_ascending(false)
	.exit()


func update(delta):
	.update(delta)
	set_ascending(velocity.y < 0)
	if owner.is_on_floor() and velocity == Vector2():
		emit_signal("finished", "idle")
	elif owner.is_on_floor():
		emit_signal("finished", "move")


func apply_forces():
	.apply_forces()
	var input_direction = get_input_direction()
	velocity.x = clamp(velocity.x + input_direction.x * ACCELERATON, -MAX_SPEED, MAX_SPEED)
	if input_direction != Vector2():
		owner.play_directional_animation("walk", (input_direction.x > 0))


func set_ascending(_ascending):
	ascending = _ascending
	owner.get_node("CollisionShape2D").disabled = ascending
	