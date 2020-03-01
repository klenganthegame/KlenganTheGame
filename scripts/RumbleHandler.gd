extends Node

func rumble_normal_attack():
	if OS.get_name() == "android" or OS.get_name() == "iOS" or OS.get_name() == "Blackberry 10":
		Input.vibrate_handheld(0.2)
		Input.start_joy_vibration(0, 1, 0, 0.2)

func rumble_dash():
	if OS.get_name() == "android" or OS.get_name() == "iOS" or OS.get_name() == "Blackberry 10":
		Input.start_joy_vibration(0, 0.3, 1, 0.2)
		Input.vibrate_handheld(0.4)

func rumble_hit():
	if OS.get_name() == "android" or OS.get_name() == "iOS" or OS.get_name() == "Blackberry 10":
		Input.start_joy_vibration(0, 1, 0, 0.2)
		Input.vibrate_handheld(0.1)
