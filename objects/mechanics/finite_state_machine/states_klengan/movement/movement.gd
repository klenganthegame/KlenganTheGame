extends "res://objects/mechanics/finite_state_machine/states_klengan/state_klengan.gd"

export var GRAVITY : int = 40
export var ACCELERATON : int = 50
export var MAX_SPEED : int = 400
export var JUMP_VELOCITY : int = -1000
var sneak : bool = false
var velocity


func enter():
	velocity = owner.velocity


func exit():
	owner.velocity = velocity


func update(_delta):
	apply_forces()
	velocity = owner.move_and_slide(velocity, Vector2(0, -1))
	if Input.is_action_pressed("jump") and owner.is_on_floor():
		emit_signal("finished", "jump")


func get_input_direction():
	var direction = Vector2()
	sneak = Input.is_action_pressed("sneak")
	direction.x = int(Input.is_action_pressed("walk_right")) - int(Input.is_action_pressed("walk_left")) 
	return direction


func apply_forces():
	apply_gravity()


func apply_gravity():
	if !owner.is_on_floor():
		velocity.y += GRAVITY
