extends Node

const BUS_MASTER = "Master"
const BUS_SOUNDS = "Sounds"
const BUS_DIALOGUE_SOUNDS = "DialogueSounds"
const BUS_MUSIC = "Music"


var lightswitch : AudioStreamSample = load("res://resources/audio/lightswitch.wav")
var menu_button : AudioStreamSample = load("res://resources/audio/menu_button.wav")
var door : AudioStreamSample = load("res://resources/audio/door.wav")

var sounds_player : AudioStreamPlayer
var music_player : AudioStreamPlayer


func _ready():
	# Create Audio StreamPlayer
	sounds_player = AudioStreamPlayer.new()
	music_player = AudioStreamPlayer.new()
	
	# Ensure sounds/music will be played when the game is paused
	sounds_player.pause_mode = Node.PAUSE_MODE_PROCESS
	music_player.pause_mode = Node.PAUSE_MODE_PROCESS
	
	lightswitch.loop_mode = AudioStreamSample.LOOP_DISABLED
	menu_button.loop_mode = AudioStreamSample.LOOP_DISABLED
	door.loop_mode = AudioStreamSample.LOOP_DISABLED
	
	sounds_player.bus = BUS_SOUNDS
	music_player.bus = BUS_MUSIC
	
	add_child(sounds_player)
	add_child(music_player)


func change_bus_volume(_bus_index, _volume_pct):
	var volume_db = linear2db(_volume_pct)
	
	AudioServer.set_bus_mute(_bus_index, (_volume_pct == 0.0))
	
	if _volume_pct != 0.0:
		AudioServer.set_bus_volume_db(_bus_index, volume_db)


func play_sound(_sound_name):
	match (_sound_name):
		"lightswitch":
			sounds_player.stream = lightswitch
		"menu_button":
			sounds_player.stream = menu_button
		"door":
			sounds_player.stream = door
	
	sounds_player.play()


func play_music(_track):
	music_player.play()
