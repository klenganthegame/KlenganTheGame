extends Node

signal load_progress(_progress_percentage)

const WAIT_FREEZE_FRAMES = 2

var loader = null
var wait_frames = 0

func change_level_to(_level_name):
	get_tree().change_scene(SCENES.Loading)
	load_level(_level_name)


func load_level(_level_name):
	loader = ResourceLoader.load_interactive(_level_name)
	if loader == null:
		show_error()
		return
	set_process(true)
	wait_frames = WAIT_FREEZE_FRAMES
	emit_signal("load_progress", 0)


# If multiple stages should be loaded at once use code from background loading tutorial
func _process(delta):
	if loader == null:
		set_process(false)
		return

	if wait_frames > 0:
		wait_frames -= 1
		return
	
	var err = loader.poll()
	
	if err == ERR_FILE_EOF:
		finalize_level()
		loader = null
	elif err == OK:
		update_progress()
		wait_frames = WAIT_FREEZE_FRAMES
	else: # error during loading
		show_error()
		loader = null


func finalize_level():
	var new_level_packed = loader.get_resource()
	get_tree().change_scene_to(new_level_packed)


func update_progress():
	var progress_percentage = float(loader.get_stage() + 1) / loader.get_stage_count()
	emit_signal("load_progress", progress_percentage)


func show_error():
	print("LevelChanger.gd: An Error occured Loading the new level!")
