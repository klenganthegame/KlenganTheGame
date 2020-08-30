extends StateEnemyApproach
class_name StateEnemyApproachJump


func enter():
	.enter()
	velocity.y -= JUMP_VELOCITY


func update(_delta):
	.update(_delta)
	if owner.is_on_floor():
		emit_signal("finished", "approach")
