extends Button

@onready var pCharacterBody = $"../../../../player"

func _pressed():
	#pCharacterBody.d_movement_n(-1, 165)
	Input.action_press("move_ne")
