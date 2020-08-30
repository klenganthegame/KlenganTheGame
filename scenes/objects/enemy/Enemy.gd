extends FightableObject

export(float) var min_attack_cooldown = 0
export(float) var attack_cooldown_range = 1
export(Array) var item_list = [[0,2], [1,3]]

onready var enemy_sound_player = $EnemySoundsPlayer


var looking_right = false
var focused_body = null
var can_attack_player = false
var velocity = Vector2()
var spawn = Vector2()


func _ready():
	add_attack(Attack.new(ENEMY_ATTACKS.NORMAL, 1, 5, 50))
	add_attack(Attack.new(ENEMY_ATTACKS.DISTANCE, 1, 5, 50))
	$LifeBar.max_value = max_life
	$LifeBar.value = actual_life
	spawn = transform.get_origin()


func play_directional_animation(_anim_name, _looking_right = looking_right):
	$AnimatedSprite.play(_anim_name)
	set_looking_right(_looking_right)


func set_looking_right(_looking_right):
	looking_right = _looking_right
	$AnimatedSprite.flip_h = !looking_right
	$Collision.position.x = pow(-1, int(!_looking_right)) * abs($Collision.position.x)
	$AttackArea.position.x = pow(-1, int(!_looking_right)) * abs($AttackArea.position.x)
	$DetectionArea.position.x = pow(-1, int(!_looking_right)) * abs($DetectionArea.position.x)


func play_local_sound(_sound_name):
	var sound = AudioLoader.get_sound(_sound_name)
	if sound != null:
		enemy_sound_player.stream = sound
		enemy_sound_player.play()


func start_attack_cooldown():
	var cooldown = min_attack_cooldown + randf() * attack_cooldown_range
	$AttackCooldown.start(cooldown)


func stop_attack_cooldown():
	$AttackCooldown.stop()


func _on_AttackCooldown_timeout():
	$StateMachine._change_state("attack")


func update_life():
	$LifeBar.value = actual_life


func hit(damage : int):
	.hit(damage)
	if AudioLoader.local_stereo_enabled:
		play_local_sound("enemy_hurt")
	else:
		AudioHandler.play_sound("enemy_hurt")
	$StateMachine._change_state("damage")

func die():
	$ItemFactory.spawn_item(item_list)
	yield($ItemFactory, "spawned")
	queue_free()
