extends Node

# This is the audio handler.
# It plays audio and you can change the volume.
# A sound can be played by calling a  play_sound/play_music and 
# passing the name as an argument.

func _ready():
	# Create Audio StreamPlayer
	pass


func change_bus_volume(_bus_index, _volume_pct):
	var volume_db = linear2db(_volume_pct)
	
	AudioServer.set_bus_mute(_bus_index, (_volume_pct == 0.0))
	
	if _volume_pct != 0.0:
		AudioServer.set_bus_volume_db(_bus_index, volume_db)


func play_sound(_sound_name):
	var sound = AudioLoader.get_sound(_sound_name)
	
	if sound != null and _sound_name.begins_with("klengan"):
		AudioLoader.klengan_sounds_player.stream = sound
		AudioLoader.klengan_sounds_player.play()
	else:
		AudioLoader.sounds_player.stream = sound
		AudioLoader.sounds_player.play()


func play_music(_music_name):
	if AudioLoader.music_dict.has(_music_name):
		AudioLoader.music_player.stream = load(AudioLoader.music_dict[_music_name])
		AudioLoader.music_player.play()


func play_ambient(_ambient_name):
	if AudioLoader.ambient_dict.has(_ambient_name):
		AudioLoader.ambient_player.stream = load(AudioLoader.ambient_dict[_ambient_name])
		AudioLoader.ambient_player.play()
