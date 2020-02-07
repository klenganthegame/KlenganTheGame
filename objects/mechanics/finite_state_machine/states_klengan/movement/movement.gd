extends "res://objects/mechanics/finite_state_machine/states_klengan/state_klengan.gd"

export var GRAVITY : int = 40
export var ACCELERATON : int = 50
export var MAX_SPEED : int = 400
export var JUMP_VELOCITY : int = 1000
export var LERP_FACTOR : float = 0.4
var velocity = Vector2()


func enter():
	velocity = owner.velocity


func exit():
	owner.velocity = velocity


func update(_delta):
	apply_forces()
	if velocity.y >= 0:
		set_ascending(false)
	velocity = owner.move_and_slide(velocity, Vector2(0, -1))
	if Input.is_action_pressed("jump") and owner.is_on_floor():
		emit_signal("finished", "jump")
	elif Input.is_action_just_pressed("attack"):
		emit_signal("finished", "attack")


func get_input_direction():
	var direction = Vector2()
	direction.x = int(Input.is_action_pressed("walk_right")) - int(Input.is_action_pressed("walk_left")) 
	return direction


func apply_horizontal_velocity(_move_anim):
	var input_direction = get_input_direction()
	if input_direction == Vector2():
		velocity.x = int(lerp(velocity.x, 0, LERP_FACTOR))
	else:
		velocity.x = clamp(velocity.x + input_direction.x * ACCELERATON, -MAX_SPEED, MAX_SPEED)
		owner.play_directional_animation(_move_anim, (input_direction.x > 0))


func apply_forces():
	if !owner.is_on_floor():
		velocity.y += GRAVITY


func set_ascending(_ascending):
	owner.get_node("Collision").disabled = _ascending
