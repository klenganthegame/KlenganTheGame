tool
extends GridContainer

onready var LoadButton = preload("res://scenes/LevelSelection/LoadButton.tscn")


func _ready():
	setup_grid()


func setup_grid():
	if !Engine.is_editor_hint():
		for child in get_children():
			child.queue_free()
		
		for i in range(SCENES.LEVELS.size() + 1):
			var load_button = LoadButton.instance()
			load_button.set_level_to_load(i)
			load_button.set_boss_unknown(i > 0)
			load_button.set_locked(i > 0)
			load_button.set_coming_soon(!SCENES.LEVELS.has(i))
			add_child(load_button, true)
	
