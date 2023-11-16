extends Area2D
var entered = false
var choice
var buttArray
var engage
var convStage = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	buttArray = [$"../../CanvasLayer/Log/colorRect/ScrollContainer/VBoxContainer/Dialog1", $"../../CanvasLayer/Log/colorRect/ScrollContainer/VBoxContainer/Dialog2", $"../../CanvasLayer/Log/colorRect/ScrollContainer/VBoxContainer/Dialog3", $"../../CanvasLayer/Log/colorRect/ScrollContainer/VBoxContainer/Dialog4", $"../../CanvasLayer/Log/colorRect/ScrollContainer/VBoxContainer/Dialog5", $"../../CanvasLayer/Log/colorRect/ScrollContainer/VBoxContainer/Dialog6", $"../../CanvasLayer/Log/colorRect/ScrollContainer/VBoxContainer/Dialog7", $"../../CanvasLayer/Log/colorRect/ScrollContainer/VBoxContainer/Dialog8", $"../../CanvasLayer/Log/colorRect/ScrollContainer/VBoxContainer/Dialog9", $"../../CanvasLayer/Log/colorRect/ScrollContainer/VBoxContainer/Dialog10"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.body_entered && overlaps_body($"../../player") && (entered == false):
		$"../../CanvasLayer/Log/RichTextLabel".text += '\n WARRIOR: "Fox on the Rocks. You come before me to be struck down. If you would, use your meager powers of reason to comprehend: the hands that guide your fate nudge the doomsday clock ever forwards."  \n'
		buttArray[0].text = '1. Proceed.'
		buttArray[0].visible = true
		buttArray[0].pressed.connect(self.dialog_mgmt)
		buttArray[1].pressed.connect(self.dialog_mgmt)
		buttArray[3].pressed.connect(self.dialog_mgmt)
		entered = true
		
		
	if engage == true:
		if choice == 0 && convStage == 0:
			$"../../CanvasLayer/Log/RichTextLabel".text += '\n WARRIOR: "You swerve to stop at the top of the clock as if you could save yourself. Let me assure you, there is no reality in which the dearth of Twyncyn is reversed, nor any in which your death is avoidable." \n'
			buttArray[0].text = '1. "The gods you serve are false and dead and\n their bones will keep you company in the \ncold of the grave."'
			buttArray[1].visible = true
			buttArray[1].text = '2. "Blessed Lady, I gave my life for you.\nMy last rite for a dead goddess,\nwhy have you forsaken me?'
			convStage = 1
			choice = null
		if choice == 0 && convStage == 1:
			$"../../CanvasLayer/Log/RichTextLabel".text += '\n WARRIOR: "The air you breathe and the blood of your flesh are your shackles to the dirt-rock you call Twyncyn. With your death, I free gods and men from this eternal terrestrial prison."\n'
			buttArray[0].text = '1. So be it.'
			buttArray[1].visible = false
			convStage = 2
			choice = null
			
	
	if engage == true:
		if (convStage == 0 || 1) && choice == 1:
			$"../../CanvasLayer/Log/RichTextLabel".text += '\n WARRIOR: "Fool that you are, you consider the dust and skin the authority on life, god, the universe and everything else. The gods are no more dead than the stars are put out. This I will show you, Antaeus: return to stardust and be reborn." \n'
			buttArray[0].text = '1. So be it.'
			buttArray[1].visible = false
			convStage = 2
			choice = null
		
	if body_exited && self.overlaps_body($"../../player") == false:
		engage = false
		convStage = 0
		for i in buttArray.size():
			if buttArray[i].visible == true:
				$"../../CanvasLayer/Log/RichTextLabel".text = ''
				buttArray[i].visible = false
		entered = false
		

func dialog_mgmt():
	for i in buttArray.size():
		if buttArray[i].is_hovered():
			engage = true
			choice = i
			$"../../CanvasLayer/Log/RichTextLabel".text += '\n'+ buttArray[i].text + '\n'
	print (choice, buttArray[0])
