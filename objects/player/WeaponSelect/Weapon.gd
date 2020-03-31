extends Button
class_name WeaponButton

export var key_id : int = 1
export var weapon_image : Texture = load("res://resources/sprites/test/bildfehlt.png")

func _enter_tree():
	$Num.text = str(key_id)

func unlock():
	self.icon = weapon_image
	
func _ready():
	pass

func select():
	$AnimationPlayer.play("select")
func unselect():
	$AnimationPlayer.play("unselect")
