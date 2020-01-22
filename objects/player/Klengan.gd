extends FightableObject

var velocity : Vector2 = Vector2()
var looking_right : bool = true

var can_move = true
var area : Area2D

var spawn : Vector2

var last_action_interactable : bool = false

signal dialogue_exit()

func _ready():
	max_life = 100
	actual_life = 50
	
	spawn = transform.get_origin()


func _process(delta):
	can_move = !$CanvasLayer/DialogueBox.block_walk
	if transform.origin.y > spawn.y + 1000 and !is_on_floor():
		transform.origin = spawn
		talk(["GameMaster: Uff... Das nächste Mal helfe ich dir nicht mehr aus der Patsche..."])
	
	if Input.is_action_just_pressed("accept"):
		talk_to_active_interactable()

func talk(text : Array):
	$CanvasLayer/DialogueBox.talk(text)
	$StateController._change_state("stagger")


func talk_to_active_interactable():
	if $CanvasLayer/DialogueBox.hidden and area != null: 
		var interactable = area.get_parent()
		if interactable.is_in_group("Interactable"):
			talk(interactable.dialogue)


func play_directional_animation(_anim_name, _looking_right = looking_right):
	if _looking_right != looking_right:
		set_looking_right(_looking_right)
	$AnimatedSprite.play(_anim_name)


func set_looking_right(_looking_right):
	looking_right = _looking_right
	$AnimatedSprite.flip_h = !looking_right


func _on_Area2D_area_entered(_area):
	area = _area


func _on_Area2D_area_exited(_area):
	area = null


func _on_DialogueBox_dialogue_exit():
	
	if last_action_interactable:
		var interactable = area.get_parent()
		interactable.interacted()
		last_action_interactable = false
	emit_signal("dialogue_exit")
