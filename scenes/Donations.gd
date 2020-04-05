extends GameButton

func _ready():
	pass

func _process(_delta):
	if pressed:
		text = "Spendenaufruf: an"
	else:
		text = "Spendenaufruf: aus"


#func _on_Donations_pressed():
#	_on_GameButton_pressed()
