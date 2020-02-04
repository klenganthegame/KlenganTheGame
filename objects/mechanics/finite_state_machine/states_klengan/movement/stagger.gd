extends "res://objects/mechanics/finite_state_machine/states_klengan/movement/idle.gd"

func update(_delta):
	return


func _on_DialogueBox_dialogue_exit():
	emit_signal("finished", "idle")
