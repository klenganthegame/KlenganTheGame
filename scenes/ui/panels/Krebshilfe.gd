extends Control


func _on_LinkButton_pressed():
	var _error = OS.shell_open("https://www.krebshilfe.de/spenden-und-aktiv-werden/spenden-service/jetzt-spenden/")
