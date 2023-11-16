extends Button

var STR = 6
var INT = 2
var AGI = 5
var SOC = 2

var SIG = 12
func _process(delta):
	if button_pressed:
		game_start()
		
		
func game_start():
	$"../..".visible = false
	var game_scene = preload("res://testScene/node_2d.tscn").instantiate()
	get_tree().get_root().add_child(game_scene)
	var setTexture = get_tree().get_root().get_node("Node2D/player/Sprite2D")
	setTexture.set_texture(load("res://Asset/warrior.png"))
	var setav = get_tree().get_root().get_node("Node2D/player/ActorValue")
	setav.strength = STR
	setav.intellect = INT
	setav.agility = AGI
	setav.social = SOC
	
	setav.signature = SIG
	
	setav.set_params()
	
	#get_tree().get_root().get_node("Node2D/CanvasLayer/Log").visible = true
	#load_inventory()
	setav.set_params()#setav node has a script with this function, so we call it.
	setav.update_gear()
	
	get_tree().get_root().get_node("Node2D/CanvasLayer/Log").visible = true #make the log visible so it doesn't clip to shit.
	$"../..".queue_free() #unload this scene cause we don't need it anymore.

func load_inventory():
	var inventory = preload("res://testScene/inventory.tscn").instantiate()
	get_tree().get_root().get_node("Node2D/CanvasLayer").add_child(inventory)
	get_tree().get_root().get_node("Node2D/CanvasLayer/inventory").visible = false
