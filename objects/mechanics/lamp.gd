extends Node2D

export (Array, String) var dialogue  = ["NONE"]

func _ready():
	$off.hide()
	$on.show()
	pass

func _process(delta):
		$Area2D/CollisionShape2D.disabled = false

func _on_Area2D_area_entered(area):
	$off.show()
	$on.hide()

func _on_Area2D_area_exited(area):
	$on.show()
	$off.hide()