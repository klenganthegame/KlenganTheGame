tool
extends CheckButton
class_name CheckGameButton

func _ready():
	var _error = connect("button_up", self, "_on_GameCheckButton_button_up")
	var _error2 = connect("button_down", self, "_on_GameCheckButton_button_down")
	mouse_default_cursor_shape = CURSOR_POINTING_HAND



func _on_GameCheckButton_button_up():
	AudioHandler.play_in_bus("menu_button_released", "Sounds")


func _on_GameCheckButton_button_down():
	AudioHandler.play_in_bus("menu_button_pressed", "Sounds")
