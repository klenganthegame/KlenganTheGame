extends "res://objects/mechanics/finite_state_machine/states_enemy/movement/movement.gd"

export(float, 0, 1) var JUMP_PCT = 0.02


func update(_delta):
	.update(_delta)
	velocity = owner.move_and_slide(velocity, Vector2(0, -1))
	
	try_jump()
	
#	#Do not use this, buggy as hell:)
#	if Input.is_action_just_pressed("attack"):
#		emit_signal("finished", "damage")


func try_jump():
	if owner.is_on_floor() and randf() < JUMP_PCT:
		emit_signal("finished", "jump")


func apply_forces():
	.apply_forces()
	approach_player()


func approach_player():
	if owner.focused_body != null:
		var player_right = owner.position.x - owner.focused_body.position.x < 0
		var move_acceleration = int(pow(-1, int(!player_right)) * ACCELERATON)
		velocity.x = clamp(velocity.x + move_acceleration, -MAX_SPEED, MAX_SPEED)
		
		if velocity.x != 0:
			owner.set_looking_right(velocity.x > 0)
			owner.play_directional_animation("move")
	else:
		velocity.x = int(lerp(velocity.x, 0, LERP_FACTOR))
