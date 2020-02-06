extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/movement.gd"


func enter():
	.enter()
	owner.set_AttackCollision_disabled(false)
	owner.play_directional_animation("attack")


func exit():
	owner.set_AttackCollision_disabled(true)
	.exit()


func _on_animation_finished(_anim_name):
	emit_signal("finished", "move")
