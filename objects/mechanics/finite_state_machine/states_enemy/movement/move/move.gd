extends "res://objects/mechanics/finite_state_machine/states_enemy/movement/movement.gd"

export(float, 0, 1) var JUMP_PCT = 0.03
export(String) var JUMP_STATE = "jump_approach"
export(float, 0, 1) var WANDER_PCT = 0.1
export(float, 0, 1) var IDLING_MOVE_PCT = 0.4

func enter():
	.enter()
	owner.play_directional_animation("move")


func update(_delta):
	.update(_delta)
	velocity = owner.move_and_slide(velocity, Vector2(0, -1))


func try_jump():
	if owner.is_on_floor() and velocity.x != 0 and randf() < JUMP_PCT:
		emit_signal("finished", JUMP_STATE)


func apply_forces():
	.apply_forces()
	if can_change_velocity():
		change_velocity()
	else:
		velocity.x = int(lerp(velocity.x, 0, LERP_FACTOR))


func can_change_velocity():
	return false


func change_velocity():
	pass
