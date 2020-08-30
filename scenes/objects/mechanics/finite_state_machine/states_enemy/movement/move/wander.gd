extends "res://scenes/objects/mechanics/finite_state_machine/states_enemy/movement/move/move.gd"


export(int) var max_wander_distance = 500

var start_pos = Vector2()
var wander_dir = Vector2()
var wander_delta = 0


func enter():
	start_pos = owner.position
	wander_dir = int(pow(-1, int(randf() < 0.5)))
	wander_delta = max_wander_distance * randf()


func update(_delta):
	.update(_delta)
	update_wander_delta(_delta)


func can_change_velocity():
	return wander_delta > 0


func change_velocity():
	wander()


func wander():
	var move_acceleration = wander_dir * ACCELERATON
	var new_x_velocity = velocity.x + move_acceleration
	
	velocity.x = clamp(new_x_velocity, -MAX_SPEED, MAX_SPEED)
	
	if velocity.x != 0:
		owner.set_looking_right(velocity.x > 0)
		owner.play_directional_animation("move")


func update_wander_delta(_delta):
	# When horizontal collision occures the velocity.x will not be set to 0 
	# but will be less than 1. This checks and ends the wander if an enemy walks against a wall
	if abs(velocity.x) < 1:
		wander_delta = 0
	else:
		wander_delta -= clamp(abs(_delta * velocity.x), 0, max_wander_distance)
