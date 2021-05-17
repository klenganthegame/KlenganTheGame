tool
extends Button
class_name GameButton

func _ready():
	var _error = connect("button_up", self, "_on_GameButton_button_up")
	var _error2 = connect("button_down", self, "_on_GameButton_button_down")
	mouse_default_cursor_shape = CURSOR_POINTING_HAND


func _on_GameButton_button_down():
	AudioHandler.play_in_bus("sounds.menu_button_pressed", AudioHandler.BUS_SOUNDS)


func _on_GameButton_button_up():
	AudioHandler.play_in_bus("sounds.menu_button_released", AudioHandler.BUS_SOUNDS)
