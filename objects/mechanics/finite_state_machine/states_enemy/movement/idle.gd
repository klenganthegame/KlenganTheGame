extends "res://objects/mechanics/finite_state_machine/states_enemy/state_enemy.gd"


func enter():
	owner.play_directional_animation("idle")


func _on_Player_detected(_player, _entered):
	._on_Player_detected(_player, _entered)
	if _entered and name != "Move":
		emit_signal("finished", "move")
