extends Node

var sounds : bool = true
var music : bool = true
var rumble : bool = true
var sfx : bool = true

var lifes : int = 10
var touch_devices = ["Android", "iOS"]

func is_touch()->bool:
	return touch_devices.has(OS.get_name())

func _ready():
	pass