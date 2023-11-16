extends Button
@export var at : int
@export var ac : int
var lastKnownParent
@export var wSkill : int
@export var type : int
@onready var collisionBox = $Area2D
var equipped


@onready var validNodeArray

# Called when the node enters the scene tree for the first time.
func type_set():
		if type == 1:
			validNodeArray = [$"../../../../Character/MainHand"] + $"../..".get_children() + $"../../../Row2".get_children() + $"../../../Row3".get_children() + $"../../../Row4".get_children() + $"../../../Row5".get_children() + $"../../../Row6".get_children()
		if type == 2:
			validNodeArray = [$"../../../../Character/OffHand"] + $"../..".get_children() + $"../../../Row2".get_children() + $"../../../Row3".get_children() + $"../../../Row4".get_children() + $"../../../Row5".get_children() + $"../../../Row6".get_children()
		if type == 3:
			validNodeArray = [$"../../../../Character/Chest"] + $"../..".get_children() + $"../../../Row2".get_children() + $"../../../Row3".get_children() + $"../../../Row4".get_children() + $"../../../Row5".get_children() + $"../../../Row6".get_children()
		if type == 4:
			validNodeArray = [$"../../../../Character/Legs"] + $"../..".get_children() + $"../../../Row2".get_children() + $"../../../Row3".get_children() + $"../../../Row4".get_children() + $"../../../Row5".get_children() + $"../../../Row6".get_children()
		if type == 5:
			validNodeArray = [$"../../../../Character/Feet"] + $"../..".get_children() + $"../../../Row2".get_children() + $"../../../Row3".get_children() + $"../../../Row4".get_children() + $"../../../Row5".get_children() + $"../../../Row6".get_children()
		if type == 6:
			validNodeArray = [$"../../../../Character/Head"] + $"../..".get_children() + $"../../../Row2".get_children() + $"../../../Row3".get_children() + $"../../../Row4".get_children() + $"../../../Row5".get_children() + $"../../../Row6".get_children()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in validNodeArray.size():
		if self.button_pressed == false && collisionBox.overlaps_area(validNodeArray[i].get_child(0)) && validNodeArray[i].get_child(1) == null:
			reparent(validNodeArray[i])
			lastKnownParent = get_parent()
			self.global_position = Vector2.ZERO
			self.top_level = false
			if validNodeArray[i].has_meta("Tag") && validNodeArray[i].get_meta("Tag") == "Gear Slot":
				validNodeArray[i].get_item()
		if validNodeArray[i].name == "MainHand":
			pass#print (validNodeArray[i].at, validNodeArray[i].ac, validNodeArray[i].weaponSkill)

		
		if self.button_pressed:
			lastKnownParent = get_parent()
			self.top_level = true
			self.global_position = (get_viewport().get_mouse_position() - self.pivot_offset)
		elif self.button_pressed == false && lastKnownParent == validNodeArray[i]:
			self.reparent(lastKnownParent)
			self.top_level = false
			self.global_position = lastKnownParent.global_position
