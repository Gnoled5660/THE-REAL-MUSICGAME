extends Node

var points1: int = 0
var points2: int = 0
var startSpeed: float = 100.0

func _ready() -> void:
	reset_game()

func reset_game() -> void:
	points1 = 0
	points2 = 0
	startSpeed = 100.0

func increaseSpeed() -> void:
	startSpeed *= 1.1
