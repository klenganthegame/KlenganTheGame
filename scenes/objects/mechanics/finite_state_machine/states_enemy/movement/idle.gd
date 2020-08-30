extends "res://scenes/objects/mechanics/finite_state_machine/states_enemy/state_enemy.gd"

export(float, 0, 1) var WANDER_PCT = 0.01


func enter():
	owner.play_directional_animation("idle")


func update(_delta):
	if owner.focused_body == null and (randf() < WANDER_PCT):
		emit_signal("finished", "wander")


func _on_Player_detected(_player, _entered):
	._on_Player_detected(_player, _entered)
	if _entered:
		emit_signal("finished", "approach")
