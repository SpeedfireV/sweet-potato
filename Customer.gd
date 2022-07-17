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
}

var current_state = State.LADA
var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()
	go = rng.randi_range(1,20)
	if go < 20:
		custom.play("Lada")







func _on_AnimationPlayer_animation_finished(anim_name):
	variables.queue += 1
	print(variables.queue)
	
