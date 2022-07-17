extends Control


onready var notifier_text = $Notifier
onready var notifier_background = $NotifierBackground
onready var notifier_icon = $NotifierIcon

var _visible: bool = false

func _ready():
	pass 
	
	
func set_notifier(_text, image):
	notifier_text.text = _text
	notifier_icon.texture = load(image)

func show_notifier():
	notifier_text.visible = true
	notifier_background.visible = true
	notifier_icon.visible = true
	_visible = true
	
func hide_notifier():
	notifier_text.visible = false
	notifier_background.visible = false
	notifier_icon.visible = false
	_visible = false
