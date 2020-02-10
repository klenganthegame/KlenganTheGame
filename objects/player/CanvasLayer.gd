extends CanvasLayer

var last_save_score = 0
var last_save_life = 0
var level_state = 0

func _ready():
	pass

func _input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle_pause()


func _unhandled_key_input(_event):
	if Input.is_action_just_pressed("pause"):
		toggle_pause()


func toggle_pause():
	if $Pause.visible:
		$PauseMenu.play("out")
	else:
		$PauseMenu.play("in")
	get_tree().paused = !get_tree().paused


func go_to_Menu():
	get_tree().paused = false
	get_tree().change_scene(SCENES.Menu)


func _on_Save_pressed():
	SaveGame.save_level(last_save_life, last_save_score, level_state)


func _on_Settings_pressed():
	$PauseMenu.play("settings_in")


func _on_BackToMenu_pressed():
	$PauseMenu.play("backtomenu")
  

func _on_Pause_pressed():
	toggle_pause()

func _on_OptionButton_item_selected(ID):
	get_node("Colorblindness").Type = ID
	print("selected")


func _on_BackToPause_pressed():
	$PauseMenu.play("settings_out")


func _on_Donations_toggled(button_pressed):
	if button_pressed:
		$Pause/Krebshilfe.show()
	else:
		$Pause/Krebshilfe.hide()

