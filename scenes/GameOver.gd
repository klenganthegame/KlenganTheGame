extends Node2D

func _ready():
	$AnimationPlayer.play("idle")
	$Klengan.play("walk_in")
	$CanvasLayer/Control/VBoxContainer/Load.grab_focus()


func _on_Load_pressed():
	pass # Replace with function body.


func _on_Menu_pressed():
	get_tree().change_scene(SCENES.Menu)
	pass # Replace with function body.
