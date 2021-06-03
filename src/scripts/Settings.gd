extends Control

class_name SettingsMenu

# Main UI scene path
const main_menu = "res://scenes/UI.tscn"

# Menu entry count
const entryCount = 5

# First selector
onready var selector_setting1 = $SettingsMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/selector
# Second selector
onready var selector_setting2 = $SettingsMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/selector
# Third selector
onready var selector_setting3 = $SettingsMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/selector
# Fourth selector
onready var selector_setting4 = $SettingsMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer4/HBoxContainer/selector
# Last selector, used for exiting the settings menu
onready var selector_exit = $SettingsMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer5/HBoxContainer/selector

# Resets the current selection
func _ready():
	set_current_selection(0)

# Changes selection based on user input
func _process(_delta):
	if Input.is_action_just_pressed("move_down"):
		current_selection = wrapi(current_selection + 1, 0, entryCount)
		set_current_selection(current_selection)
	if Input.is_action_just_pressed("move_up"):
		current_selection = wrapi(current_selection - 1, 0, entryCount)
		set_current_selection(current_selection)
		
	if Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
	if Input.is_action_just_pressed("escape"):
		current_selection = 4
		set_current_selection(current_selection)
		handle_selection(current_selection)

# Changes scene based on selected entry
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

# Current selection, used for selecting the desired setting and correct positioning of the cursor
var current_selection = 0

# Places the selection marker in the correct place
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
