extends Node2D
@onready var body: RigidBody2D = $RigidBody2D
@onready var animated_sprite: AnimatedSprite2D = $RigidBody2D/AnimatedSprite2D
var textNum = 0
var points1 = 0;
var points2 = 0;
var animation = ""

func _ready() -> void:
	genRandTexture()
	animated_sprite.play(animation)

func genRandTexture():
	textNum = randi_range(1, 4)
	animation = str(textNum)

func _process(_delta: float) -> void: 
	if checkInput():
		Globals.points1 += 5
		Globals.increaseSpeed()
		print("Soup Score: " + str(Globals.points1))
		queue_free()
		nextTile.emit()
	else:
		queue_free()
		nextTile.emit()
		
func checkInput(): 
	if Input.is_action_just_pressed("down")&&textNum==1:
		return true
	if Input.is_action_just_pressed("left")&&textNum==2:
		return true
	if Input.is_action_just_pressed("right")&&textNum==3:
		return true
	if Input.is_action_just_pressed("up")&&textNum==4:
		return true	
