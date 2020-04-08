extends "res://objects/mechanics/finite_state_machine/states_klengan/state_klengan.gd"


func enter():
	owner.play_directional_animation("idle")


func exit():
	owner.velocity = Vector2()


func update(_delta):
	.update(_delta)


func _on_DialogueBox_dialogue_exit():
	emit_signal("finished", "idle")
