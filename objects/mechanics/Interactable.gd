extends Node2D
class_name InteractableObject

export (Array, String) var dialogue  = ["NONE"]
export var is_active : bool = true

signal interacted()

func _ready():
	$Sprite.hide()
	$AnimationPlayer.play("exclamation")
	pass

func _process(delta):
	if !is_active:
		$Area2D/CollisionShape2D.disabled = true
	else:
		$Area2D/CollisionShape2D.disabled = false

func _on_Area2D_area_entered(area):
	if is_active:
		$Sprite.show()

func _on_Area2D_area_exited(area):
	if is_active:
		$Sprite.hide()

func interacted():
	emit_signal("interacted")
