extends ColorRect
@export var at : int
@export var ac : int
var weaponSkill
var gearSlot = true
@onready var player = $"../../../../../player"

# Called when the node enters the scene tree for the first time.
func _ready():
	weaponSkill = 1
	self.set_meta("Tag", "Gear Slot")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_item():
	if self.get_children().size() > 1:
		at = self.get_child(1).at
		ac = self.get_child(1).ac
		if self.get_child(1).wSkill > 1:
			weaponSkill = self.get_child(1).wSkill
		player.actorData.update_gear()
