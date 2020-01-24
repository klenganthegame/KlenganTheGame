extends CanvasLayer

var last_save_score = 0
var last_save_life = 0
var level_state = 0

func _ready():
	pass


func _on_Pause_pressed():
	$PauseMenu.play("in")
	pass # Replace with function body.


func _on_Back_pressed():
	$PauseMenu.play("out")
	pass # Replace with function body.


func _on_Save_pressed():
	SaveGame.save_level(last_save_life, last_save_score, level_state)


func _on_Settings_pressed():
	$PauseMenu.play("settings_in")
	pass # Replace with function body.


func _on_BackToMenu_pressed():
	$PauseMenu.play("backtomenu")

func go_to_Menu():
	get_tree().change_scene(SCENES.Menu)


func _on_OptionButton_item_selected(ID):
	get_node("Colorblindness").Type = ID
	print("selected")

func _on_BackToPause_pressed():
	$PauseMenu.play("settings_out")
