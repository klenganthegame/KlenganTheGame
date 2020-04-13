tool
extends GridContainer


func setup_grid():
	if !Engine.is_editor_hint():
		for child in get_children():
			child.queue_free()
		
		var load_button = LoadButton.instance()
