extends "res://scenes/objects/mechanics/finite_state_machine/State.gd"


func update(_delta):
	if owner.transform.origin.y > owner.spawn.y + 1000 && !owner.is_on_floor():
		owner.transform.origin = owner.spawn
		owner.talk(["Gott: Uff... Spring doch nicht... diesmal habe ich dich gerettet...", "Für Hilfe ruf bitte 0800-1110111 an...."])
		
		owner.hit(1)
