extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Klengan.talk(["Klengan: Okay... Also E oder Enter drücken um zu bestätigen...", 
	"Mit A & D laufen?", 
	"Und mit W oder SPACE springen?", 
	"Klingt machbar...", 
	"...",
	"*Telefon klingelt*",
	"Klengan: Hallo?",
	"Der Haider: Du kannst auch deinen Controller verwenden.",
	"A zum springen und X um zu Interagieren"])
	pass # Replace with function body.