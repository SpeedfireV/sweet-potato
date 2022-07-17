extends CanvasLayer


onready var timer = get_node("Timer")
onready var clock = get_node("MarginContainer/ClockBackground/Clock")
onready var clock_icon = get_node("MarginContainer/ClockBackground/ClockIcon")

func _ready():
	timer.set_wait_time(7.5)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func TimerTimeout():
	var _text: String = clock.text
	if _text.substr(3,5) != "50":
		clock.text = _text.substr(0, 3) + str(int(_text.substr(3, 5)) + 10)
	else:
		var hour: int = int(_text.substr(0, 2)) + 1
		var image: String = "res://pictures/clocks/clock%s.png"
		clock.text = (str(int(_text.substr(0, 2)) + 1) + ":00" )
		if hour > 12:
			clock_icon.texture = load(image % str(hour - 12))
			
			
			
							
