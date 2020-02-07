extends "res://objects/mechanics/finite_state_machine/StateController.gd"

func initialize_state_map():
	states_map = {
		"idle": $Idle,
		"move": $Move,
		"jump": $Jump,
		"attack": $Attack,
		"stagger": $Stagger,
		"sneak": $Sneak
	}
