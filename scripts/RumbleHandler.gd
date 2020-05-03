extends Node

# designed as singleton
# This class handles the Rumble on mobile devices and controller

func rumble_normal_attack():
	"""
	Attack Rumble
	"""
	if OS.get_name() == "android" or OS.get_name() == "iOS" or OS.get_name() == "Blackberry 10":
		Input.vibrate_handheld(0.2)
	if Input.get_joy_name(0) != "":
		Input.start_joy_vibration(0, 0.7, 0.1, 0.1)

func rumble_dash():
	"""
	Dash Rumble
	"""
	if OS.get_name() == "android" or OS.get_name() == "iOS" or OS.get_name() == "Blackberry 10":
		Input.vibrate_handheld(0.4)
	if Input.get_joy_name(0) != "":
		Input.start_joy_vibration(0, 0.3, 1, 0.2)
		

func rumble_hit():
	"""
	Hit Rumble
	"""
	if OS.get_name() == "android" or OS.get_name() == "iOS" or OS.get_name() == "Blackberry 10":
		Input.vibrate_handheld(0.1)
	if Input.get_joy_name(0) != "":
		Input.start_joy_vibration(0, 0.3, 0, 0.2)
		
