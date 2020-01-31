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
	get_tree().quit()


func _on_Reddit_pressed():
	OS.shell_open("https://www.reddit.com/r/Klengan/")
	pass # Replace with function body.

func _on_Youtube_pressed():
	OS.shell_open("https://www.youtube.com/channel/UC9N0MRIXnKo03d0mmZ3BwPA")
	pass # Replace with function body.
