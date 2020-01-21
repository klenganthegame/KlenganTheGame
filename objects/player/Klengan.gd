extends KinematicBody2D

var velocity : Vector2 = Vector2()
var looking_right : bool = true

var can_move = true
var area : Area2D

var spawn : Vector2

signal dialogue_exit()

func _ready():
	spawn = transform.get_origin()

func _process(delta):
	can_move = !$CanvasLayer/DialogueBox.block_walk
	if transform.origin.y > spawn.y + 1000 && !is_on_floor():
		transform.origin = spawn
		talk(["GameMaster: Uff... Das nächste Mal helfe ich dir nicht mehr aus der Patsche..."])
	
	if Input.is_action_pressed("accept") and $CanvasLayer/DialogueBox.hidden and area != null:
		var interactable = area.get_parent()
		if interactable.is_in_group("Interactable"):
			$CanvasLayer/DialogueBox.talk(interactable.dialogue)


func play_directional_animation(_anim_name, _looking_right = looking_right):
	if _looking_right != looking_right:
		set_looking_right(_looking_right)
	$AnimatedSprite.play(_anim_name)


func set_looking_right(_looking_right):
	looking_right = _looking_right
	$AnimatedSprite.flip_h = !looking_right


func talk(text : Array):
	$CanvasLayer/DialogueBox.talk(text)


func _on_Area2D_area_entered(_area):
	area = _area


func _on_Area2D_area_exited(area):
	area = null


func _on_DialogueBox_dialogue_exit():
	emit_signal("dialogue_exit")
