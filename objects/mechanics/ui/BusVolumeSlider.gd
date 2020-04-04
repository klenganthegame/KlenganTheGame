tool
extends LabeledHSlider
class_name BusVolumeSlider

export(String) var audio_bus = AudioHandler.BUS_MASTER setget set_audio_bus


func _ready():
	var bus_id = AudioServer.get_bus_index(audio_bus)
	if bus_id != -1:
		set_value(db2linear(AudioServer.get_bus_volume_db(bus_id)) * 100)


func _on_BusVolumeSlider_value_changed(_value):
	AudioHandler.change_bus_volume(AudioServer.get_bus_index(audio_bus), value / 100.0)


func set_audio_bus(_audio_bus):
	audio_bus = _audio_bus
	set_prefix(_audio_bus + ": ")
	AudioHandler.change_bus_volume(AudioServer.get_bus_index(audio_bus), value / 100.0)
