extends "res://objects/mechanics/finite_state_machine/states_enemy/movement/movement.gd"

export(float, 0, 1) var JUMP_PCT = 0.03
export(float, 0, 1) var IDLING_MOVE_PCT = 0.4

func enter():
	.enter()
	owner.play_directional_animation("move")


func update(_delta):
	.update(_delta)
	velocity = owner.move_and_slide(velocity, Vector2(0, -1))


func try_jump():
	if owner.is_on_floor() and velocity.x != 0 and randf() < JUMP_PCT:
		emit_signal("finished", "jump")


func apply_forces():
	.apply_forces()
	if owner.focused_body != null and !owner.can_attack_player:
		approach_player()
	else:
		velocity.x = int(lerp(velocity.x, 0, LERP_FACTOR))


func approach_player():
	var player_distance = owner.position.x - owner.focused_body.position.x
	var move_acceleration = int(pow(-1, int(!player_distance < 0)) * ACCELERATON)
	var new_x_velocity = velocity.x + move_acceleration
	
	velocity.x = clamp(velocity.x + move_acceleration, -MAX_SPEED, MAX_SPEED)
	
	if velocity.x != 0:
		owner.set_looking_right(velocity.x > 0)
		owner.play_directional_animation("move")
	try_jump()


func wander():
	if rand_range(-1,1) < IDLING_MOVE_PCT:
		velocity.x = clamp(velocity.x + rand_range(-0.8,0.8), -MAX_SPEED, MAX_SPEED)
		
		if velocity.x != 0:
			owner.set_looking_right(velocity.x > 0)
			owner.play_directional_animation("move")
	else:
		velocity.x = int(lerp(velocity.x, 0, LERP_FACTOR))
		emit_signal("finished","idle")
