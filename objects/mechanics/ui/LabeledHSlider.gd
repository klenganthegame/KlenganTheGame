tool
extends HSlider
class_name LabeledHSlider

export(String) var prefix = "" setget set_prefix
export(String) var postfix = "" setget set_postfix


func _on_LabeledHSlider_value_changed(_value):
	if has_node("ValueLabel"):
		$ValueLabel.text = prefix + str(_value) + postfix


func set_prefix(_prefix):
	prefix = _prefix
	_on_LabeledHSlider_value_changed(value)


func set_postfix(_postfix) :
	postfix = _postfix
	_on_LabeledHSlider_value_changed(value)
