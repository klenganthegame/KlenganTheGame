extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/movement.gd"


func enter():
	.enter()
	owner.set_AttackCollision_disabled(false)
	if velocity.x != 0:
		owner.play_directional_animation("attack") #replace with move attack anim
	else:
		owner.play_directional_animation("attack") #replace with idle attack anim


func exit():
	.exit()
	owner.set_AttackCollision_disabled(true)


func _on_animation_finished(_anim_name):
	if velocity.x != 0:
		emit_signal("finished", "move")
	else: 
		emit_signal("finished", "idle")

func update(delta):
	.update(delta)
	if velocity == Vector2() && !sneak:
		velocity.x = 0
	elif sneak:
		velocity.x = MAX_SPEED*0.5


func apply_forces():
	.apply_forces()
	var input_direction = get_input_direction()
	if input_direction == Vector2():
		velocity.x = int(lerp(velocity.x, 0, 0.4))
	else:
		velocity.x = clamp(velocity.x + input_direction.x * ACCELERATON, -MAX_SPEED, MAX_SPEED)
