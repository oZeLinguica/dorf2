extends Node2D
@export var PTS : int
@export var STR : int
@export var INT : int
@export var SOC : int
@export var AGI : int

@onready var strLabel = $ColorRect/ColorRect2/strength/Label
@onready var intLabel = $ColorRect/ColorRect2/intellect/Label
@onready var socLabel = $ColorRect/ColorRect2/social/Label
@onready var agiLabel = $ColorRect/ColorRect2/agiity/Label
@onready var ptsLabel = $ColorRect/ColorRect2/points/Label

@onready var sigChecks = [$ColorRect/ColorRect3/Label2/CheckButton, $ColorRect/ColorRect3/Label3/CheckButton, $ColorRect/ColorRect3/Label4/CheckButton, $ColorRect/ColorRect3/Label5/CheckButton, $ColorRect/ColorRect3/Label6/CheckButton, $ColorRect/ColorRect3/Label7/CheckButton, $ColorRect/ColorRect3/Label8/CheckButton, $ColorRect/ColorRect3/Label9/CheckButton, $ColorRect/ColorRect3/Label10/CheckButton, $ColorRect/ColorRect3/Label11/CheckButton, $ColorRect/ColorRect3/Label12/CheckButton, $ColorRect/ColorRect3/Label13/CheckButton, $ColorRect/ColorRect3/Label14/CheckButton,$ColorRect/ColorRect3/Label15/CheckButton, $ColorRect/ColorRect3/Label16/CheckButton, $ColorRect/ColorRect3/Label17/CheckButton]

var skillData : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ptsLabel.text = str(PTS)
	strLabel.text = str(STR)
	intLabel.text = str(INT)
	socLabel.text = str(SOC)
	agiLabel.text = str(AGI)
	
	var minusArray = [$ColorRect/ColorRect2/strength/Label/Button, $ColorRect/ColorRect2/intellect/Label/Button, $ColorRect/ColorRect2/social/Label/Button, $ColorRect/ColorRect2/agiity/Label/Button]
	for button in minusArray:
		if button.is_hovered() && Input.is_action_just_pressed("mouse1"):
			if button.get_parent() == strLabel && STR > 1:
				STR -= 1
				PTS += 1
			elif button.get_parent() == intLabel && INT > 1:
				INT -= 1
				PTS += 1
			elif button.get_parent() == socLabel && SOC > 1:
				SOC -= 1
				PTS += 1
			elif button.get_parent() == agiLabel && AGI > 1:
				AGI -= 1
				PTS += 1
	
	var plusArray = [$ColorRect/ColorRect2/strength/Label/Button2, $ColorRect/ColorRect2/intellect/Label/Button2, $ColorRect/ColorRect2/social/Label/Button2, $ColorRect/ColorRect2/agiity/Label/Button2]
	for button in plusArray:
		if button.is_hovered() && Input.is_action_just_pressed("mouse1"):
			if button.get_parent() == strLabel && PTS > 0 && STR < 12:
				STR += 1
				PTS -= 1
			elif button.get_parent() == intLabel && PTS > 0 && INT < 12:
				INT += 1
				PTS -= 1
			elif button.get_parent() == socLabel && PTS > 0 && SOC < 12:
				SOC += 1
				PTS -= 1
			elif button.get_parent() == agiLabel && PTS > 0 && AGI < 12:
				AGI += 1
				PTS -= 1

	var bloodLabel = $ColorRect/ColorRect3/Label2/Label
	var bruteLabel = $ColorRect/ColorRect3/Label3/Label
	var fightLabel = $ColorRect/ColorRect3/Label4/Label
	var athLabel = $ColorRect/ColorRect3/Label5/Label
	var smartLabel = $ColorRect/ColorRect3/Label6/Label
	var magicLabel = $ColorRect/ColorRect3/Label7/Label
	var healLabel = $ColorRect/ColorRect3/Label8/Label
	var craftLabel = $ColorRect/ColorRect3/Label9/Label
	var speechLabel = $ColorRect/ColorRect3/Label10/Label
	var threatLabel = $ColorRect/ColorRect3/Label11/Label
	var liarLabel = $ColorRect/ColorRect3/Label12/Label
	var seerLabel = $ColorRect/ColorRect3/Label13/Label
	var stealthLabel = $ColorRect/ColorRect3/Label14/Label
	var thiefLabel = $ColorRect/ColorRect3/Label15/Label
	var rangedLabel = $ColorRect/ColorRect3/Label16/Label
	var acroLabel = $ColorRect/ColorRect3/Label17/Label
	
	
	
	var strongSkill = [bloodLabel, bruteLabel, fightLabel, athLabel]
	for skill in strongSkill:
		skill.text = str(STR)
		if skill.get_parent().get_node("CheckButton").button_pressed:
			skill.text = str (STR + 1)
			
	var intSkill = [smartLabel, magicLabel, healLabel, craftLabel]
	for skill in intSkill:
		skill.text = str(INT)
		if skill.get_parent().get_node("CheckButton").button_pressed:
			skill.text = str (INT + 1)
		
	var chaSkill = [speechLabel, threatLabel, liarLabel, seerLabel]
	for skill in chaSkill:
		skill.text = str(SOC)
		if skill.get_parent().get_node("CheckButton").button_pressed:
			skill.text = str (SOC + 1)
		
	var agiSkill = [stealthLabel, thiefLabel, rangedLabel, acroLabel]
	for skill in agiSkill:
		skill.text = str(AGI)
		if skill.get_parent().get_node("CheckButton").button_pressed:
			skill.text = str (AGI + 1)
	
	skillData = [int(bloodLabel.text), int(bruteLabel.text), int(fightLabel.text), int(athLabel.text),
	int(smartLabel.text), int(magicLabel.text), int(healLabel.text), int(craftLabel.text),
	int(speechLabel.text), int(threatLabel.text), int(liarLabel.text), int(seerLabel.text),
	int(stealthLabel.text), int(thiefLabel.text), int(rangedLabel.text), int(acroLabel.text)]
	
	#print(skillData)
	
	for check in sigChecks:
		if check.button_pressed:
			var otherChecks = sigChecks
			if otherChecks.size() > 16:
				otherChecks.erase(check)
			for other in otherChecks:
				if other.is_hovered() && Input.is_action_just_pressed("mouse1") && other != check:
					check.button_pressed = false
		
		
