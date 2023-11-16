extends Button
@export var type : int
@export var ac : int
@export var at : int
@export var wSkill : int
var typeString : String
var extraTooltip
var skillDict : Dictionary

func _ready():
	extraTooltip = tooltip_text
	skillDict = {1:"Blood", 2:"Brute Force", 3:"Martial Arts", 4:"Athletics", 5:"Reason", 6:"Apocrypha", 7:"Healing", 8:"Craftwork", 9:"Oratory", 10:"Intimidation", 11:"Deception", 12:"Insight", 13:"Impermanence", 14:"Legerdemain", 15:"True Sight", 16:"Acrobatics"}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if type == 1:
		typeString = "Primary"
	if type == 2:
		typeString = "Off Hand"
	if type == 3:
		typeString = "Chest"
	if type == 4:
		typeString = "Belt"
	if type == 5:
		typeString = "Feet"
	if type == 6:
		typeString = "Head"
	
	tooltip_text = "Slot: " + typeString + "\nArmor Class: " + str(ac) + "\nArmor Threshold: " + str(at) + "\nOffensive Skill: " + skillDict[wSkill] + "\n \n" + extraTooltip

