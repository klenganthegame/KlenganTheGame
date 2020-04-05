extends GameButton


func _process(_delta):
	if pressed:
		text = "Controller Rumble: an"
	else:
		text = "Controller Rumble: aus"


func _on_Rumble_pressed():
	_on_GameButton_pressed()
