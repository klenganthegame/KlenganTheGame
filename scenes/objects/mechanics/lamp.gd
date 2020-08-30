extends Node2D

export var is_on : bool = false

func _ready():
	if is_on:
		on()
	else:
		off()


func on():
	$off.hide()
	$on.show()


func off():
	$off.show()
	$on.hide()


func trigger():
	AudioHandler.play_sound("lightswitch")
	is_on = !is_on
	if is_on:
		on()
	else:
		off()
