extends Control

signal closed()

func _ready():
	if Input.get_joy_name(0) != "":
		_on_JoyPad_pressed()
		$JoyPadButton.grab_focus()
	else:
		_on_Keyboard_pressed()
		$KeyboardButton.grab_focus()
		
	var _error = Input.connect("joy_connection_changed", self, \
		"_on_joy_connection_changed")
	
func show_controls():
	if Input.get_joy_name(0) != "":
		$Back.grab_focus()
	$AnimationPlayer.play("show")


func hide_controls():
	$AnimationPlayer.play("hide")
	emit_signal("closed")

func _on_Back_pressed():
	hide_controls()


func _on_JoyPad_pressed():
	$Joypad.show()
	$Keyboard.hide()


func _on_Keyboard_pressed():
	$Joypad.hide()
	$Keyboard.show()

func _on_joy_connection_changed(_device_id, _connected):
	if _connected:
		_on_JoyPad_pressed()
	else:
		_on_Keyboard_pressed()
