"""
A FightableObjact represents a fancy dude that can fight
"""

extends KinematicBody2D
class_name FightableObject

signal die()

export(int) var max_life = 10
export(int) var actual_life = 10
var attacks : Array

var to_heal : int = 0

func _ready():
	"""
	Connects the 'die' signal to the standard
	method that exists in the class that 
	inherits from the fightable object
	"""
	
	var _error = connect("die", self, "dying")

func _process(_delta):
	# TODO: time-dependency?
	if to_heal > 0:
		to_heal -= 1
		if actual_life < max_life:
			actual_life += 1

func is_dead() -> bool:
	"""
	Checks if this Object is dead
	"""
	if actual_life <= 0:
		return true
	else:
		return false

func is_alive() -> bool:
	"""
	Checks if this Object is alive
	"""
	return !is_dead()

func add_attack(attack : Attack):
	"""
	Adds attack to array
	"""
	if contains_attack(attack):
		return
	attacks.append(attack)

func contains_attack(attack : Attack):
	"""
	Checks if already has an attack
	"""
	for a in attacks:
		if a.id == attack.id:
			return true
	return false

func attack(attack_id : int, enemy : FightableObject, percent = null):
	"""
	Attacks an enemy
	"""
	if percent == null:
		enemy.hit(get_attack(attack_id).atk)
	else: 
		enemy.hit(get_attack(attack_id).atk * percent)
	enemy.update_life()

func heal(heal : int):
	"""
	heals itself
	"""
	if to_heal == 0:
		to_heal = heal

func get_attack(id : int):
	"""
	gets an attack
	"""
	for a in attacks:
		if a.id == id:
			return a

func hit(damage : int):
	"""
	Hits itself and checks for death
	"""
	# Play standartizied hit animation
	# rückstoß
	self.actual_life -= damage
	if !is_alive():
		die()

func die():
	"""
	Emits 'die' Signal
	"""
	print("fightableobject.gd: ", self.name, " is dead.")
	emit_signal("die")

func dying():
	# Play animation
	queue_free()
