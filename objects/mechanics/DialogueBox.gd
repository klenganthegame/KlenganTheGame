extends NinePatchRect

export var wait_time = 0.02
export var block_time = 0.3
var time : float

var text = []
var num : int
var wait : bool
var block_walk : bool
var hidden : bool

var block_box_timer : bool

func _ready():
	hidden = true
	pass

func talk(textarray : Array):
	"""
	Use this function to activate the DialogueBox
	"""
	text = textarray
	block_walk = true
	hidden = false
	num = 0
	$RichTextLabel.text = text[num]
	print("talk")
	to_beginning()
	show()

func _process(delta):
	if Input.is_action_just_pressed("accept") and !hidden:
		if wait == true:
			if num < len(text)-1:
				num += 1
				$RichTextLabel.text = text[num]
				to_beginning()

			elif $RichTextLabel.percent_visible == 1:
				num = 0
				wait == false
				$RichTextLabel.percent_visible = .05
				$InputBlocker.wait_time = block_time
				$InputBlocker.start()
				hide()
		else:
			$RichTextLabel.percent_visible = 1

func to_beginning():
	wait = false
	$Timer.wait_time = wait_time
	$RichTextLabel.percent_visible = 0.05
	$Timer.start()

func _on_Timer_timeout():
	if $RichTextLabel.percent_visible < 1:
		$RichTextLabel.percent_visible += .01
	else: 
		wait = true
	$Timer.start()

func _on_InputBlocker_timeout():
	print("schubi")
	hidden = true
	block_walk = false
	$Timer.stop()