extends Control
var defaultGearArray : Array

func _ready():
	$ColorRect.visible = false
	defaultGearArray = [$ColorRect/Items/Row1/ColorRect8/Button,$ColorRect/Items/Row1/ColorRect9/Button, $ColorRect/Items/Row1/ColorRect10/Button, $ColorRect/Items/Row1/ColorRect11/Button, $ColorRect/Items/Row1/ColorRect13/Button]
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $ColorRect.visible == false && Input.is_action_just_pressed("inventory"):
		$ColorRect.visible = true
	elif $ColorRect.visible == true && Input.is_action_just_pressed("inventory"):
		$ColorRect.visible = false
