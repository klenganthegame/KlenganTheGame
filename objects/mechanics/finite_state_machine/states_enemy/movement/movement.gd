extends "res://objects/mechanics/finite_state_machine/states_enemy/state_enemy.gd"

export(int) var GRAVITY = 40
export(int) var ACCELERATON = 50
export(int) var MAX_SPEED = 200
export(int)  var JUMP_VELOCITY = 800
export(float, 0, 1) var LERP_FACTOR = 0.4
var ATTACKS : Array = []

var velocity = Vector2()


func enter():
	velocity = owner.velocity


func exit():
	owner.velocity = velocity


func update(_delta):
	apply_forces()
	if velocity.x == 0 and owner.is_on_floor() and owner.focused_body == null:
		emit_signal("finished", "idle")


func apply_forces():
	if !owner.is_on_floor():
		velocity.y += GRAVITY

func _on_Player_detected(_player, _entered):
	._on_Player_detected(_player, _entered)
	if _entered:
		emit_signal("finished", "move")
