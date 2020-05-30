extends Node2D

onready var item_instance = preload("res://objects/mechanics/Item/Item.tscn")

signal spawned

func spawn_item(itemlist):
	# Todo 
	for item in itemlist:
		for n in range(0, item[1]):
			var item_node = item_instance.instance()
			item_node.id = item[0]
			item_node.connect("picked_item", self, "_add_item")
			get_parent().get_parent().add_child(item_node)
			item_node.position = get_parent().position + Vector2(0, -50) #e_rect().size / 2
	emit_signal("spawned")
	
func _add_coins(id, amount):
	# Add Items
	pass
