extends Node

var points1 = 00
var points2 = 00
var startSpeed = 100

func _ready() -> void:
	points1 = 0
	points2 = 0
	startSpeed = 100

func increaseSpeed():
	startSpeed *= 1.1
