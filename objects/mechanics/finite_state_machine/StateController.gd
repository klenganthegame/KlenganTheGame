extends Node

signal state_changed(current_state)

export(NodePath) var START_STATE

var states_map = {}
var states_stack = []
var current_state = null
var active = false setget set_active

func _ready():
	initialize_state_map()
	for child in get_children():
		child.connect("finished", self, "_change_state")
	initialize(START_STATE)


func initialize_state_map():
	pass


func initialize(start_state):
	set_active(true)
	states_stack.push_front(get_node(start_state))
	current_state = states_stack[0]
	current_state.enter()


func set_active(_active):
	active = _active
	set_physics_process(_active)
	set_process_input(_active)
	if !active:
		states_stack = []
		current_state = null


func _physics_process(delta):
	if active:
		current_state.update(delta)


func _on_animation_finished(anim_name = ""):
	if active:
		current_state._on_animation_finished(anim_name)


func _change_state(_state_name):
#	print("StateController.gd: Changing ", current_state.name , " to ", _state_name)
	if active:
		current_state.exit()
		
		if _state_name == "previous":
			states_stack.pop_front()
		else:
			states_stack[0] = states_map[_state_name]

		current_state = states_stack[0]
		emit_signal("state_changed", current_state)
		
		if _state_name != "previous":
			current_state.enter()
