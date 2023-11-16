extends CharacterBody2D
@export var pathTgt : Node2D
@onready var buttArray = ["move_up", "move_down", "move_left", "move_right", "move_sw", "move_nw", "move_se", "move_ne"]
var nexTile
var ud
var lr
var tileMap
var hBar
var actorValue
@onready var log = $"../CanvasLayer/Log/RichTextLabel"
@export var hostile : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	pathTgt = $"../player"
	tileMap = $"../Map/TileMap"
	hBar = $EnHealthbar
	actorValue = $ActorValue

func _process(delta):
	hBar_mgmt()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	tick_move()
	
func tick_move():
	for i in buttArray.size():
		if Input.is_action_just_pressed(buttArray[i]):
			path_find()
			nexTile = tileMap.get_cell_tile_data(0, Vector2i(position.x, position.y) / 16 + Vector2i(lr, ud))
			if nexTile.z_index < 1:
				var movetest = move_and_collide(Vector2(lr, ud) * 8, true)
				if movetest == null:
					
					position += Vector2(lr, ud) * 16
					if position.distance_to(pathTgt.position) < 8:
						position -= Vector2(lr, ud) * 16
				
				elif movetest.get_collider() == pathTgt && hostile:
					var dice = RandomNumberGenerator.new()
					var diceRes =  dice.randi_range(1,12)
					log.text +=  ("\nEnemy attacks with Skill " + str(actorValue.skillID[actorValue.attackSkill]) + ", rolling " + str (diceRes) + " against your " + str(movetest.get_collider().actorData.armorClass) + " AC...\n")
					if actorValue.skillID[actorValue.attackSkill] + diceRes >= movetest.get_collider().actorData.armorClass:
						movetest.get_collider().actorData.apply_dmg()
						log.text += ("Ouch! Health remaining: " + str(movetest.get_collider().actorData.health) + "\n")

func path_find():
	if position.direction_to(pathTgt.position).x < 0 && position.direction_to(pathTgt.position).y > 0:
		lr = -1
		ud  = 1
	if position.direction_to(pathTgt.position).x > 0 && position.direction_to(pathTgt.position).y < 0:
		lr = 1
		ud = -1
	if position.direction_to(pathTgt.position).x < 0 && position.direction_to(pathTgt.position).y < 0:
		lr = -1
		ud = -1
	if position.direction_to(pathTgt.position).x > 0 && position.direction_to(pathTgt.position).y > 0:
		lr = 1
		ud = 1
	if position.direction_to(pathTgt.position).x == 0 && position.direction_to(pathTgt.position).y > 0:
		lr = 0
		ud = 1
	if position.direction_to(pathTgt.position).x > 0 && position.direction_to(pathTgt.position).y == 0:
		lr = 1
		ud = 0
	if position.direction_to(pathTgt.position).x == 0 && position.direction_to(pathTgt.position).y < 0:
		lr = 0
		ud = -1
	if position.direction_to(pathTgt.position).x < 0 && position.direction_to(pathTgt.position).y == 0:
		lr = -1
		ud = 0
		
func hBar_mgmt():
	if actorValue.blood:
		hBar.max_value = actorValue.blood
		hBar.value = actorValue.health
	if hBar.value == hBar.max_value:
		hBar.visible = false
	else:
		hBar.visible = true
