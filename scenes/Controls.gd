extends Control

signal closed()

func _ready():
	
	if Input.get_joy_name(0) != "":
		_on_JoyPad_pressed()
	else:
		_on_Keyboard_pressed()
		
	Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")
	
func show_controlls():
	if Input.get_joy_name(0) != "":
		$Back.grab_focus()
	$AnimationPlayer.play("show")

func hide_controlls():
	$AnimationPlayer.play("hide")
	emit_signal("closed")

func _on_Back_pressed():
	hide_controlls()

func _on_JoyPad_pressed():
	$Joypad.show()
	$Keyboard.hide()


func _on_Keyboard_pressed():
	$Joypad.hide()
	$Keyboard.show()

func _on_joy_connection_changed(device_id, connected):
	if connected:
		_on_JoyPad_pressed()
	else:
		_on_Keyboard_pressed()
