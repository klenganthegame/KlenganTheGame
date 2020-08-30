extends Control

func _ready():
	var _error = LevelChanger.connect("load_progress", self, \
		"_on_Load_progress_changed")


func _on_Load_progress_changed(_progress_percent):
	$Margin/ProgressBar.value = _progress_percent * 100
