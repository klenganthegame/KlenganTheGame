extends "res://objects/mechanics/finite_state_machine/states_Klengan/StateKlengan.gd"

export var GRAVITY : int = 20
export var ACCELERATON : int = 50
export var MAX_SPEED : int = 400

var velocity = Vector2()

func enter():
	velocity = Vector2()


func get_input_direction():
	var input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed("walk_right")) - int(Input.is_action_pressed("walk_left"))
	return input_direction


func update_look_direction(_direction):
	var moving_right = (_direction.x > 0)
	if _direction.x != 0 and owner.looking_right != moving_right:
		owner.set_looking_right(moving_right)


func decelerate_x_movement(_deceleration):
	velocity.x = lerp(owner.velocity.x, 0, _deceleration)