extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/movement.gd"


func enter():
	.enter()
	owner.set_AttackCollision_disabled(false)
	if velocity.x != 0:
		#replace with move attack anim
		owner.play_directional_animation("attack") 
	else:
		#replace with idle attack anim
		owner.play_directional_animation("attack") 


func exit():
	.exit()
	owner.set_AttackCollision_disabled(true)


func _on_animation_finished(_anim_name):
	if Input.is_action_pressed("sneak"):
		emit_signal("finished", "sneak")
	else:
		emit_signal("finished", "move")


func apply_forces():
	.apply_forces()
	velocity.x = int(lerp(velocity.x, 0, LERP_FACTOR))
