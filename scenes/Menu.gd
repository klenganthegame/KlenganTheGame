extends Control

func _ready():
	$FadeIn.play("in")
	$AnimationPlayer.play("idle")
	if Input.get_joy_name(0) != "":
		$VBoxContainer/NewGame.grab_focus()


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

func toggle_menu():
	if $Pause.visible:
		$SettingsMenu.play("out")
		$VBoxContainer/NewGame.grab_focus()
	else:
		$SettingsMenu.play("in")
		if Input.get_joy_name(0) != "":
			$Pause/PausePanel/Settings/Sounds.grab_focus()
	$Pause.visible = !$Pause.visible


func _on_Settings_pressed():
	toggle_menu()
	
func _on_Back_pressed():
	toggle_menu()
