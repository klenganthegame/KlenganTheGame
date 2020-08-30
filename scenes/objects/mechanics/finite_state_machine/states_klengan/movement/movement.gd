extends "res://scenes/objects/mechanics/finite_state_machine/states_klengan/state_klengan.gd"

export(int) var GRAVITY = 40
export(int) var ACCELERATON = 50
export(int) var MAX_SPEED = 400
export(int)  var JUMP_VELOCITY = 1000
export(float, 0, 1) var LERP_FACTOR = 0.4
var velocity : Vector2 = Vector2()


func enter():
	velocity = owner.velocity


func exit():
	owner.velocity = velocity


func update(_delta):
	.update(_delta)
	apply_forces()
	velocity = owner.move_and_slide(velocity, Vector2(0, -1))
	if Input.is_action_pressed("jump") and owner.is_on_floor():
		emit_signal("finished", "jump")
	elif Input.is_action_just_pressed("attack"):
		emit_signal("finished", "attack")
	elif Input.is_action_just_pressed("attack2"):
		emit_signal("finished", "ranged")
	elif Input.is_action_just_pressed("accept") and owner.is_on_floor() \
	and !Input.is_action_pressed("walk_left") and !Input.is_action_pressed("walk_right"):
		owner.interact()


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
