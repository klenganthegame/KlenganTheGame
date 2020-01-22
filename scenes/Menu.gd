extends Control

func _ready():
	$AnimationPlayer.play("idle")
	pass


func _on_NewGame_pressed():
	get_tree().change_scene(SCENES.Level1)
	pass # Replace with function body.


func _on_LoadGame_pressed():
	pass # Replace with function body.


func _on_Credits_pressed():
	pass # Replace with function body.


func _on_Exit_pressed():
	#get_tree().change_scene(SCENES.Meni)
	pass # Replace with function body.
