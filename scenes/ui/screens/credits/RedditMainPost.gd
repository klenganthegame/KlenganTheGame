tool
extends PanelContainer

# Represents a Reddit main post
# Add RedditAnswers under the ContentHBox (under BottomInfo)

# Main post text
export(String) var username = "anonymous" setget set_username
export(String) var header = "" setget set_header
export(String, MULTILINE) var post = "" setget set_post

# the subposts and if they are unfolded
export(bool) var unfolded = false setget set_unfolded
# add all subposts here to make them dependent of the variable unfolded
export(Array, NodePath) var unfolding_nodes = []  setget set_unfolding_nodes

# Number of likes, comments and date of the post
export(int) var likes = 0 setget set_likes
export(int) var comments = 0 setget set_comments
export(String) var time_ago = "a few seconds" setget set_time_ago

# If set to true the tag appears in the bottom of the main post
export(bool) var projectmanagement = false setget set_projectmanagement
export(bool) var organization  = false setget set_organization
export(bool) var group_manager = false setget set_group_manager
export(bool) var programming = false setget set_programming
export(bool) var designer = false setget set_designer
export(bool) var storywriter = false setget set_storywriter
export(bool) var voiceactor = false setget set_voiceactor
export(bool) var music = false setget set_music
export(bool) var sfx = false setget set_sfx


func _gui_input(_event):
	if (_event is InputEventMouseButton and _event.button_index == BUTTON_LEFT \
		 and !OS.has_touchscreen_ui_hint()) \
		 or (_event is InputEventScreenTouch):
		
		if _event.pressed:
			AudioHandler.play_sound("mouse_pressed")
		else:
			set_unfolded(!unfolded)
			AudioHandler.play_sound("mouse_released")


func set_header(_header):
	header = _header
	if has_node("HBox/ContentHBox/Header"):
		$HBox/ContentHBox/Header.text = _header


func set_username(_username):
	username = _username
	if has_node("HBox/ContentHBox/TopInfo/Postedby"):
		$HBox/ContentHBox/TopInfo/Postedby.text = "Posted by u/" + username


func set_unfolded(_unfolded):
	unfolded = _unfolded
	set_unfolding_nodes(unfolding_nodes)


func set_unfolding_nodes(_unfolding_nodes):
	unfolding_nodes = _unfolding_nodes
	for node_path in unfolding_nodes:
		if has_node(node_path):
			get_node(node_path).visible = unfolded


func set_post(_post):
	post = _post
	if has_node("HBox/ContentHBox/Post"):
		$HBox/ContentHBox/Post.text = _post


func set_likes(_likes):
	likes = _likes
	if has_node("HBox/Margin/Label"):
		$HBox/Margin/Label.text = String(likes)


func set_comments(_comments):
	comments = _comments
	if has_node("HBox/ContentHBox/BottomInfo/Comments"):
		$HBox/ContentHBox/BottomInfo/Comments.text = String(_comments) + " Comments"


func set_time_ago(_time_ago):
	time_ago = _time_ago
	if has_node("HBox/ContentHBox/TopInfo/Timeago"):
		$HBox/ContentHBox/TopInfo/Timeago.text = time_ago + " ago"


func set_projectmanagement(_projectmanagement):
	projectmanagement = _projectmanagement
	if has_node("HBox/ContentHBox/TopInfo/Projectmanagement"):
		$HBox/ContentHBox/TopInfo/Projectmanagement.visible = _projectmanagement


func set_organization(_organization):
	organization = _organization
	if has_node("HBox/ContentHBox/TopInfo/Organisation"):
		$HBox/ContentHBox/TopInfo/Organisation.visible = _organization


func set_group_manager(_group_manager):
	group_manager = _group_manager
	if has_node("HBox/ContentHBox/TopInfo/Gruppenleiter"):
		$HBox/ContentHBox/TopInfo/Gruppenleiter.visible = _group_manager


func set_programming(_programming):
	programming = _programming
	if has_node("HBox/ContentHBox/TopInfo/Programming"):
		$HBox/ContentHBox/TopInfo/Programming.visible = _programming


func set_designer(_designer):
	designer = _designer
	if has_node("HBox/ContentHBox/TopInfo/Designer"):
		$HBox/ContentHBox/TopInfo/Designer.visible = _designer


func set_storywriter(_storywriter):
	storywriter = _storywriter
	if has_node("HBox/ContentHBox/TopInfo/Storywriter"):
		$HBox/ContentHBox/TopInfo/Storywriter.visible = _storywriter


func set_voiceactor(_voiceactor):
	voiceactor = _voiceactor
	if has_node("HBox/ContentHBox/TopInfo/Voiceactor"):
		$HBox/ContentHBox/TopInfo/Voiceactor.visible = _voiceactor


func set_music(_music):
	music = _music
	if has_node("HBox/ContentHBox/TopInfo/Musik"):
		$HBox/ContentHBox/TopInfo/Musik.visible = _music


func set_sfx(_sfx):
	sfx = _sfx
	if has_node("HBox/ContentHBox/TopInfo/SFX"):
		$HBox/ContentHBox/TopInfo/SFX.visible = _sfx
