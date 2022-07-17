extends Node2D



onready var notifier = $"Node2D/YSort/Player/Hud/MoneyLayer2/FruitNotifier"
onready var lemons = $YSort/AreaLemons
onready var strawberries = $YSort/AreaStrawberries
onready var coconuts = $YSort/AreaCoconuts
onready var customer = $YSort/Areacustomer
onready var blender1 = $YSort/Areablender1
onready var blender2 = $YSort/Areablender2
onready var fruit = $Node2D/YSort/Player/Fruit
onready var sink = $YSort/AreaSink

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
	elif customer.active and (not notifier._visible or notifier.notifier_text.text != "customer"):
		notifier.set_notifier("Strawberries", "res://pictures/fruits/strawberry.png")
		notifier.show_notifier()
	elif blender1.active and (not notifier._visible or notifier.notifier_text.text != "blender1"):
		notifier.set_notifier("Strawberries", "res://pictures/fruits/strawberry.png")
		notifier.show_notifier()
	elif blender2.active and (not notifier._visible or notifier.notifier_text.text != "blender2"):
		notifier.set_notifier("Strawberries", "res://pictures/fruits/strawberry.png")
		notifier.show_notifier()
	elif sink.active and (not notifier._visible or notifier.notifier_text.text != "sink"):
		notifier.set_notifier("Strawberries", "res://pictures/fruits/strawberry.png")
		notifier.show_notifier()
	elif not lemons.active and not coconuts.active and not strawberries.active and not customer.active and not blender1.active and not blender2.active and not sink.active:
		notifier.hide_notifier()
		
	
	if Input.is_action_just_pressed("ui_accept"):
		match true:
			lemons.active:
				fruit.texture = load("res://pictures/fruits/lemon.png")
				fruit.visible = true
			coconuts.active:
				fruit.texture = load("res://pictures/fruits/coconut.png")
				fruit.visible = true
			strawberries.active:
				fruit.texture = load("res://pictures/fruits/strawberry.png")
				fruit.visible = true
				
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
