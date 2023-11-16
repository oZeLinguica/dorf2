extends ColorRect
@onready var bLeft = $Button2
@onready var bRight = $Button
@onready var sprite = $Hero
var currentSprite = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bLeft.is_hovered() && Input.is_action_just_pressed("mouse1"):
		currentSprite += 1
		print (currentSprite)
	if bRight.is_hovered() && Input.is_action_just_pressed("mouse1"):
		currentSprite -= 1
		print (currentSprite)

	if currentSprite < 1:
		currentSprite = 3
	if currentSprite > 3:
		currentSprite = 1
	
	if currentSprite == 1:
		sprite.texture = load("res://Asset/hero.png")
	elif currentSprite == 2:
		sprite.texture = load ("res://Asset/wizard.png")
	elif currentSprite == 3:
		sprite.texture = load("res://Asset/warrior.png")
	
	
