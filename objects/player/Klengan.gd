extends FightableObject


var velocity : Vector2 = Vector2()
var looking_right : bool = true
var can_interact = false
var area : Area2D

var spawn : Vector2

var last_action_interactable : bool = false

signal dialogue_exit()

func _ready():
	max_life = 100
	actual_life = 50
	
	spawn = transform.get_origin()
	
	$CanvasLayer/Health.max_value = max_life
	$CanvasLayer/Health.value = actual_life
	

func _process(delta):
	$CanvasLayer/Health.value = actual_life
	
	if transform.origin.y > spawn.y + 1000 && !is_on_floor():
		transform.origin = spawn
		talk(["Gott: Uff... Was tust du..."])
		
		# for debug
		heal(40)
		#actual_life -= 30
		
	if Input.is_action_pressed("accept") and $CanvasLayer/DialogueBox.hidden and area != null:
		talk_to_interactable()


func play_directional_animation(_anim_name, _looking_right = looking_right):
	$AnimatedSprite.play(_anim_name)
	looking_right = _looking_right
	$AnimatedSprite.flip_h = !_looking_right


func talk(text : Array):
	$CanvasLayer/DialogueBox.talk(text)
	$StateMachine._change_state("stagger")


func talk_to_interactable():
	var interactable = area.get_parent()
	if interactable.is_in_group("Interactable"):
		$CanvasLayer/DialogueBox.talk(interactable.dialogue)
		last_action_interactable = true


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
