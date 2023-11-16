extends RayCast2D
@onready var enemyRoot = $".."
@onready var playerRoot = $"../../player"
@onready var eNav = $"../Sprite2D/NavigationAgent2D"
var keyArray
var UIArray
const rayTile = 16

# Called when the node enters the scene tree for the first time.
func _ready():
	keyArray = ["move_down", "move_left", "move_right", "move_up", "move_se", "move_ne", "move_nw", "move_sw"]
	#UIArray = [$"../../CanvasLayer/Log/CenterButton/SButton", $"../../CanvasLayer/Log/CenterButton/EButton", $"../../CanvasLayer/Log/CenterButton/WButton", $"../../CanvasLayer/Log/CenterButton/NButton",$"../../CanvasLayer/Log/CenterButton/SEButton",$"../../CanvasLayer/Log/CenterButton/NEButton",$"../../CanvasLayer/Log/CenterButton/NWButton",$"../../CanvasLayer/Log/CenterButton/SWButton"]
	


# Called every frame. 'delta' is the elaped time since the previous frame.

					
func _physics_process(delta):
	for key in keyArray.size():
		if position.distance_to(eNav.get_next_path_position()) > 16:
			print (position.distance_to(eNav.get_next_path_position()))
				
				
				
