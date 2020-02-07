extends "res://objects/mechanics/finite_state_machine/states_klengan/state_klengan.gd"


func enter():
	owner.play_directional_animation("idle")


func exit():
	owner.velocity = Vector2()


func _on_DialogueBox_dialogue_exit():
	velocity.x = 0
	emit_signal("finished", "idle")
