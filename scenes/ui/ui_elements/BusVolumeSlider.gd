tool
extends LabeledHSlider
class_name BusVolumeSlider

export(String) var audio_bus = AudioHandler.BUS_MASTER setget set_audio_bus


func _ready():
	var bus_id = AudioServer.get_bus_index(audio_bus)
	if bus_id != -1 and !Engine.is_editor_hint():
		set_value(db2linear(AudioServer.get_bus_volume_db(bus_id)) * 100)


func _on_BusVolumeSlider_value_changed(_value):
	if !Engine.is_editor_hint():
		AudioHandler.change_bus_volume(AudioServer.get_bus_index(audio_bus), _value / 100.0)


func set_audio_bus(_audio_bus):
	audio_bus = _audio_bus
	set_prefix(_audio_bus + ": ")


func _on_BusVolumeSlider_gui_input(event):
	if ((event is InputEventMouseButton and event.button_index == BUTTON_LEFT) \
	 or event is InputEventScreenTouch) \
	 and !Engine.is_editor_hint():
		if event.pressed:
			AudioHandler.play_in_bus("sounds.menu_button_pressed", AudioHandler.BUS_SOUNDS)
		else:
			AudioHandler.play_in_bus("sounds.menu_button_released", AudioHandler.BUS_SOUNDS)
