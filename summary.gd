extends CanvasLayer

onready var variables = $"/root/Global"
onready var day = $SummaryControl/LabelDay
onready var money_label = $SummaryControl/LabelMoney
onready var mafia_label = $SummaryControl/LabelMafia
onready var mafia_label_money = $SummaryControl/LabelMafiaMoney
onready var summary_control = $SummaryControl



onready var after_money_label = $SummaryControl/LabelAfterMoneyInt



# Called when the node enters the scene tree for the first time.
func _ready():
	day.text = "The end of the day " + str(variables.day)
	money_label.text = str(variables._money)
	if variables.mafia_money.get(variables.day) != null:
		after_money_label.text = str(variables._money - 20 - 30 - variables.mafia_money.get(variables.day))
		mafia_label_money.visible = true
		mafia_label.visible = true
	else:
		mafia_label_money.visible = false
		mafia_label.visible = false
		after_money_label.text = str(variables._money - 20 - 30)
	


func _process(delta):
	if variables.hour == "18:00" and summary_control.visible == false:
		summary_control.visible = true


func _on_Button_pressed():
	variables.hour = "10:00"
	variables.clock_res = "res://pictures/clocks/clock10.png"
	print("working")
	
	variables.day += 1
	
	summary_control.visible = false
	
