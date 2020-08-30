extends "res://scenes/objects/mechanics/finite_state_machine/State.gd"


func update(_delta):
	if owner.transform.origin.y > owner.spawn.y + 1000 && !owner.is_on_floor():
		owner.die()


func _on_Player_detected(_player, _entered):
	if owner == null:
		return
	if _entered:
		owner.focused_body = _player
	else:
		owner.focused_body = null


func _on_Player_attackable(_player, _attackable):
	if owner == null:
		return
	owner.can_attack_player = _attackable
