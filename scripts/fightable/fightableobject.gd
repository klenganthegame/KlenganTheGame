extends KinematicBody2D
class_name FightableObject

export var max_life : int
export var actual_life : int
var attacks : Array

var to_heal : int = 0

func _process(_delta):
	# TODO: time-dependency?
	if to_heal > 0:
		to_heal -= 1
		if actual_life < max_life:
			actual_life += 1

func is_dead() -> bool:
	if actual_life <= 0:
		return true
	else:
		return false

func is_alive() -> bool:
		return !is_dead()

func add_attack(attack : Attack):
	if contains_attack(attack):
		return
	attacks.append(attack)

func contains_attack(attack : Attack):
	for a in attacks:
		if a.id == attack.id:
			return true
	return false

func attack(attack_id : int, enemy : FightableObject):
	enemy.hit(get_attack(attack_id).atk)

func heal(heal : int):
	if to_heal == 0:
		to_heal = heal

func get_attack(id : int):
	for a in attacks:
		if a.id == id:
			return a
			
func hit(damage : int):
	# Play standartizied hit animation
	# rückstoß
	self.actual_life -= damage
	
