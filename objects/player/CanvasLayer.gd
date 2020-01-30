extends CanvasLayer

func _ready():
	pass


func _on_Pause_pressed():
	$PauseMenu.play("in")
	get_parent().paused = true 
	pass # Replace with function body.

func _unhandled_key_input(event):
	if Input.is_action_just_pressed("pause"):
		if get_parent().paused == true :
			$PauseMenu.play("out")
		else:
			$PauseMenu.play("in")
		get_parent().paused = !get_parent().paused 
	pass # Replace with function body.

func _on_Back_pressed():
	get_parent().paused = false 
	$PauseMenu.play("out")
	pass # Replace with function body.


func _on_Save_pressed():
	pass # Replace with function body.


func _on_Settings_pressed():
	pass # Replace with function body.


func _on_BackToMenu_pressed():
	get_tree().change_scene(SCENES.Menu)
	pass # Replace with function body.
