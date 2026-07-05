extends Area2D # Changed to Area2D for easier movement control

signal nextTile

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var textNum: int = 0
var animation: String = ""

func _ready() -> void:
	genRandTexture()

func genRandTexture() -> void:
	textNum = randi_range(1, 4)
	animation = str(textNum)
	animated_sprite.play(animation)

func _process(delta: float) -> void:
	# Make the arrow actually fall down the screen!
	position.y += Global.startSpeed * delta
	
	# If any relevant key is pressed, check if it matches this arrow
	if Input.is_action_just_pressed("down") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right") or Input.is_action_just_pressed("up"):
		if checkInput():
			Global.points1 += 5
			Global.increaseSpeed()
			print("Correct! Soup Score: " + str(Global.points1))
			destroy_and_next()
		else:
			print("Wrong key!")
			# Optional: add penalty to points2 here if Bernard is the opponent/bad guy

	# If the arrow falls off the bottom of the screen (e.g., Y > 700), miss!
	if position.y > 700:
		print("Missed!")
		destroy_and_next()

func checkInput() -> bool:
	if Input.is_action_just_pressed("down") and textNum == 1:
		return true
	if Input.is_action_just_pressed("left") and textNum == 2:
		return true
	if Input.is_action_just_pressed("right") and textNum == 3:
		return true
	if Input.is_action_just_pressed("up") and textNum == 4:
		return true
	return false

func destroy_and_next() -> void:
	nextTile.emit()
	queue_free()
