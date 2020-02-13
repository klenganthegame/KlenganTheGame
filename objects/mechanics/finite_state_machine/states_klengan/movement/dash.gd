extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/movement.gd"

func enter():
	.enter()
	if owner.is_on_floor():
		velocity.y = -JUMP_VELOCITY * 1.2
	else:
		velocity.y = JUMP_VELOCITY
		owner.set_collision_mask_bit(1, false)


func update(_delta):
	.update(_delta)
	if Input.is_action_just_pressed("sneak"):
		velocity.y = JUMP_VELOCITY*3
		owner.set_collision_mask_bit(1,false)
	
	if !Input.is_action_pressed("sneak"):
		owner.set_collision_mask_bit(1,true)
	
	if owner.is_on_floor() and velocity == Vector2():
		owner.set_collision_mask_bit(1,true)
		emit_signal("finished", "idle")
	elif owner.is_on_floor() and !Input.is_action_pressed("sneak"):
		owner.set_collision_mask_bit(1,true)
		emit_signal("finished", "move")
	elif owner.is_on_floor() and Input.is_action_pressed("sneak"):
		owner.set_collision_mask_bit(1,true)
		emit_signal("finished","sneak")
	elif Input.is_action_just_pressed("jump"):
		emit_signal("finished","doubleJump")

