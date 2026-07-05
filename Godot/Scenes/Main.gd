extends Node2D

@onready var SoupScore: Label = $CanvasLayer/SoupScorePanel/SoupScore
@onready var BernardScore: Label = $CanvasLayer/BernardScorePanel/BernardScore

# Preload your Arrow/Tile scene so you can spawn new ones
@export var tile_scene: PackedScene 

func _ready() -> void:
	SoupScore.text = "Soup Score: 0"
	BernardScore.text = "Bernard Score: 0"
	spawn_tile()

func spawn_tile() -> void:
	if not tile_scene:
		print("Missing tile_scene in inspector!")
		return
		
	var new_tile = tile_scene.instantiate()
	# Give it a random X position between 100 and 900, and start at Y = 50
	var random_x = randi_range(100, 900)
	new_tile.position = Vector2(random_x, 50)
	
	# Connect the signal so when this tile dies, a new one spawns
	new_tile.nextTile.connect(spawn_tile)
	add_child(new_tile)

func _process(_delta: float) -> void:
	# Keep the UI updated with Global scores
	SoupScore.text = "Soup Score: " + str(Globals.points1)
	BernardScore.text = "Bernard Score: " + str(Globals.points2)
	
