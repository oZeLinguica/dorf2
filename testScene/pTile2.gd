extends CharacterBody2D
@onready var tileMap = $"../Map/TileMap"
var xInput
var yInput
var dInputN
var dInputS 
@onready var hBar = $pHealthBar
@onready var log = $"../CanvasLayer/Log/RichTextLabel"
@onready var actorData = $ActorValue

func _process(delta):
	hBar_mgmt()

func _physics_process(delta):

	if Input.is_action_just_pressed("move_left"):
		xInput = -1
	elif Input.is_action_just_pressed("move_right"):
		xInput = 1
	else:
		xInput = 0
	

	if Input.is_action_just_pressed("move_down"):
		yInput = 1
	elif Input.is_action_just_pressed("move_up"):
		yInput = -1
	else:
		yInput = 0
	
	

	if Input.is_action_just_pressed("move_sw"):
		xInput = -1
		yInput = 1
	elif Input.is_action_just_pressed("move_ne"):
		xInput = 1
		yInput = -1

	

	if Input.is_action_just_pressed("move_se"):
		xInput = 1
		yInput = 1
	elif Input.is_action_just_pressed("move_nw"):
		xInput = -1
		yInput = -1

	
	dir_mgmt()

func dir_mgmt():
	if yInput || xInput || dInputN || dInputS:
		var currentTile = tileMap.get_cell_tile_data(0, Vector2i(position.x, position.y) /16)
		#currentTile.z_index = 1
		var nexTile = tileMap.get_cell_tile_data(0, Vector2i(position.x, position.y) / 16 + Vector2i(xInput, yInput))
		if nexTile == null || nexTile.z_index < 1 :
			var movetest = move_and_collide(Vector2(xInput, yInput) * 8, true)
			if movetest == null:
				position += Vector2(xInput, yInput) * 16
			elif movetest.get_collider() && movetest.get_collider().get_meta("Tag") == "Enemy":
				var dice = RandomNumberGenerator.new()
				var diceRes =  dice.randi_range(1,12)
				log.text += ("\nAttempting Attack - Skill: " + str(actorData.mHandSkill) + " + Dice Roll: " + str(diceRes) + " Against " + str(movetest.get_collider().actorValue.armorClass) + " AC... \n")
				if actorData.mHandSkill + diceRes >= movetest.get_collider().actorValue.armorClass:
					movetest.get_collider().actorValue.apply_dmg()
					log.text += ("Success!\n")
				else:
					log.text += ("Miss!\n")

func hBar_mgmt():
	if actorData.blood:
		hBar.max_value = actorData.blood
		hBar.value = actorData.health
	if hBar.value == hBar.max_value:
		hBar.visible = false
	else:
		hBar.visible = true
