extends Control

const main_menu = "res://UI.tscn"

const entryCount = 5

onready var selector_setting1 = $SettingsMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/selector
onready var selector_setting2 = $SettingsMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/selector
onready var selector_setting3 = $SettingsMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/selector
onready var selector_setting4 = $SettingsMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer4/HBoxContainer/selector
onready var selector_exit = $SettingsMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer5/HBoxContainer/selector

func _ready():
	set_current_selection(0)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < entryCount - 1:
		current_selection += 1
		set_current_selection(current_selection)
	if Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
		
	if Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)

func handle_selection(_current_selection):
	match _current_selection:
		0:
			print("add settings")
		1:
			print("add settings")
		2:
			print("add settings")
		3:
			print("add settings")
		4:
			get_tree().change_scene(main_menu)

var current_selection = 0

func set_current_selection(_current_selection):
	selector_setting1.text = ""
	selector_setting2.text = ""
	selector_setting3.text = ""
	selector_setting4.text = ""
	selector_exit.text = ""
	match _current_selection:
		0:
			selector_setting1.text = ">"
		1:
			selector_setting2.text = ">"
		2:
			selector_setting3.text = ">"
		3:
			selector_setting4.text = ">"
		4:
			selector_exit.text = ">"
