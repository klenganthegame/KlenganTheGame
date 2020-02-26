extends "res://objects/mechanics/finite_state_machine/StateController.gd"

var attackable_enemies = []

func initialize_state_map():
	states_map = {
		"idle": $Idle,
		"move": $Move,
		"jump": $Jump,
		"attack": $Attack,
		"stagger": $Stagger,
		"sneak": $Sneak,
		"dash": $Dash,
		"doubleJump": $DoubleJump
	}



func _on_AttackArea_area_entered(area : Area2D):
	self.attackable_enemies.append(area.get_parent().owner)
	#for a in area.get_overlapping_areas():
	#	self.attackable_enemies.append(a.get_parent())
	#	


func _on_AttackArea_area_exited(area):
	self.attackable_enemies.remove(area.get_parent().owner)
