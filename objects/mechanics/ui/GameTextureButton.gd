tool
extends TextureButton
class_name GameTextureButton


func _ready():
	connect("button_up", self, "_on_GameTextureButton_button_up")
	connect("button_down", self, "_on_GameTextureButton_button_down")


func _on_GameTextureButton_button_down():
	AudioHandler.play_sound("menu_button_pressed")


func _on_GameTextureButton_button_up():
	AudioHandler.play_sound("menu_button_released")
