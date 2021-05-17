tool
extends TextureButton
class_name GameTextureButton


func _ready():
	connect("button_up", self, "_on_GameTextureButton_button_up")
	connect("button_down", self, "_on_GameTextureButton_button_down")
	mouse_default_cursor_shape = CURSOR_POINTING_HAND


func _on_GameTextureButton_button_down():
	AudioHandler.play_in_bus("sounds.menu_button_pressed", AudioHandler.BUS_SOUNDS)


func _on_GameTextureButton_button_up():
	AudioHandler.play_sound("sounds.menu_button_released", AudioHandler.BUS_SOUNDS)
