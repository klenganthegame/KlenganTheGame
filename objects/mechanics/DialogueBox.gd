extends NinePatchRect

export var wait_time = 0.02
var time : float

var text = ["Klengan:\nHallo Ich bin Klengan!", "wie geht es dir?", "Lululul"]
var num : int
var wait : bool

func _ready():
	reset()

func _process(delta):
	if Input.is_action_just_pressed("accept"):
		if wait == true:
			if num < len(text)-1:
				num += 1
				$RichTextLabel.text = text[num]
				to_beginning()

			elif $RichTextLabel.percent_visible == 1:
				hide()
				
		else:
			$RichTextLabel.percent_visible = 1

func reset():
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
	