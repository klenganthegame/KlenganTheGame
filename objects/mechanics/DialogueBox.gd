extends NinePatchRect

export var wait_time = 0.02
export var block_time = 0.3
var time : float

var text = []
var num : int
var wait : bool
var block_walk : bool
var hidden : bool

func _ready():
	hidden = true
	pass

func talk(textarray : Array):
	"""
	Use this function to activate the DialogueBox
	"""
	text = textarray
	block_walk = true
	reset()

func _process(delta):
	if Input.is_action_just_pressed("accept") and !hidden:
		if wait == true:
			if num < len(text)-1:
				num += 1
				$RichTextLabel.text = text[num]
				to_beginning()

			elif $RichTextLabel.percent_visible == 1:
				hide_dialogue()
		else:
			$RichTextLabel.percent_visible = 1

func hide_dialogue():
	hide()
	block_walk = false
	$InputBlocker.wait_time = block_time
	$InputBlocker.start()
	num = 0

func reset():
	show()
	hidden = false
	num = 0
	$RichTextLabel.text = text[num]
	to_beginning()
	
func to_beginning():
	wait = false
	$Timer.wait_time = wait_time
	$RichTextLabel.percent_visible = 0
	$Timer.start()

func _on_Timer_timeout():
	if $RichTextLabel.percent_visible < 1:
		$RichTextLabel.percent_visible += .01
	else: 
		wait = true
	$Timer.start()

func _on_InputBlocker_timeout():
	hidden = true
