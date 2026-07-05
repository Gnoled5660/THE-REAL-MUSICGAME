extends Node2D

@onready var tile: Node2D = $Tile
@onready var SoupScore: Label = $CanvasLayer/SoupScorePanel/SoupScore
@onready var BernardScore: Label = $CanvasLayer/BernardScorePanel/BernardScore

var number = 0
var pos = 100

func _ready() -> void:
	setTile()
	SoupScore.text = "Soup Score: "
	BernardScore.text = "Bernard: "

func setTile():
	pos = randi_range(100, 900)

func _process(_delta: float):
	tile.position = global_position + Vector2(pos, 50)
	SoupScore.text = "Soup Score: " + str(Global.points1)
	BernardScore.text = "Bernard Score: " + str(Global.points2)
	
