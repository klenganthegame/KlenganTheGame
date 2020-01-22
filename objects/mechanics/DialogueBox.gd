extends NinePatchRect

export var wait_time = 0.2
export var block_time = 0.3

var text_speed : float = 0.01

var text = []
var num : int
var wait : bool = false
var block_walk : bool
var hidden : bool = true

var audio : AudioStreamPlayer
var audioShouldPlay : bool = true

var block_box_timer : bool

signal dialogue_exit()


func _ready():
	audio = AudioStreamPlayer.new()
	add_child(audio)
	audio.stream = load("res://audio/ui/Message.ogg")


func talk(textarray : Array):
	"""
	Use this function to activate the DialogueBox
	"""
	text = textarray
	block_walk = true
	num = 0
	$RichTextLabel.text = text[num]
	show()
	to_beginning()


func _process(delta):
	if hidden:
		return
	
	if !audio.playing && audioShouldPlay:
		audio.play(0)
		
	if Input.is_action_just_pressed("accept"):
		if wait == true:
			if $RichTextLabel.percent_visible != 1:
				$RichTextLabel.percent_visible = 1
				return
			if num < len(text) - 1:
				num += 1
				$RichTextLabel.text = text[num]
				to_beginning()
			elif $RichTextLabel.percent_visible == 1:
				num = 0
				$RichTextLabel.percent_visible = .05
				hide()
				$InputBlocker.wait_time = block_time
				$InputBlocker.start()


func to_beginning():
	text_speed = 1.0 / $RichTextLabel.text.length()
	$Timer.wait_time = wait_time
	$RichTextLabel.percent_visible = 0.05
	
	wait = false
	hidden = false
	audioShouldPlay = true
	
	$Timer.start()


func _on_Timer_timeout():
	if $RichTextLabel.percent_visible < 1:
		$RichTextLabel.percent_visible += text_speed
	else:
		audioShouldPlay = false
		audio.stop()
	wait = true


func _on_InputBlocker_timeout():
	hidden = true
	block_walk = false
	$Timer.stop()
	audio.stop()
	emit_signal("dialogue_exit")