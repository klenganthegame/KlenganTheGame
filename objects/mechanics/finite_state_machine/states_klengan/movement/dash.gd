extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/movement.gd"
var damage = false
var dashDamage = 0
var dashHeight = 0
var trueDash = false
func enter():
	.enter()
	damage = false
	owner.set_DashCollision_disabled(false)
	dashHeight = 0
	if owner.is_on_floor():
		velocity.y = -JUMP_VELOCITY * 1.2
		trueDash =true
	else:
		velocity.y = JUMP_VELOCITY
		damage = true
		dashHeight = owner.position.y
		owner.set_collision_mask_bit(1, false)
		trueDash = false

func update(_delta):
	.update(_delta)
	applyForces()
	if Input.is_action_just_pressed("sneak") && trueDash: #if debug or test remove "just_"  
		dashHeight = owner.position.y
		dashDamage = (JUMP_VELOCITY*3)/1000
		velocity.y = JUMP_VELOCITY*3
		damage = true
		owner.set_collision_mask_bit(1,false)
	if !Input.is_action_pressed("sneak"):
		owner.set_collision_mask_bit(1,true)
	if owner.is_on_floor() and velocity == Vector2():
		owner.set_collision_mask_bit(1,true)
		do_damage()
		emit_signal("finished", "idle")
	elif owner.is_on_floor() and !Input.is_action_pressed("sneak"):
		owner.set_collision_mask_bit(1,true)
		do_damage()
		emit_signal("finished", "move")
	elif owner.is_on_floor() and Input.is_action_pressed("sneak"):
		owner.set_collision_mask_bit(1,true)
		do_damage()
		emit_signal("finished","sneak")
	elif Input.is_action_just_pressed("jump"):
		emit_signal("finished","doubleJump")
	dashDamage = velocity.y/1000

func do_damage():
	if owner.is_on_floor() and damage:
		RumbleHandler.rumble_dash()
		damage = false
		dashHeight -= owner.position.y
		dashDamage = (((pow((-(dashHeight-owner.position.y)+50*dashDamage),2)/3000)*dashDamage-((50*pow(dashDamage,2))/60)*dashDamage)/1000)*(0.75+(int(trueDash)*0.25))
		print(dashDamage)
		var enemies = owner.get_node("DashArea").get_overlapping_bodies()
		print(enemies)
		for enemy in enemies:
			get_parent().get_parent().attack(KLENGAN_ATTACKS.DASH, enemy, dashDamage)
		owner.set_DashCollision_disabled(true)
		
func applyForces():
	var input_direction = get_input_direction()
	if input_direction == Vector2():
		velocity.x = int(lerp(velocity.x, 0, LERP_FACTOR))
	else:
		if Input.is_action_pressed("sneak"):
			velocity.x = clamp(velocity.x + input_direction.x * ACCELERATON, -MAX_SPEED/4*1.5, MAX_SPEED/4*1.5)
		else:
			velocity.x = clamp(velocity.x + input_direction.x * ACCELERATON, -MAX_SPEED, MAX_SPEED)
		owner.play_directional_animation("walk", (input_direction.x > 0))
