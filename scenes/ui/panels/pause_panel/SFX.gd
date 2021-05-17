extends Button

func _process(_delta):
	if pressed:
		text = "SFX: an"
	else:
		text = "SFX: aus"
