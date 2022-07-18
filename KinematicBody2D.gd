extends KinematicBody2D

const UP_DIRECTION = Vector2.UP

export var speed := 90.0

var _velocity := Vector2.ZERO

onready var variables = $"/root/Global"
onready var body = $Body
onready var left_shoe = $LeftShoe
onready var right_shoe = $RightShoe
onready var movement = $Movement
onready var dialog = $Dialog

enum State {
	STANDING,
	WALKING
}

var current_state = State.STANDING

func _ready():
	movement.play("standing")

func _physics_process(delta: float) -> void:
	var _horizontal_direction = (
		Input.get_action_strength("move_right") - 
		Input.get_action_strength("move_left")
	)
	var _vertical_direction = (
				Input.get_action_strength("move_down") - 
		Input.get_action_strength("move_up")
	)
	if _velocity.x != 0 or _velocity.y != 0:
		if current_state != State.WALKING:
			movement.stop()
			movement.play("walking")
			current_state = State.WALKING
	else:
		if current_state != State.STANDING:
			movement.stop()
			left_shoe.position.y = 18.0
			left_shoe.position.x = -11.0
			right_shoe.position.y = 18.0
			right_shoe.position.x = -12
			movement.play("standing")

			current_state = State.STANDING
	if _velocity.x > 0:
		body.flip_h = true
		left_shoe.flip_h = true
		right_shoe.flip_h = true	
	elif _velocity.x < 0:
		body.flip_h = false
		left_shoe.flip_h = false
		right_shoe.flip_h = false	
	
	_velocity.x = _horizontal_direction * speed
	_velocity.y = _vertical_direction * speed	
	_velocity = move_and_slide(_velocity, UP_DIRECTION)
	
	
	






