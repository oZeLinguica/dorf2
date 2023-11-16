extends Button
var STR = 2
var INT = 6
var AGI = 4
var SOC = 2

var SIG = 1

func _process(delta):
	if button_pressed:
		game_start()
		
		
func game_start():
	$"../..".visible = false
	var game_scene = preload("res://testScene/node_2d.tscn").instantiate()
	get_tree().get_root().add_child(game_scene)
	var setTexture = get_tree().get_root().get_node("Node2D/player/Sprite2D")
	setTexture.set_texture(load("res://Asset/wizard.png"))
	var setav = get_tree().get_root().get_node("Node2D/player/ActorValue")
	setav.strength = STR
	setav.intellect = INT
	setav.agility = AGI
	setav.social = SOC
	
	setav.signature = SIG
	
	#setav.set_params()
	#get_tree().get_root().get_node("Node2D/CanvasLayer/Log").visible = true
	#load_inventory()
	starter_gear()
	setav.set_params()#setav node has a script with this function, so we call it.
	setav.update_gear()
	
	get_tree().get_root().get_node("Node2D/CanvasLayer/Log").visible = true #make the log visible so it doesn't clip to shit.
	$"../..".queue_free() #unload this scene cause we don't need it anymore.

#func load_inventory():
#	var inventory = preload("res://testScene/inventory.tscn").instantiate()
#	get_tree().get_root().get_node("Node2D/CanvasLayer").add_child(inventory)
#	get_tree().get_root().get_node("Node2D/CanvasLayer/inventory").visible = false

func starter_gear():
	var starterInv = get_tree().get_root().get_node("Node2D/CanvasLayer/Inventory")
	var iconTexture = load("res://Asset/spritesheet_16x16.png")
	for i in starterInv.defaultGearArray:
		if i == starterInv.defaultGearArray[0]:
			i.get_child(0).texture = iconTexture
			i.get_child(0).vframes = 22
			i.get_child(0).hframes = 16
			i.get_child(0).frame = 181
			
		if i == starterInv.defaultGearArray[1]:
			i.get_child(0).texture = iconTexture
			i.get_child(0).vframes = 22
			i.get_child(0).hframes = 16
			i.get_child(0).frame = 63
		
		if i == starterInv.defaultGearArray[2]:
			i.get_child(0).texture = iconTexture
			i.get_child(0).vframes = 22
			i.get_child(0).hframes = 16
			i.get_child(0).frame = 283
			
		if i == starterInv.defaultGearArray[3]:
			i.get_child(0).texture = iconTexture
			i.get_child(0).vframes = 22
			i.get_child(0).hframes = 16
			i.get_child(0).frame = 0
			
		if i == starterInv.defaultGearArray[4]:
			i.queue_free()
			
		if i == starterInv.defaultGearArray[5]:
			i.get_child(0).texture = iconTexture
			i.get_child(0).vframes = 22
			i.get_child(0).hframes = 16
			i.get_child(0).frame = 325
	
	for i in starterInv.defaultGearArray:
		i.reparent(i.validNodeArray[0])
		i.validNodeArray[0].get_item()
		i.position = Vector2.ZERO
