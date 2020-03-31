extends Node2D

export var unlocked_weapons = [1, 2]
var selected_weapon = 1
var is_there = false

signal weapon_selected(id)

func _ready():
	$Timer.stop()
	for weapon_button in $WeaponMenu.get_children():
		for i in unlocked_weapons:
			get_weapon(i).unlock()

func get_weapon(i) -> WeaponButton:
	for weapon_button in $WeaponMenu.get_children():
		if weapon_button is WeaponButton:
			if unlocked_weapons.has(weapon_button.key_id):
				if i == weapon_button.key_id:
					return weapon_button
	return null

func _input(event):
	
	# Handle Keyboard
	if event is InputEventKey:
		if event.pressed:
			var input_key = event.scancode
			var selected
			if input_key == 48:
				selected_weapon = 0
			else:
				var calced = input_key - 48 
				if calced <= 9 and input_key != 48:
					selected_weapon = calced
					select_weapon(selected_weapon)

func select_weapon(i : int):
	
	$Timer.start()
	# check if weapon is avaiable
	
	if unlocked_weapons.has(i):
		selected_weapon = i
	
	# if not-> weapon is fist
	else:
		selected_weapon = 1
		
	for weapon_button in $WeaponMenu.get_children():
		if weapon_button is WeaponButton:
			weapon_button.pressed = false
			weapon_button.unselect()

	var w = get_weapon(selected_weapon)

	if w != null:
		w.pressed = true
		w.select()
		if !is_there:
			$AnimationPlayer.play("fade_in")
			is_there = true
	
	emit_signal("weapon_selected", selected_weapon)

func _on_Timer_timeout():
	$AnimationPlayer.play("fade_out")
	is_there = false
