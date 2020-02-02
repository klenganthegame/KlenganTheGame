extends NinePatchRect

export var header : String = "header"
export var username : String = "none"
export var likes : int = 0
export var comments : int = 0
export var time_ago : String = "8 months"

export var Projectmanagement : bool = false
export var Organisation : bool = false
export var Gruppenleiter : bool = false
export var Programming : bool = false
export var Designer : bool = false
export var Storywriting : bool = false
export var Voiceactor : bool = false
export var Musik : bool = false
export var SFX : bool = false


func _enter_tree():
	$Likes.text = String(likes)
	$HBoxContainer2/Postedby.text += username
	$HBoxContainer2/Timeago.text = time_ago + " ago"
	$Header.text = header
	$HBoxContainer/cnumber.text = String(comments)
	if Projectmanagement:
		$HBoxContainer2/Projectmanagement.show()
	if Organisation:
		$HBoxContainer2/Organisation.show()
	if Gruppenleiter:
		$HBoxContainer2/Gruppenleiter.show()
	if Programming:
		$HBoxContainer2/Programming.show()
	if Designer:
		$HBoxContainer2/Designer.show()
	if Storywriting:
		$HBoxContainer2/Storywriting.show()
	if Voiceactor:
		$HBoxContainer2/Voiceactor.show()
	if Musik:
		$HBoxContainer2/Musik.show()
	if SFX:
		$HBoxContainer2/SFX.show()
	
	pass
