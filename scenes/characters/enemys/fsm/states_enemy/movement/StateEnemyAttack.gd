extends StateEnemyMovement
class_name StateEnemyAttack


func enter():
	.enter()
	owner.play_directional_animation("idle")
	owner.play_sound("sounds.enemy_attack")


func update(_delta):
	.update(_delta)
	velocity = owner.move_and_slide(velocity, Vector2(0, -1))


func _on_animation_finished(_anim_name):
	._on_animation_finished(_anim_name)
	attack(ENEMY_ATTACKS.NORMAL)
	emit_signal("finished", "approach")


func attack(attack_id):
	var players = owner.get_node("AttackArea").get_overlapping_bodies()
	var enemy_node = get_parent().get_parent()
	if !players.empty():
		RumbleHandler.rumble_hit()
	for player in players:
		enemy_node.attack(attack_id, player)
