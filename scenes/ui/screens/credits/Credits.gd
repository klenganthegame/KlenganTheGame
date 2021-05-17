extends Control


func _ready():
	pass


func _on_BackButton_pressed():
	get_tree().change_scene(SCENES.MENU)
