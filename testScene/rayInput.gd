extends RayCast2D
const RAY = 16
func _process(delta):
	var xInput = Input.get_axis("ui_left", "ui_right")
	if (Input.is_action_just_pressed("ui_left") || Input.is_action_just_pressed("ui_right")):
		target_position = Vector2((RAY * xInput), 0)
	
	var yInput = Input.get_axis("ui_up", "ui_down")
	if (Input.is_action_just_pressed("ui_up") || Input.is_action_just_pressed("ui_down")):
		target_position = Vector2(0, (RAY * yInput))
