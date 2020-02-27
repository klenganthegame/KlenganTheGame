extends "res://objects/mechanics/finite_state_machine/states_enemy/movement/movement.gd"


func enter():
	.enter()
	owner.play_directional_animation("attack")


func _on_animation_finished(_anim_name):
	._on_animation_finished(_anim_name)
	attack(ENEMY_ATTACKS.NORMAL)
	emit_signal("finished", "move")


func attack(attack_id):
	var players = owner.get_node("AnimatedSprite/AttackArea").get_overlapping_bodies()
	var enemy_node = get_parent().get_parent()
	if !players.empty():
		RumbleHandler.rumble_hit()
	for player in players:
		enemy_node.attack(attack_id, player)
