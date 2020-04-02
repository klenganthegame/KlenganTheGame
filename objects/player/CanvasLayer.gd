extends CanvasLayer

var last_save_score = 0
var last_save_life = 0
var level_state = 0

func _ready():
	pass


func toggle_pause():
	if $Pause.visible:
		$PauseMenu.play("out")
	else:
		$PauseMenu.play("in")
		if Input.get_joy_name(0) != "":
			$Pause/Panel/PauseMenu/Back.grab_focus()
			
	#$Pause.visible = !$Pause.visible
	get_tree().paused = !get_tree().paused


func go_to_Menu():
	get_tree().paused = false
	get_tree().change_scene(SCENES.Menu)


func _on_Save_pressed():
	SaveGame.save_level(last_save_life, last_save_score, level_state)


func _on_Settings_pressed():
	if Input.get_joy_name(0) != "":
		$Pause/Panel/Settings/Sounds.grab_focus()
	$PauseMenu.play("settings_in")


func _on_BackToMenu_pressed():
	$PauseMenu.play("backtomenu")

func _on_Donations_toggled(button_pressed):
	if button_pressed:
		$Pause/Krebshilfe.show()
	else:
		$Pause/Krebshilfe.hide()

func _on_Back_pressed():
	if Input.get_joy_name(0) != "":
		$Pause/Panel/PauseMenu/Back.grab_focus()
	$PauseMenu.play("settings_out")
	pass # Replace with function body.


func _on_Controls_pressed():
	$Pause/Controlls.show_controlls()


func _on_Controlls_closed():
	if Input.get_joy_name(0) != "":
		$Pause/Panel/PauseMenu/Controls.grab_focus()
