extends Label


# Declare member variables here. Examples:
# var a = 2
# Called when the node enters the scene tree for the first time.
var _text := "55"
func _ready():
	pass
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = _text
	var arrow_clicked : float= Input.get_action_strength("move_down")
	print(arrow_clicked)
	print(_abc)
	if arrow_clicked == 1:
		_text = "33"
		print("Working")
