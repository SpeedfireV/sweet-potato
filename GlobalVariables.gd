extends Node


export var _money : int = 50

export var day: int = 1

export var mafia_money = {
	2: 50,
	3: 70,
	4: 80,
	5: 110,
	6: 100,
	7: 140
}

var number_of_customers: int = 0
var queue: int = 0
var dial: int = 0
var hour: String = "10:00"
var clock_res: String = "res://pictures/clocks/clock10.png"

var current_fruit = "coconut"

var current_drink = {"strawberry": 0, "lemon": 0, "coconut": 0}

enum Types {
	DRINK,
	FRUIT,
	NONE
}

var item_type = Types.NONE


var blender_left = {
	"strawberry": 0,
	"coconut": 0,
	"lemon": 0,
}

var blender_right = {
	"strawberry": 0,
	"coconut": 0,
	"lemon": 0,
}
var list_dialog = [
 {
 
 }
]

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
