tool
extends LabeledHSlider

export(String) var audio_bus = AudioHandler.BUS_MASTER setget set_audio_bus


func _on_LabeledHSlider_value_changed(_value):
	._on_LabeledHSlider_value_changed(_value)
	if !Engine.is_editor_hint():
		AudioHandler.change_bus_volume(AudioServer.get_bus_index(audio_bus), value / 100.0)


func set_audio_bus(_audio_bus):
	audio_bus = _audio_bus
	set_prefix(_audio_bus + ": ")
	if !Engine.is_editor_hint():
		AudioHandler.change_bus_volume(AudioServer.get_bus_index(audio_bus), value / 100.0)
