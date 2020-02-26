extends "res://objects/mechanics/finite_state_machine/StateController.gd"

func initialize_state_map():
	states_map = {
		"idle": $Idle,
		"move": $Move,
		"jump": $Jump,
		"attack": $Attack,
		"damage": $Damage
	}


func _on_DetectionArea_body_entered(_body):
	if active:
		current_state._on_Player_detected(_body, true)


func _on_DetectionArea_body_exited(_body):
	if active:
		current_state._on_Player_detected(_body, false)


func _on_AttackArea_body_entered(_body):
	if active:
		current_state._on_Player_attackable(_body, true)
		owner.start_attack_cooldown()


func _on_AttackArea_body_exited(_body):
	if active:
		current_state._on_Player_attackable(_body, false)
		owner.stop_attack_cooldown()
