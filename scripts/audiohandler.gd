extends Node

const BUS_MASTER = "Master"
const BUS_SOUNDS = "Sounds"
const BUS_DIALOGUE_SOUNDS = "DialogueSounds"
const BUS_MUSIC = "Music"


var lightswitch : AudioStreamSample = load("res://resources/audio/lightswitch.wav")
var menu_button : AudioStreamSample = load("res://resources/audio/menu_button.wav")
var door : AudioStreamSample = load("res://resources/audio/door.wav")

var sound_player : AudioStreamPlayer
var music_player : AudioStreamPlayer


func _ready():
	# Create Audio StreamPlayer
	sound_player = AudioStreamPlayer.new()
	music_player = AudioStreamPlayer.new()
	
	lightswitch.loop_mode = AudioStreamSample.LOOP_DISABLED
	menu_button.loop_mode = AudioStreamSample.LOOP_DISABLED
	door.loop_mode = AudioStreamSample.LOOP_DISABLED
	
	add_child(sound_player)
	add_child(music_player)


func change_bus_volume(_bus_index, _volume_pct):
	var volume_db = linear2db(_volume_pct)
	
	AudioServer.set_bus_mute(_bus_index, (_volume_pct == 0.0))
	
	if _volume_pct != 0.0:
		AudioServer.set_bus_volume_db(_bus_index, volume_db)


func play_sound(_sound_name):
	match (_sound_name):
		"lightswitch":
			sound_player.stream = lightswitch
		"menu_button":
			sound_player.stream = menu_button
		"door":
			sound_player.stream = door
	
	sound_player.play()


func play_music(_track):
	music_player.play()
