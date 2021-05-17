extends AudioStreamPlayer2D
class_name GameAudioPlayer2D


func play_sound(_sound_name : String):
	var sound = AudioHandler.get_stream(_sound_name)
	if sound != null and AudioHandler.local_audio_enabled:
		stream = sound
		play()
	elif sound != null:
		AudioHandler.play_in_bus(_sound_name, bus)
