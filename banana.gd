extends Node2D



onready var notifier = $"Node2D/YSort/Player/Hud/MoneyLayer2/FruitNotifier"
onready var lemons = $YSort/AreaLemons
onready var strawberries = $YSort/AreaStrawberries
onready var coconuts = $YSort/AreaCoconuts

func _ready():
	pass
	
func _process(delta):
	if lemons.active and (not notifier._visible or notifier.notifier_text.text != "Lemons"):
		notifier.set_notifier("Lemons", "res://pictures/fruits/lemon.png")
		notifier.show_notifier()
	elif coconuts.active and (not notifier._visible or notifier.notifier_text.text != "Coconuts"):
		notifier.set_notifier("Coconuts", "res://pictures/fruits/coconut.png")
		notifier.show_notifier()
	elif strawberries.active and (not notifier._visible or notifier.notifier_text.text != "Strawberries"):
		notifier.set_notifier("Strawberries", "res://pictures/fruits/strawberry.png")
		notifier.show_notifier()
	elif not lemons.active and not coconuts.active and not strawberries.active:
		notifier.hide_notifier()
		
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass