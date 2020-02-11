extends FightableObject

var velocity : Vector2 = Vector2()
var looking_right : bool = true setget set_looking_right
var can_interact = false
var area : Area2D
var paused: bool = false
var spawn : Vector2
var dashed : bool = false
var dash: float = 0.01

var last_action_interactable : bool = false

signal dialogue_exit()

func _ready():
	max_life = 100
	actual_life = 50
	
	change_score_in_ui(500)
	
	spawn = transform.get_origin()
	
	$CanvasLayer/UI/Health.max_value = max_life
	$CanvasLayer/UI/Health.value = actual_life

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$CanvasLayer.toggle_pause()
	if dash <= 0.01:
		dash = 0.01
		dashed = false
	if Input.is_action_pressed("sneak") && dash < 1 && $StateMachine.current_state != $StateMachine.states_map["stagger"] && !dashed:
		dash *= 1.03
	elif dash > 0.01 && $StateMachine.current_state != $StateMachine.states_map["stagger"] || dashed:
		dash -= 0.01
	elif $StateMachine.current_state != $StateMachine.states_map["stagger"]:
		dash = 0.01
	$CanvasLayer/UI/StabiloDash.value = 100 * dash
	if Input.is_action_pressed("jump") && dash >= 0.94 && is_on_floor():
		$StateMachine._change_state("dash")
		dashed = true
	$CanvasLayer/UI/Health.value = actual_life
	if transform.origin.y > spawn.y + 1000 && !is_on_floor():
		transform.origin = spawn
		talk(["Gott: Uff... Was tust du..."])
		
		# for debug
		#heal(40)
		hit(10)
		
	if Input.is_action_just_pressed("accept") and is_on_floor():
		interact()
#	elif Input.is_action_just_pressed("ui_cancel"):
#		get_tree().paused = true


func play_directional_animation(_anim_name, _looking_right = looking_right):
	$AnimatedSprite.play(_anim_name)
	set_looking_right(_looking_right)


func set_looking_right(_looking_right):
	looking_right = _looking_right
	# Flipping the scale of the sprite to change scale of its children
	$AnimatedSprite.scale = $AnimatedSprite.scale.abs() * Vector2(int(pow(-1, int(!_looking_right))), 1)


func talk(text : Array):
	if $CanvasLayer/DialogueBox.hidden:
		$CanvasLayer/DialogueBox.talk(text)
		$StateMachine._change_state("stagger")


func interact():
	if area != null:
		var interactable = area.get_parent()
		if interactable.is_in_group("Teleportation"):
			LevelChanger.change_level_to(interactable.target_level)
			last_action_interactable = true
		elif interactable.is_in_group("Interactable"):
			talk(interactable.dialogue)
			last_action_interactable = true
			$StateMachine._change_state("stagger")


func _on_Area2D_area_entered(_area):
	area = _area


func _on_Area2D_area_exited(_area):
	if area == _area:
		area = null


func _on_DialogueBox_dialogue_exit():
	if last_action_interactable:
		var interactable = area.get_parent()
		interactable.interacted()
		last_action_interactable = false
	emit_signal("dialogue_exit")


func set_AttackCollision_disabled(_disabled):
	$AnimatedSprite/AttackArea/AttackCollision.disabled = _disabled


func change_score_in_ui(score : int):
	$CanvasLayer/UI/ScoreLabel.text = "score: " + str(score)

