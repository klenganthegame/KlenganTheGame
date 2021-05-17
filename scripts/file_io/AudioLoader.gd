extends Node

const AUDIO_FILE_PATH = "res://resources/audio"

# This is the audio loader.
# It features two AudioStreamPlayer, one for sounds and one for music
# All audio is stored in dicts and will be loaded from the audio folder(s).
# Currently the sounds will be loaded uppon playing it if that causes the sound
# to lag, load the sound on _ready() (but it will consume more memory)


func load_audio_dict():
	var files = get_files_in_dir(AUDIO_FILE_PATH)
	var audio_dict = {}
	
	for file in files:
		if file.ends_with(".import"):
			file = file.replace(".import", "")
			if has_audio_file_postfix(file):
				var sound_id = create_audio_id_from_path(file)
				audio_dict[sound_id] = file
	return audio_dict


func get_files_in_dir(_dir_path : String) -> PoolStringArray:
	var dir = Directory.new()
	var error = dir.open(_dir_path)
	var files = []
	
	if error == OK:
		dir.list_dir_begin()
		var file_name =  dir.get_next()
		while file_name != "":
			if !file_name.begins_with("."):
				if dir.current_is_dir():
					files = files + get_files_in_dir(_dir_path.plus_file(file_name))
				else:
					files.append(_dir_path.plus_file(file_name))
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		print("AudioHandler.gd: Could not load ", dir, ". Error Code: ", error)
	return files


func create_audio_id_from_path(_path):
	var file_id = _path.trim_prefix(AUDIO_FILE_PATH)
	file_id = file_id.trim_prefix("/")
	file_id = file_id.trim_suffix(".wav")
	file_id = file_id.trim_suffix(".ogg")
	file_id = file_id.replace("/", ".")
	return file_id


func has_audio_file_postfix(_path : String):
	return _path.ends_with(".wav") or _path.ends_with(".ogg") \
		 or _path.ends_with(".mp3")
