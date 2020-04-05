tool
extends Button
class_name GameButton

func _ready():
	connect("pressed", self, "_on_GameButton_pressed")


func _on_GameButton_pressed():
	AudioHandler.play_sound("menu_button")
