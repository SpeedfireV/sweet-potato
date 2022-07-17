extends CanvasLayer

const CHAR_READ_RATE = 0.07


onready var background = $MarginContainer/Background
onready var dialog = $MarginContainer/Background/Dialog
onready var arrow = $MarginContainer/Background/Arrow

enum State {
	READY,
	READING,
	FINISHED
}
var current_state = State.READY


func _ready():
	dialog.text = "Lorem Ipsum"
	dialog.percent_visible = 1
	arrow.visible = true
	current_state = State.READING

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and current_state == State.FINISHED:
		change_state()
	if current_state == State.READY:
		hide_dialog()
	elif current_state == State.READING and dialog.visible == false:
		show_dialog()
	elif current_state == State.READING and dialog.percent_visible == 1.0:
		current_state = State.FINISHED
		
func set_dialog_text(_text):
	dialog.text = _text

func show_dialog():
	dialog.visible = true
	background.visible = true
	arrow.visible = true
	$Tween.interpolate_property(dialog, "percent_visible", 0.0, 1.0, len(dialog.text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	current_state = State.READING
func hide_dialog():
	dialog.visible = false
	dialog.percent_visible = 0.0
	background.visible = false
	arrow.visible = false
	dialog.text = ""

func change_state():
	match current_state:
		State.READY:
			current_state = State.READING
		State.READING:
			current_state = State.FINISHED
		State.FINISHED:
			current_state = State.READY

