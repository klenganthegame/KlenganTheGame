extends Node

var button : AudioStreamSample = load("res://resources/audio/button.wav")
var button_player : AudioStreamPlayer

func _ready():
	# Create Audio StreamPlayer
	button_player = AudioStreamPlayer.new()
		
	button.loop_mode = button.LOOP_DISABLED
	button.loop_begin = 0
	button.loop_end = 0
	
	button_player.stream = button
	add_child(button_player)

func play_button_sound():
	button_player.play(0)
	
	
