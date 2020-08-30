extends StateEnemyMovement
class_name StateEnemyDamage

var stagger_timer

func enter():
	.enter()
	throw_back()
	#TODO play Animation and replace with timer
	stagger_timer = Timer.new()
	stagger_timer.one_shot = true
	stagger_timer.connect("timeout", self, "_on_StaggerTimer_timeout")
	add_child(stagger_timer)
	stagger_timer.start(0.5)


func throw_back():
	velocity.x += JUMP_VELOCITY * pow(-1, int(owner.looking_right))
	velocity.y = -JUMP_VELOCITY


func update(_delta):
	.update(_delta)
	apply_forces()
	velocity = owner.move_and_slide(velocity, Vector2(0, -1))


func _on_StaggerTimer_timeout():
	emit_signal("finished", "approach")
