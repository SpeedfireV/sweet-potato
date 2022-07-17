extends KinematicBody2D

onready var variables = $"/root/Global"

export var speed := 90.0
var go = 1.0


onready var body = $Body
onready var left_shoe = $LeftShoe
onready var right_shoe = $RightShoe
onready var custom = $AnimationPlayer

enum State {
	LADA,
	STOLIK
	STOLIK6
	STOLIK2
	STOLIK3
	STOLIK4
	STOLIK5
}



var current_state = State.LADA
var rng = RandomNumberGenerator.new()
func _ready():
	yield(get_tree().create_timer(14.0), "timeout")
	rng.randomize()
	go = rng.randi_range(1,20)
	if variables.queue == 0:
		custom.play("Lada")
