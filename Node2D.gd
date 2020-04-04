extends Node2D
var isOpen: bool = false
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
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
