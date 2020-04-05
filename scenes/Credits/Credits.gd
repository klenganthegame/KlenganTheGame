extends Control


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene(SCENES.Menu)


func _on_BackButton_pressed():
	get_tree().change_scene(SCENES.Menu)
