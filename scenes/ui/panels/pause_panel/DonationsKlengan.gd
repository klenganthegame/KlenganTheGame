extends Button

func _process(_delta):
	if pressed:
		text = "Spendenaufruf: an"
		get_parent().get_parent().get_parent().get_node("Krebshilfe").show()
	else:
		text = "Spendenaufruf: aus"
		get_parent().get_parent().get_parent().get_node("Krebshilfe").hide()
