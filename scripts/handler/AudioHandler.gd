extends Node

const BUS_MASTER = "Master"
const BUS_SOUNDS = "Sounds"
const BUS_DIALOGUE_SOUNDS = "DialogueSounds"
const BUS_MUSIC = "Music"
const BUS_AMBIENT = "Ambient"

onready var sounds_player = $SoundsPlayer
onready var music_player = $MusicPlayer
onready var ambient_player = $AmbientPlayer

var audio_dict : Dictionary = {}
var local_audio_enabled = true


func _ready():
	pause_mode = PAUSE_MODE_PROCESS
	audio_dict = $AudioLoader.load_audio_dict()


func get_stream(_stream_name : String):
	if audio_dict.has(_stream_name):
		return load(audio_dict[_stream_name])
	else:
		print("AudioHandler.gd: No audio with name ", _stream_name, ".")


func play_in_bus(_sound_name : String, _bus_name : String):
	var sound = get_stream(_sound_name)
	if sound != null:
		match(_bus_name):
			BUS_SOUNDS:
				sounds_player.stream = sound
				sounds_player.play()
			BUS_MUSIC:
				music_player.stream = sound
				music_player.play()
			BUS_AMBIENT:
				ambient_player.stream = sound
				ambient_player.play()


func change_bus_volume_by_name(_bus_name : String, _volume_pct):
	change_bus_volume(AudioServer.get_bus_index(_bus_name), _volume_pct)


func change_bus_volume(_bus_index : int, _volume_pct : float):
	var volume_db = linear2db(_volume_pct)
	
	AudioServer.set_bus_mute(_bus_index, (_volume_pct == 0.0))
	
	if _volume_pct != 0.0:
		AudioServer.set_bus_volume_db(_bus_index, volume_db)


func set_bus_muted_by_name(_bus_name : String, _muted : bool):
	set_bus_muted(AudioServer.get_bus_index("Master"), _muted)


func set_bus_muted(_bus_idx : int, _muted : bool):
	AudioServer.set_bus_mute(_bus_idx, _muted)
