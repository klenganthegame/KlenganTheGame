extends "res://objects/mechanics/finite_state_machine/states_enemy/movement/movement.gd"


func enter():
	.enter()
	owner.play_directional_animation("attack")


func _on_animation_finished(_anim_name):
	._on_animation_finished(_anim_name)
	attack()
	emit_signal("finished", "move")


func attack():
	var players = owner.get_node("AnimatedSprite/AttackArea").get_overlapping_bodies()
	for player in players:
		player.hit(10)
