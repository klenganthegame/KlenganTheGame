"""
Has all paths as constants to all scenes for LevelChanger
"""
extends Node 

const MENU = "res://scenes/Menu.tscn"
const GAME_OVER = "res://scenes/GameOver.tscn"
const LEVEL_SELECTION = "res://scenes/LevelSelection/LevelSelection.tscn"
const LOADING = "res://scenes/Loading.tscn"
const CREDITS = "res://scenes/Credits/credits.tscn"

const LEVEL_0 = "res://scenes/level/0/Level0.tscn"
const LEVEL_1 = "res://scenes/level/1/Level1.tscn"

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
