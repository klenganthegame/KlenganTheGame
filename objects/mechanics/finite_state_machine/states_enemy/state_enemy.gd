extends "res://objects/mechanics/finite_state_machine/State.gd"

func _on_Player_detected(_player, _entered):
	if _entered:
		owner.focused_body = _player
	else:
		owner.focused_body = null


func _on_Player_attackable(_player, _attackable):
	owner.can_attack_player = _attackable
