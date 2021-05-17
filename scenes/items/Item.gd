extends RigidBody2D

var id = 0
var amount = 1

signal picked_item(_id, _amount)

func _ready():
	randomize()
	linear_velocity.x = randi()%1500
	
	randomize()
	var neg = randi()%2
	
	randomize()
	#$Timer.wait_time = randi()%10+3
	#$Timer.start()
	if neg != 0:
		linear_velocity.x *= -1
		
	$AnimationPlayer.play("spawn")

func _on_Area2D_mouse_entered():
	$AnimationPlayer.play("clicked")


func _clicked():
	emit_signal("picked_item", id, amount)
	print("Item :: Picked " + String(id) + " ammount: " + String(amount))
	queue_free()
