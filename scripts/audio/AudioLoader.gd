extends Node

const BUS_MASTER = "Master"
const BUS_SOUNDS = "Sounds"
const BUS_DIALOGUE_SOUNDS = "DialogueSounds"
const BUS_MUSIC = "Music"
const BUS_AMBIENT = "Ambient"

const SOUNDS_PATH = "res://resources/audio/sounds/"
const MUSIC_PATH = "res://resources/audio/music/"
const AMBIENT_PATH = "res://resources/audio/ambient/"

var sounds_dict = {}
var music_dict = {}
var ambient_dict = {}

var sounds_player : AudioStreamPlayer
var klengan_sounds_player : AudioStreamPlayer
var music_player : AudioStreamPlayer
var ambient_player : AudioStreamPlayer


var local_stereo_enabled = true

# This is the audio loader.
# It features two AudioStreamPlayer, one for sounds and one for music
# All audio is stored in dicts and will be loaded from the audio folder(s).
# Currently the sounds will be loaded uppon playing it if that causes the sound
# to lag, load the sound on _ready() (but it will consume more memory)


func _ready():
	# Create Audio StreamPlayer
	sounds_player = AudioStreamPlayer.new()
	klengan_sounds_player = AudioStreamPlayer.new()
	music_player = AudioStreamPlayer.new()
	ambient_player = AudioStreamPlayer.new()
	
	# Ensure sounds/music will be played when the game is paused
	sounds_player.pause_mode = Node.PAUSE_MODE_PROCESS
	klengan_sounds_player.pause_mode = Node.PAUSE_MODE_PROCESS
	music_player.pause_mode = Node.PAUSE_MODE_PROCESS
	ambient_player.pause_mode = Node.PAUSE_MODE_PROCESS
	
	sounds_player.bus = BUS_SOUNDS
	klengan_sounds_player.bus = BUS_SOUNDS
	music_player.bus = BUS_MUSIC
	ambient_player.bus = BUS_AMBIENT
	
	add_child(sounds_player)
	add_child(klengan_sounds_player)
	add_child(music_player)
	add_child(ambient_player)
	
	fill_audio_dict_from_path(sounds_dict, SOUNDS_PATH)
	fill_audio_dict_from_path(music_dict, MUSIC_PATH)
	fill_audio_dict_from_path(ambient_dict, AMBIENT_PATH)


func get_sound(_sound_name):
	if sounds_dict.has(_sound_name):
		return load(sounds_dict[_sound_name])


func fill_audio_dict_from_path(_dict, _path):
	var audios = get_audios_in_dir(_path)
	for audio in audios: 
		# removing all possible suffixes to get the name
		var dict_name = audio.trim_suffix(".wav")
		dict_name = dict_name.trim_suffix(".mp3")
		dict_name = dict_name.trim_suffix(".ogg")
		_dict[dict_name] = _path + audio


func get_audios_in_dir(_path):
	var files = []
	var dir = Directory.new()
	dir.open(_path)
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif !file.begins_with(".") and is_audio_file_name(file):
			files.append(file)
	
	dir.list_dir_end()
	
	return files


func is_audio_file_name(_file_name):
	return _file_name.ends_with(".wav") or _file_name.ends_with(".mp3") \
	 or _file_name.ends_with(".ogg")
