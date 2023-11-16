extends Button
@onready var nameField = $"../ColorRect/TextEdit"
@onready var checkNode = $"../.."
@onready var gearNode = $"../ColorRect4"
var checked = false
var geared = false
var currentGear


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for check in checkNode.sigChecks:
		if check.button_pressed == true:
			checked = true
			break
		else:
			checked = false
	
	for set in gearNode.gearSelectArray:
		if set.button_pressed == true:
			geared = true
			break
		else:
			geared = false

	if nameField.text != '' && checked == true && geared == true && checkNode.PTS == 0:
		disabled = false
	else:
		disabled = true


func _on_pressed():
	game_start()
	
func game_start():
	var STR = int($"../ColorRect2/strength/Label".text)
	var INT = int($"../ColorRect2/intellect/Label".text)
	var SOC = int($"../ColorRect2/social/Label".text)
	var AGI = int($"../ColorRect2/agiity/Label".text)
	
	var SIG: int
	for i in $"../..".sigChecks.size():
		if $"../..".sigChecks[i].button_pressed == true:
			SIG = (i)
		else:
			pass
	
	$"../..".visible = false
	
	#instantiate the main scene so we don't have a big fuckoff menu on the canvas port.
	var game_scene = preload("res://testScene/node_2d.tscn").instantiate()
	get_tree().get_root().add_child(game_scene)
	var setTexture = get_tree().get_root().get_node("Node2D/player/Sprite2D") #button has a pretty texture, so let's
	setTexture.set_texture($"../ColorRect/Hero".texture)
	
	var setav = get_tree().get_root().get_node("Node2D/player/ActorValue")
	
	setav.strength = STR
	setav.intellect = INT
	setav.social = SOC
	setav.agility = AGI
	
	setav.signature = (SIG + 1)
	
	for gear in gearNode.get_children():
		if gear is Button && gear.button_pressed:
			currentGear = gear
		else:
			pass
	#setav.set_signature()
	
	setav.set_params()#setav node has a script with this function, so we call it.
	starter_gear()
	setav.update_gear()
	print (setav.skillID[setav.signature -1])
	$"../..".queue_free() #unload this scene cause we don't need it anymore.


func starter_gear():
	var startItem = preload("res://testScene/itemButton.tscn")
	var starterInv = get_tree().get_root().get_node("Node2D/CanvasLayer/Inventory")
	var starterArray : Array
	
	
	for i in (currentGear.get_children().size() -1):
		if i > 5:
			break
		else:
			var itemNode = startItem.instantiate()
			get_tree().get_root().add_child(itemNode)
			starterArray.append(itemNode)
	
	for i in starterArray.size():
		starterArray[i].get_child(0).texture = currentGear.get_child(i+1).get_child(0).texture
		starterArray[i].get_child(0).vframes = currentGear.get_child(i+1).get_child(0).vframes
		starterArray[i].get_child(0).hframes = currentGear.get_child(i+1).get_child(0).hframes
		starterArray[i].get_child(0).frame = currentGear.get_child(i+1).get_child(0).frame
		starterArray[i].ac = currentGear.get_child(i+1).ac
		starterArray[i].at = currentGear.get_child(i+1).at
		starterArray[i].type = currentGear.get_child(i+1).type
		starterArray[i].wSkill = currentGear.get_child(i+1).wSkill
		
	for i in starterArray.size():
		starterArray[i].reparent(starterInv.get_node("ColorRect/Items/Row1").get_child(i))
		starterArray[i].type_set()
		starterArray[i].reparent(starterArray[i].validNodeArray[0])
		starterArray[i].validNodeArray[0].get_item()
		starterArray[i].position = Vector2.ZERO
