extends "res://objects/mechanics/finite_state_machine/states_enemy/movement/move/move.gd"


func can_change_velocity():
	return owner.focused_body != null and !owner.can_attack_player


func change_velocity():
	approach_player()


func approach_player():
	var player_distance = owner.position.x - owner.focused_body.position.x
	var move_acceleration = int(pow(-1, int(!player_distance < 0)) * ACCELERATON)
	var new_x_velocity = velocity.x + move_acceleration
	
	velocity.x = clamp(new_x_velocity, -MAX_SPEED, MAX_SPEED)
	
	if velocity.x != 0:
		owner.set_looking_right(velocity.x > 0)
		owner.play_directional_animation("move")
	
	try_jump()



