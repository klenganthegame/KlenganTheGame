tool
extends LinkButton
class_name HotlinkButton

export(String) var link = ""


func _on_HotlinkButton_pressed():
	if link != "":
		OS.shell_open(link)
