extends Node2D

func _ready():
	AudioHandler.play_music("BackstageDancer")
	$Klengan.talk(["Okay... ",
	"Das ist also dieser...",
	"Backstage Bereich...",
	"Wie komm ich hier wieder weg?",
	"Ich glaube ich habe mich verlaufen..."])
