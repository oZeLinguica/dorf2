extends Node2D
@onready var rayArray = [$RayCast2D, $RayCast2D2, $RayCast2D3, $RayCast2D4, $RayCast2D5, $RayCast2D6, $RayCast2D7, $RayCast2D8]
@onready var eNav = $"../Sprite2D/NavigationAgent2D"
@onready var eRoot = $".."
@export var hostile : Node2D
var number
func _physics_process(delta):
	eNav.target_position = hostile.position
	oh_god_help()

	
func oh_god_help():
		for ray in rayArray.size():
			pass
