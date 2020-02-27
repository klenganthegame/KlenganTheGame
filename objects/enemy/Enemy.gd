extends FightableObject

export(float) var min_attack_cooldown = 0.5
export(float) var attack_cooldown_range = 1.5

var looking_right = true
var focused_body = null
var can_attack_player = false
var velocity = Vector2()

func _ready():
	$LifeBar.max_value = max_life
	$LifeBar.value = actual_life

func play_directional_animation(_anim_name, _looking_right = looking_right):
	$AnimatedSprite.play(_anim_name)
	set_looking_right(_looking_right)


func set_looking_right(_looking_right):
	looking_right = _looking_right
	# Flipping the scale of the sprite to change scale of its children
	$AnimatedSprite.scale = $AnimatedSprite.scale.abs() * Vector2(int(pow(-1, int(!_looking_right))), 1)


func start_attack_cooldown():
	var cooldown = min_attack_cooldown + randf() * attack_cooldown_range
	$AttackCooldown.start(cooldown)


func stop_attack_cooldown():
	$AttackCooldown.stop()


func _on_AttackCooldown_timeout():
	$StateMachine._change_state("attack")

func update_life():
	$LifeBar.value = actual_life

func dying():
	print("dead")
	# Play animation
	get_parent().queue_free()
	get_parent().remove_child(self)
