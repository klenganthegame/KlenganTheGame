extends Control

signal closed()

func show_controlls():
	$Back.grab_focus()
	$AnimationPlayer.play("show")

func hide_controlls():
	$AnimationPlayer.play("hide")
	emit_signal("closed")


func _on_Back_pressed():
	hide_controlls()
	pass # Replace with function body.
