extends Node
class_name Settings

var master_sound
var music_sound
var ambient_sound
var sfx_sound
var rumble = true

const RUMBLE = "rumble"
const MASTER = "master"
const MUSIC = "music"
const AMBIENT = "ambient"
const SFX = "sfx"

const touch_devices = ["Android", "iOS"]

func is_touch()->bool:
	return touch_devices.has(OS.get_name())


func to_dict() -> Dictionary:
	"""
	Converts parameters into Ditionary
	"""
	return {
			MASTER: self.master_sound,
			MUSIC : self.music_sound,
			AMBIENT : self.ambient_sound,
			SFX : self.sfx_sound,
			RUMBLE : self.rumble
	}

func from_dict(dict : Dictionary = {}):
	self.master_sound = dict[MASTER]
	self.music_sound = dict[MUSIC]
	self.ambient_sound = dict[AMBIENT]
	self.sfx_sound = dict[SFX]
	self.rumble = dict[RUMBLE]
