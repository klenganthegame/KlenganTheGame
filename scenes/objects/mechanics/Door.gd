extends Node2D

var isOpen: bool = false

func on():
	$Sprite/DoorClosed.hide()
	$Sprite/DoorOpen.show()
	isOpen = true
	$StaticBody2D/Door.disabled = true

func off():
	$Sprite/DoorClosed.show()
	$Sprite/DoorOpen.hide()
	isOpen = false
	$StaticBody2D/Door.disabled = false

func trigger():
	AudioHandler.play_sound("door")
	isOpen = !isOpen
	if isOpen:
		on()
	else:
		off()
