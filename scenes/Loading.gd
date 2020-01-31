extends Control

var texture_max_pos = 1004


func _ready():
	LevelChanger.connect("load_progress", self, "_on_Load_progress_changed")
	texture_max_pos = OS.window_size.x - $VBox/Texture.rect_size.x


#func _process(delta):
#	_on_Load_progress_changed($VBox/ProgressBar.value / 100 + 0.005)


func _on_Load_progress_changed(_progress_percent):
	$VBox/ProgressBar.value = _progress_percent * 100
	$VBox/Texture.rect_position.x = clamp(_progress_percent * texture_max_pos, 0, texture_max_pos)


