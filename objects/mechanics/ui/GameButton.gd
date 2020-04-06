tool
extends Button
class_name GameButton

func _ready():
	connect("button_up", self, "_on_GameButton_button_up")
	connect("button_down", self, "_on_GameButton_button_down")


func _on_GameButton_button_down():
	AudioHandler.play_sound("menu_button_pressed")


func _on_GameButton_button_up():
	AudioHandler.play_sound("menu_button_released")
