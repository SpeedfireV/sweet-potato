extends Area2D

onready var variables = $"/root/Global"

var rng = RandomNumberGenerator.new()
var active: bool = false

func _ready():
	connect("body_entered", self, "_on_NPC_body_entered")
	connect("body_exited", self, "_on_NPC_body_exited")

	

func _on_NPC_body_entered(body):
	if body.name == "Player" and variables.queue == 1:
		variables.dial += 1
		active = true
	
func _on_NPC_body_exited(body):
	if body.name == "Player" and variables.queue == 1:
		variables.dial += 0
		active = false
