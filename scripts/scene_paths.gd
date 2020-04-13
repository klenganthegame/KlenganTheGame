"""
Has all paths as constants to all scenes for LevelChanger
"""
extends Node 

const Menu = "res://scenes/Menu.tscn"
const GameOver = "res://scenes/GameOver.tscn"
const Loading = "res://scenes/Loading.tscn"
const Credits = "res://scenes/Credits/Credits.tscn"

const Level0 = "res://level/0/Level0.tscn"
const Level1 = "res://level/1/Level1.tscn"

var LEVELS = {
	0 : {
		"name" : "Backstage",
		"path" : Level0
	},
	1 : {
		"name" : "Level 1",
		"path" : Level1
		}
	}
