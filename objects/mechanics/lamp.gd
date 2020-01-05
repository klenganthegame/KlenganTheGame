extends Node2D

export var message_sound : AudioStreamSample = load("res://resources/audio/button.wav")
var audio : AudioStreamPlayer

export var is_on : bool = false

func _ready():
	message_sound.loop_mode = message_sound.LOOP_DISABLED
	message_sound.loop_begin = 0
	message_sound.loop_end = 0
	
	audio = AudioStreamPlayer.new()
	audio.stream = message_sound
	add_child(audio)
	
	if is_on:
		on()
	else:
		off()

func on():
	$off.hide()
	$on.show()
	
func off():
	$off.show()
	$on.hide()
	
func trigger():
	audio.play(0)
	is_on = !is_on
	if is_on:
		on()
	else:
		off()