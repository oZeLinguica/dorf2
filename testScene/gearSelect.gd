extends ColorRect
var gearSelectArray : Array
var otherSets : Array
# Called when the node enters the scene tree for the first time.
func _ready():
	gearSelectArray = [$Button, $Button2, $Button3, $Button4, $Button5, $Button6]
	otherSets += gearSelectArray

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for set in gearSelectArray:
		if set.disabled:
			pass
		
		elif set.button_pressed:
			otherSets.erase(set)
			if set not in otherSets:
				for other in otherSets:
					other.disabled = true
					other.modulate = Color(1,1,1,0.5)
		
		elif set not in otherSets && set.button_pressed == false:
			for other in otherSets:
				other.disabled = false
				other.modulate = Color(1,1,1,1)
			
			otherSets = []
			otherSets += gearSelectArray
