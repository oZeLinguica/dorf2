extends Button

@onready var pCharacterBody = $"../../../../player"

func _pressed():
	#pCharacterBody.x_movement(1, 165)
	Input.action_press("move_right")
