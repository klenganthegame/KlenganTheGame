"""
Has all paths as constants to all scenes for LevelChanger
"""
extends Node 

const MENU = "res://scenes/ui/screens/main_menu/MainMenu.tscn"
const GAME_OVER = "res://scenes/ui/screens/game_over/GameOver.tscn"
const LEVEL_SELECTION = "res://scenes/ui/screens/level_selection/LevelSelection.tscn"
const LOADING = "res://scenes/ui/screens/loading_screen/LoadingScreen.tscn"
const CREDITS = "res://scenes/ui/screens/credits/Credits.tscn"

const LEVEL_0 = "res://scenes/levels/0/Level0.tscn"
const LEVEL_1 = "res://scenes/levels/1/Level1.tscn"

var LEVELS = {
	0 : {
		"name" : "Backstage",
		"path" : LEVEL_0
	},
	1 : {
		"name" : "Level 1",
		"path" : LEVEL_1
		}
	}

