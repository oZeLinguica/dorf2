extends RichTextLabel

@onready var av = $"../../../../player/ActorValue"

func _ready():
	if av != null:
		text += "Strength: " + str(av.strength) + "\n"
		text += "Agility: " + str(av.agility) + "\n"
		text += "Social: " + str(av.social) + "\n"
		text += "Intellect: " + str(av.intellect) + "\n"

