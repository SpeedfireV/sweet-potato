extends Label
onready var _menu := get_node("/root/Global")
# Declare member variables here. Examples:
# var a = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(_menu._money)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if text != str(_menu._money):
		text = str(_menu._money)
