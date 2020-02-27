extends Node

func rumble_normal_attack():
	Input.start_joy_vibration(0, 1, 0, 0.2)

func rumble_dash():
	Input.start_joy_vibration(0, 0.3, 1, 0.2)

func rumble_hit():
	Input.start_joy_vibration(0, 1, 0, 0.2)
