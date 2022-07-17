extends Node2D


onready var variables = $"/root/Global"
onready var notifier = $"Node2D/YSort/Player/Hud/MoneyLayer2/FruitNotifier"
onready var lemons = $YSort/AreaLemons
onready var strawberries = $YSort/AreaStrawberries
onready var coconuts = $YSort/AreaCoconuts
onready var customer = $YSort/Areacustomer
onready var blender1 = $YSort/Areablender1
onready var blender2 = $YSort/Areablender2
onready var fruit = $Node2D/YSort/Player/Fruit
onready var sink = $YSort/AreaSink
onready var dialog = $Node2D/YSort/Player/Dialog

var blender1_blend = false
var blender2_blend = false


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
		notifier.set_notifier("Take order", "")
		notifier.show_notifier()
	elif blender1.active and (not notifier._visible or notifier.notifier_text.text != "blender1"):
		if fruit.visible:
			notifier.set_notifier("Put into blender", "")
		else:
			notifier.set_notifier("Take", "")
		notifier.show_notifier()
	elif blender2.active and (not notifier._visible or notifier.notifier_text.text != "blender2"):
		if fruit.visible and variables.item_type == variables.Types.FRUIT:
			notifier.set_notifier("Put into blender", "")
		else:
			notifier.set_notifier("Take", "")
		notifier.show_notifier()
	elif sink.active and (not notifier._visible or notifier.notifier_text.text != "sink"):
		notifier.set_notifier("Toss item", "")
		notifier.show_notifier()
	elif not lemons.active and not coconuts.active and not strawberries.active and not customer.active and not blender1.active and not blender2.active and not sink.active:
		notifier.hide_notifier()
		


	if Input.is_action_just_pressed("ui_accept"):
		var blender1_possible: bool = (blender1.active)
		var blender2_possible: bool = (blender2.active)
		
		if blender1_blend:
			notifier.set_notifier("Wait", "") 
		match true:
			lemons.active:
				variables.item_type == variables.Types.FRUIT
				fruit.texture = load("res://pictures/fruits/lemon.png")
				fruit.visible = true
				variables.current_fruit = "lemon"
			coconuts.active:
				variables.item_type == variables.Types.FRUIT
				fruit.texture = load("res://pictures/fruits/coconut.png")
				fruit.visible = true
				variables.current_fruit = "coconut"
			strawberries.active:
				variables.item_type == variables.Types.FRUIT
				fruit.texture = load("res://pictures/fruits/strawberry.png")
				fruit.visible = true
				variables.current_fruit = "strawberry"
			sink.active:
				fruit.visible = false
			customer.active:
				dialog.set_dialog_text("WORKING BU JA!!!!")
				dialog.show_dialog()
			blender1_possible:
				if fruit.visible:
					variables.item_type == variables.Types.NONE
					fruit.visible = false
					variables.blender_left[variables.current_fruit] += 1
				else:
					variables.item_type == variables.Types.DRINK
					fruit.texture = load("res://drink.png")
					fruit.visible = true
					variables.current_drink = variables.blender_left
					variables.blender_left = {"coconut": 0, "strawberry": 0, "lemon": 0}
			blender2_possible:
				if fruit.visible:
					variables.item_type == variables.Types.NONE
					fruit.visible = false
					variables.blender_right[variables.current_fruit] += 1
				else:
					variables.item_type == variables.Types.DRINK
					fruit.texture = load("res://drink.png")
					fruit.visible = true
					variables.current_drink = variables.blender_right
					variables.blender_right = {"coconut": 0, "strawberry": 0, "lemon": 0}
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
