extends Node

var music 
var ambient
var sfx 
var rumble = true

var Profile : SaveProfile

const touch_devices = ["Android", "iOS"]

func is_touch()->bool:
	return touch_devices.has(OS.get_name())

func _ready():
	pass
