extends CheckGameButton



func _on_Stereo_toggled(_button_pressed):
	AudioHandler.local_stereo_enabled = _button_pressed
