extends Node2D

onready var item_instance = preload("res://objects/mechanics/Item/Item.tscn")

func spawn_item(id, val):
	for n in range(val):
		var item = item_instance.instance()
		item.id = id
		item.connect("picked_item", self, "_add_item")
		add_child(item)

func _add_coins(id, amount):
	# Add Items
	pass
