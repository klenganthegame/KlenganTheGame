extends Control

export var unlocked_weapons = [1, 2, 3]

var selected_weapon = 1
var is_there = false

signal weapon_selected(id)

func _enter_tree():
	for weapon_button in $WeaponMenu.get_children():
		if weapon_button is WeaponButton:
			weapon_button.connect("selected_self", self, "touch_button")
		
func _ready():
	if !is_touch():
		$Timer.stop()
	for weapon_button in $WeaponMenu.get_children():
		for i in unlocked_weapons:
			get_weapon(i).unlock()
	select_weapon(1)

func get_weapon(i) -> WeaponButton:
	for weapon_button in $WeaponMenu.get_children():
		if weapon_button is WeaponButton:
			if unlocked_weapons.has(weapon_button.key_id):
				if i == weapon_button.key_id:
					return weapon_button
	return null

func _input(event):
	# Handle Controller
	if Input.is_action_just_pressed("next_weapon"):
		select_increment(1)
	if Input.is_action_just_pressed("last_weapon"):
		select_increment(-1)
	
	# Handle Keyboard
	if event is InputEventKey:
		if event.pressed:
			var input_key = event.scancode
			var selected
			
			var calced = input_key - 48 
			if calced <= 9 and input_key != 48 and unlocked_weapons.has(calced):
				selected_weapon = calced
				select_weapon(selected_weapon)

func touch_button(id):
	if is_touch():
		select_weapon(id)

func is_touch()->bool:
	return GlobalVars.touch_devices.has(OS.get_name())
	
func select_increment(i : int):
	var select = selected_weapon
	select += i
	
	var selected = selected_weapon
	selected += i
	while !unlocked_weapons.has(selected):
		select += i
		if selected > unlocked_weapons.max():
			selected = 1
			
		if selected <= 0:
			selected = unlocked_weapons.max()
	selected_weapon = selected
	select_weapon(selected_weapon)

func select_weapon(i : int):
	if !is_touch():
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
		if !is_there :
			$AnimationPlayer.play("fade_in")
			is_there = true
	emit_signal("weapon_selected", selected_weapon)

func _on_Timer_timeout():
	if !is_touch():
		$AnimationPlayer.play("fade_out")
		is_there = false
