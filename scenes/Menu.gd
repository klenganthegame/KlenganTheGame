extends Control

func _enter_tree():
	$CanvasModulate.color = 0x000000

func _ready():
	$FadeIn.play("in")
	$AnimationPlayer.play("idle")


func _on_NewGame_pressed():
	$FadeIn.play("load_game")


func load_level_one():
	LevelChanger.change_level_to(SCENES.Level1)


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
