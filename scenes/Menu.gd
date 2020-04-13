extends Control

func _ready():
	$FadeIn.play("in")
	$AnimationPlayer.play("idle")
	if Input.get_joy_name(0) != "":
		$VBoxContainer/NewGame.grab_focus()


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if $Pause.visible:
			toggle_menu()
		elif $Controls.visible:
			$Controls.hide_controls()


func _on_NewGame_pressed():
	$FadeIn.play("load_game")


func load_level_one():
	LevelChanger.change_level_to(SCENES.Level0)


func _on_LoadGame_pressed():
	LevelChanger.change_level_to(SCENES.Level0)


func _on_Credits_pressed():
	get_tree().change_scene(SCENES.Credits)


func _on_Exit_pressed():
	get_tree().quit()


func _on_Reddit_pressed():
	OS.shell_open("https://www.reddit.com/r/Klengan/")


func _on_Youtube_pressed():
	OS.shell_open("https://www.youtube.com/channel/UC9N0MRIXnKo03d0mmZ3BwPA")


func toggle_menu():
	if $Pause.visible:
		$SettingsMenu.play("out")
		$VBoxContainer/NewGame.grab_focus()
	else:
		$SettingsMenu.play("in")
		if Input.get_joy_name(0) != "":
			$Pause/PausePanel/Settings/MasterVolumeSlider.grab_focus()
	$Pause.visible = !$Pause.visible


func _on_Settings_pressed():
	toggle_menu()


func _on_Back_pressed():
	toggle_menu()


func _on_Controls_closed():
	$VBoxContainer/Controls.grab_focus()


func _on_Controls_pressed():
	$Controls.show_controls()


func _on_Donations_toggled(_button_pressed):
	$Krebshilfe.visible = _button_pressed

