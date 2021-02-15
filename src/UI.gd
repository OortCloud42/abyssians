extends Control

const world = "res://World.tscn"
const settings = "res://Settings.tscn"

const entryCount = 3

onready var selector_start = $MainMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/selector
onready var selector_settings = $MainMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/selector
onready var selector_exit = $MainMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/selector

func _ready():
	set_current_selection(0)
	
func _process(_delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene("res://UI.tscn")
	if Input.is_action_just_pressed("move_down") and current_selection < entryCount - 1:
		current_selection += 1
		set_current_selection(current_selection)
	if Input.is_action_just_pressed("move_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
		
	if Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
	

func handle_selection(_current_selection):
	match _current_selection:
		0:
			get_tree().change_scene(world)
		1:
			get_tree().change_scene(settings)
		2:
			get_tree().quit()

var current_selection = 0

func set_current_selection(_current_selection):
	selector_start.text = ""
	selector_settings.text = ""
	selector_exit.text = ""
	match _current_selection:
		0:
			selector_start.text = ">"
		1:
			selector_settings.text = ">"
		2:
			selector_exit.text = ">"
