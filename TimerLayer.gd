extends CanvasLayer

onready var variables = $"/root/Global"
onready var timer = get_node("Timer")
onready var clock = get_node("MarginContainer/ClockBackground/Clock")
onready var clock_icon = get_node("MarginContainer/ClockBackground/ClockIcon")

func _ready():
	timer.set_wait_time(5)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func TimerTimeout():
	var _text: String = variables.hour
	if _text.substr(3,5) != "50":
		variables.hour = _text.substr(0, 3) + str(int(_text.substr(3, 5)) + 10)
	else:
		var hour: int = int(_text.substr(0, 2)) + 1
		var image: String = "res://pictures/clocks/clock%s.png"
		variables.hour = (str(int(_text.substr(0, 2)) + 1) + ":00" )
		if hour > 12:
			variables.clock_res = image % str(hour - 12)
			clock_icon.texture = load(variables.clock_res)
	
	clock.text = variables.hour
	print(clock.text)
	
	
	


