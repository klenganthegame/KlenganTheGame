extends KinematicBody2D

export var speed : int = 200
export var GRAVITY : int = 20
export var ACCELERATON : int = 50
export var MAX_SPEED : int = 200
export var JUMP_HEIGTH : int = -550

var velocity : Vector2 = Vector2()
var motion : Vector2 = Vector2()
var looking_right : bool = true

var can_interact = false
var can_move = true
var area : Area2D

signal dialogue_exit()

func _ready():
	pass    

func _process(delta):
	can_move = !$CanvasLayer/DialogueBox.block_walk

	if can_interact and Input.is_action_pressed("accept") and $CanvasLayer/DialogueBox.hidden and area != null:
		var interactable = area.get_parent()
		if interactable.is_in_group("Interactable"):
			$CanvasLayer/DialogueBox.talk(interactable.dialogue)

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false

	if can_move:
		if Input.is_action_pressed("walk_right"):
			motion.x = min(motion.x + ACCELERATON, MAX_SPEED)
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("walk")
		
		elif Input.is_action_pressed("walk_left"):
			motion.x = max(motion.x - ACCELERATON, -MAX_SPEED)
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("walk")
		else:
			$AnimatedSprite.play("idle")
			friction = true
			motion.x = lerp(motion.x, 0, 0.2)
		
		if is_on_floor():
			if Input.is_action_pressed("jump"):
				motion.y = JUMP_HEIGTH
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.2)
			else:
				if friction == true:
					motion.x = lerp(motion.x, 0, 0.05)
		else:
			if motion.y-50 < 0:
				#$AnimatedSprite.play("jump") # Fall
				$CollisionShape2D.disabled = true
			else:
				#$AnimatedSprite.play("fall") # Jump
				$CollisionShape2D.disabled = false
				
	
		var collisions = move_and_collide(motion * delta) 
		# if collisions:
			#Input.start_joy_vibration(0, 0.5, 0.5, 0.5)
		motion = move_and_slide(motion,Vector2(0, -1))
	else:
		$AnimatedSprite.play("idle")

func talk(text : Array):
	$CanvasLayer/DialogueBox.talk(text)
	pass
	

func _on_Area2D_area_entered(_area):
	can_interact = true
	area = _area
	pass


func _on_Area2D_area_exited(area):
	can_interact = false
	area = null
	pass


func _on_DialogueBox_dialogue_exit():
	emit_signal("dialogue_exit")
	pass
