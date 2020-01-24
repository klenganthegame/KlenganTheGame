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
	pass # Replace with function body.


func _on_BackToMenu_pressed():
	get_tree().change_scene(SCENES.Menu)
	pass # Replace with function body.
