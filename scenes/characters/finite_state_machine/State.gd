extends Node
class_name State

signal finished(_next_state)


func _ready():
	randomize()


func enter():
	pass

func exit():
	pass

func update(_delta):
	pass

func _on_animation_finished(_anim_name):
	pass
