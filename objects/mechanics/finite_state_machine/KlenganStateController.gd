extends "res://objects/mechanics/finite_state_machine/StateController.gd"

func initialize_state_map():
	states_map = {
		"idle": $Idle,
		"move": $Move,
		"jump": $Jump
	}


func _unhandled_input(event):
	current_state.handle_input(event)



