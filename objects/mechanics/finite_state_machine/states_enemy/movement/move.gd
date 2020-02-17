extends "res://objects/mechanics/finite_state_machine/states_enemy/movement/movement.gd"

export(float, 0, 1) var JUMP_PCT = 0.03
export(float, 0, 1) var IDLING_MOVE_PCT = 0.4

func update(_delta):
	.update(_delta)
	velocity = owner.move_and_slide(velocity, Vector2(0, -1))
	
#	#Do not use this, buggy as hell:)
#	if Input.is_action_just_pressed("attack"):
#		emit_signal("finished", "damage")


func try_jump():
	if owner.is_on_floor() and velocity.x != 0 and randf() < JUMP_PCT:
		emit_signal("finished", "jump")


func apply_forces():
	.apply_forces()
	if owner.focused_body != null:
		approach_player()
	else:
		 wander()


func approach_player():
	var player_right = owner.position.x - owner.focused_body.position.x < 0
	var move_acceleration = int(pow(-1, int(!player_right)) * ACCELERATON)
	velocity.x = clamp(velocity.x + move_acceleration, -200, 200)
	
	if velocity.x != 0:
		owner.set_looking_right(velocity.x > 0)
		owner.play_directional_animation("move")
	try_jump()

func wander():
	if rand_range(-1,1) < IDLING_MOVE_PCT:
		velocity.x = clamp(velocity.x + rand_range(-0.8,0.8), -200, 200)
		
		if velocity.x != 0:
			owner.set_looking_right(velocity.x > 0)
			owner.play_directional_animation("move")
	else:
		velocity.x = int(lerp(velocity.x, 0, LERP_FACTOR))
		emit_signal("finished","idle")