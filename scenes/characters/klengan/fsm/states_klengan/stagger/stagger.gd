extends StateKlengan
class_name StateKlenganStagger


func enter():
	owner.play_directional_animation("idle")


func exit():
	owner.velocity = Vector2()


func update(_delta):
	.update(_delta)


func _on_DialogueBox_dialogue_exit():
	emit_signal("finished", "idle")
