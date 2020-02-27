extends Button

func _ready():
	pass

func _process(_delta):
	if pressed:
		text = "Spendenaufruf: an"
	else:
		text = "Spendenaufruf: aus"
