extends Node2D
@export var strength : int
@export var intellect : int
@export var social : int
@export var agility : int

@export var signature : int
@export var health : int
@export var armorThreshold : int
@export var armorClass: int
@export var attackSkill : int

@onready var skillID : Array

@onready var headGear
@onready var chestGear
@onready var legsGear
@onready var feetGear

@onready var weapon
@onready var offHand

@onready var itemDrop = $"../../enemyBase/Drop"

@onready var paramDict: Dictionary

var mHandSkill

var reason
var apocrypha
var craftwork
var healing

var oratory
var insight
var deception
var intimidation

var true_sight
var legerdemain
var impermanence
var acrobatics

var brute_force
var martial_arts
var athletics
var blood

func set_params():#this function is also called from somewhere in hell, so enjoy that.
	health
	armorClass
	armorThreshold
	attackSkill
	
	reason = intellect
	apocrypha = intellect
	craftwork = intellect
	healing = intellect
	
	oratory = social
	insight = social
	deception = social
	intimidation = social
	
	true_sight = agility
	legerdemain = agility
	impermanence = agility
	acrobatics = agility
	
	brute_force = strength
	martial_arts = strength
	athletics = strength
	blood = strength
	

	skillID = [blood, brute_force, martial_arts, athletics,
	reason, apocrypha, healing, craftwork, 
	oratory, intimidation, deception, insight,
	impermanence, legerdemain, true_sight , acrobatics]
	
	if signature > 0:
		skillID[signature -1] += 1
		print (skillID)

		#TODO: this is not incrementing the variable correctly at runtime.

	health = blood
	
		
func _ready():
	if self.get_parent().name == "player":
		set_params()
		update_gear()
		print (mHandSkill)
	else:
		set_params()
	
func update_gear():
	headGear = $"../../CanvasLayer/Inventory/ColorRect/Character/Head"
	chestGear = $"../../CanvasLayer/Inventory/ColorRect/Character/Chest"
	legsGear = $"../../CanvasLayer/Inventory/ColorRect/Character/Legs"
	feetGear = $"../../CanvasLayer/Inventory/ColorRect/Character/Feet"

	weapon = $"../../CanvasLayer/Inventory/ColorRect/Character/MainHand"
	offHand  = $"../../CanvasLayer/Inventory/ColorRect/Character/OffHand"
	armorClass = headGear.ac + chestGear.ac + legsGear.ac + feetGear.ac + offHand.ac
	armorThreshold = headGear.at + chestGear.at + legsGear.at + feetGear.at + offHand.at
	mHandSkill = skillID[(weapon.weaponSkill)]
	print (weapon.weaponSkill, armorClass, armorThreshold)
		
func apply_dmg():
	if armorThreshold == 0:
		health -= 1
		
	else:
		armorThreshold -= 1
		
	if health <= 0 && get_parent().name != "player":
		itemDrop.drop()
		get_parent().queue_free()
	elif health <= 0 && get_parent().name == "player":
		get_parent().visible = false
		print ("Game Over.")

