extends KinematicBody2D

signal dialogue_exit()

var velocity : Vector2 = Vector2()

var can_interact = false
var can_move = true
var area : Area2D
var looking_right = false setget set_looking_right
var spawn_pos : Vector2


func _ready():
	spawn_pos = transform.get_origin()


func play_directional_animation(_animation_name, _look_direction = looking_right):
	$AnimatedSprite.play(_animation_name)
	set_looking_right(_look_direction)


func set_looking_right(_looking_right):
	looking_right = _looking_right
	$AnimatedSprite.flip_h = !looking_right


func talk(text : Array):
	$CanvasLayer/DialogueBox.talk(text)


func _on_Area2D_area_entered(_area):
	can_interact = true
	area = _area


func _on_Area2D_area_exited(_area):
	can_interact = false
	area = null


func _on_DialogueBox_dialogue_exit():
	emit_signal("dialogue_exit")