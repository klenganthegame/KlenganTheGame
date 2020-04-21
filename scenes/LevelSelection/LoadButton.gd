tool
extends GameTextureButton
class_name LoadButton

const PORTRAIT_PATH_FORMAT = "res://resources/sprites/level_selection/boss_level_%1d_%s.png"
const LEVEL_SCENE_FORMAT = "res://level/1/Level%1d.tscn"
const LEVEL_FORMAT = "LEVEL %1d"

enum LOCK_STATES {UNLOCKED, LOCKED, TBA}


export(int) var level_to_load = 0 setget set_level_to_load
export(bool) var boss_unknown = true setget set_boss_unknown
export(bool) var locked = false setget set_locked
export(bool) var coming_soon = false setget set_coming_soon


func _ready():
	set_level_to_load(level_to_load)


func load_boss_portrait():
	var new_portrait
	if boss_unknown:
		new_portrait = load(PORTRAIT_PATH_FORMAT % [level_to_load, "unknown"])
	else:
		new_portrait = load(PORTRAIT_PATH_FORMAT % [level_to_load, "known"])
	set_boss_portrait(new_portrait)


func set_level_to_load(_level_to_load):
	level_to_load = _level_to_load
	if !Engine.is_editor_hint() and SCENES.LEVELS.has(level_to_load):
		load_boss_portrait()
		if has_node("LevelLabel"):
			$LevelLabel.text = SCENES.LEVELS[level_to_load]["name"]
	else:
		if has_node("LevelLabel"):
			$LevelLabel.text = LEVEL_FORMAT % level_to_load


func set_boss_unknown(_boss_unknown):
	boss_unknown = _boss_unknown
	load_boss_portrait()
	if SCENES.LEVELS.has(level_to_load):
		set_boss_portrait($BossPortrait.texture)


func set_locked(_locked):
	locked = _locked
	if has_node("Margin/LockedOverlay"):
		$Margin/LockedOverlay.visible = (_locked and !coming_soon)
		disabled = locked or coming_soon


func set_coming_soon(_coming_soon):
	coming_soon = _coming_soon
	if has_node("Margin/ComingSoonOverlay"):
		$Margin/ComingSoonOverlay.visible = coming_soon
		$Margin/LockedOverlay.visible = (locked and !_coming_soon)
		$BossPortrait.visible = !_coming_soon
		disabled = locked or coming_soon


func set_boss_portrait(_boss_portrait):
	if has_node("BossPortrait"):
		$BossPortrait.texture = _boss_portrait


func _on_LoadButton_button_up():
	if SCENES.LEVELS.has(level_to_load):
		LevelChanger.change_level_to(SCENES.LEVELS[level_to_load]["path"])
