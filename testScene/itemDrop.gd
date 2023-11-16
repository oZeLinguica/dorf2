extends Node2D
@export var ac : int
@export var at : int
@export var wSkill : int
@export var type : int

@onready var player = get_tree().get_root().get_node("Node2D/player")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false

func _physics_process(delta):
		pick_up()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func pick_up():
	if self.visible == true && $Area2D.overlaps_body(player):
		var tempItem = load("res://testScene/itemButton.tscn").instantiate()
		var tempGraphic = tempItem.get_child(0)
		tempGraphic.texture = $Sprite2D.texture
		tempGraphic.hframes = $Sprite2D.hframes
		tempGraphic.vframes = $Sprite2D.vframes
		tempGraphic.frame = $Sprite2D.frame
		tempItem.ac = ac
		tempItem.at = at
		tempItem.wSkill = wSkill
		tempItem.type = type
		var inventory = get_tree().get_root().get_node("Node2D/CanvasLayer/Inventory/ColorRect/Items")
		var invGrid = inventory.get_children()
		for row in invGrid:
			var slot = row.get_children()
			for i in slot: 
				if i.get_child(1) is Button:
					pass
				else:
					i.add_child(tempItem)
					tempItem.position = Vector2.ZERO
					break
			break
				#self.reparent(i)
				#self.position = Vector2.ZERO
		tempItem.type_set()
		self.queue_free()
				

func drop():
	reparent(get_tree().get_root())
	self.visible = true
