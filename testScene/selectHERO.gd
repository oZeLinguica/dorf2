extends Button
#script to script communication.
#script to script CONVERSATION!

var STR = 6
var INT = 3
var AGI = 4
var SOC = 4

var SIG = 13

func _process(delta):
	if button_pressed:
		
		#dumb name for a function but descriptive enough I guess
		game_start()
		
		
func game_start():
	#once the button is pressed we'll run this garbo. Make the root invisible.
	$"../..".visible = false
	
	#instantiate the main scene so we don't have a big fuckoff menu on the canvas port.
	var game_scene = preload("res://testScene/node_2d.tscn").instantiate()
	get_tree().get_root().add_child(game_scene)
	var setTexture = get_tree().get_root().get_node("Node2D/player/Sprite2D") #button has a pretty texture, so let's
	setTexture.set_texture(load("res://Asset/hero.png"))                     #set that on the character.
	
	#next line was hard to figure out, but this is the path I guess.
	var setav = get_tree().get_root().get_node("Node2D/player/ActorValue")
	
	#set the attributes to the values we defined on top.
	setav.strength = STR
	setav.intellect = INT
	setav.agility = AGI
	setav.social = SOC
	
	setav.signature = SIG
	
	
	

	
	get_tree().get_root().get_node("Node2D/CanvasLayer/Log").visible = true #make the log visible so it doesn't clip to shit.
	starter_gear()
	setav.set_params()#setav node has a script with this function, so we call it.
	setav.update_gear()
	$"../..".queue_free() #unload this scene cause we don't need it anymore.

func starter_gear():
	var starterInv = get_tree().get_root().get_node("Node2D/CanvasLayer/Inventory")
	var iconTexture = load("res://Asset/spritesheet_16x16.png")
	starterInv.defaultGearArray[0].get_child(0).texture = iconTexture
	starterInv.defaultGearArray[0].get_child(0).vframes = 22
	starterInv.defaultGearArray[0].get_child(0).hframes = 16
	starterInv.defaultGearArray[0].get_child(0).frame = 183
	
	starterInv.defaultGearArray[1].get_child(0).texture = iconTexture
	starterInv.defaultGearArray[1].get_child(0).vframes = 22
	starterInv.defaultGearArray[1].get_child(0).hframes = 16
	starterInv.defaultGearArray[1].get_child(0).frame = 64
	
	starterInv.defaultGearArray[2].get_child(0).texture = iconTexture
	starterInv.defaultGearArray[2].get_child(0).vframes = 22
	starterInv.defaultGearArray[2].get_child(0).hframes = 16
	starterInv.defaultGearArray[2].get_child(0).frame = 283
	
	starterInv.defaultGearArray[3].get_child(0).texture = iconTexture
	starterInv.defaultGearArray[3].get_child(0).vframes = 22
	starterInv.defaultGearArray[3].get_child(0).hframes = 16
	starterInv.defaultGearArray[3].get_child(0).frame = 2
	
	starterInv.defaultGearArray[4].get_child(0).texture = iconTexture
	starterInv.defaultGearArray[4].get_child(0).vframes = 22
	starterInv.defaultGearArray[4].get_child(0).hframes = 16
	starterInv.defaultGearArray[4].get_child(0).frame = 287
	
	starterInv.defaultGearArray[5].get_child(0).texture = iconTexture
	starterInv.defaultGearArray[5].get_child(0).vframes = 22
	starterInv.defaultGearArray[5].get_child(0).hframes = 16
	starterInv.defaultGearArray[5].get_child(0).frame = 336
	
	for i in starterInv.defaultGearArray:
		i.reparent(i.validNodeArray[0])
		i.validNodeArray[0].get_item()
		i.position = Vector2.ZERO
