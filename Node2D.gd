extends Node2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var right: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if(right):
		emit_signal("right_wall_touched")
	else:
		emit_signal("left_wall_touched")
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	if(right):
		emit_signal("right_wall_left")
	else:
		emit_signal("left_wall_left")
	pass # Replace with function body.
