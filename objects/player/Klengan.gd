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

func _enter_tree():
	# TODO: Optimize
	attacks = [
		# ID, ATK, RELOAD_TIME, DISTANCE
		Attack.new(KLENGAN_ATTACKS.NORMAL, 1, 5, 50),
		Attack.new(KLENGAN_ATTACKS.DASH, 10, 5, 50),
		Attack.new(KLENGAN_ATTACKS.HARPUNE, 10, 5, 50),
		]


func _ready():
	if !GlobalVars.is_touch():
		$CanvasLayer/TouchControlls.hide()
	update_life()
	update_life()
	
	change_score_in_ui(500)
	
	spawn = transform.get_origin()


func _process(_delta):
	if dash <= 0.01:
		dash = 0.01
		dashed = false
	if Input.is_action_pressed("sneak") && dash < 1 && $StateMachine.current_state != $StateMachine.states_map["stagger"] && !dashed:
		dash *= 1.02
		#dash *= 100  #for debug purposes
	elif dash > 0.01 && $StateMachine.current_state != $StateMachine.states_map["stagger"] || dashed:
		dash -= 0.01
	elif $StateMachine.current_state != $StateMachine.states_map["stagger"]:
		dash = 0.01
	$CanvasLayer/UI/StabiloDash.value = 100 * dash
	if Input.is_action_pressed("jump") && dash >= 0.94 && is_on_floor():
		$StateMachine._change_state("dash")
		dashed = true
	$CanvasLayer/UI/Health.value = actual_life


func play_directional_animation(_anim_name, _looking_right = looking_right):
	$AnimatedSprite.play(_anim_name)
	set_looking_right(_looking_right)


func set_looking_right(_looking_right):
	looking_right = _looking_right
#	$AnimatedSprite.scale = $AnimatedSprite.scale.abs() * Vector2(int(pow(-1, int(!_looking_right))), 1)
	$AnimatedSprite.flip_h = !looking_right
	$Collision.position.x = pow(-1, int(!_looking_right)) * abs($Collision.position.x)
	$AttackArea.position.x = pow(-1, int(!_looking_right)) * abs($AttackArea.position.x)


func talk(_text : Array):
	if !$CanvasLayer/DialogueBox.visible:
		$CanvasLayer/DialogueBox.talk(_text)
		$StateMachine._change_state("stagger")


func interact():
	if area != null:
		var interactable = area.get_parent()
		if interactable.is_in_group("Teleportation"):
			if SCENES.LEVELS.has(interactable.target_level):
				var level_path = SCENES.LEVELS[interactable.target_level]["path"]
				LevelChanger.change_level_to(level_path)
				last_action_interactable = true
		elif interactable.is_in_group("Interactable"):
			talk(interactable.dialogue)
			last_action_interactable = true


func _on_Area2D_area_entered(_area):
	area = _area


func _on_Area2D_area_exited(_area):
	if area == _area:
		area = null


func _on_DialogueBox_dialogue_exit():
	if last_action_interactable and area != null:
		var interactable = area.get_parent()
		interactable.interacted()
		last_action_interactable = false
	emit_signal("dialogue_exit")


func set_AttackCollision_disabled(_disabled):
	$AttackArea/AttackCollision.disabled = _disabled


func set_DashCollision_disabled(_disabled):
	$DashArea/DashCollision.disabled = _disabled


func change_score_in_ui(score : int):
	$CanvasLayer/UI/ScoreLabel.text = "score: " + str(score)


func hit(damage : int):
	.hit(damage)
	AudioHandler.play_sound("klengan_hurt")

func dying():
	$CanvasLayer/PauseMenu.play("die")


func die():
	get_tree().change_scene(SCENES.GAME_OVER)


func update_life():
	$CanvasLayer/UI/Health.max_value = max_life
	$CanvasLayer/UI/Health.value = actual_life
