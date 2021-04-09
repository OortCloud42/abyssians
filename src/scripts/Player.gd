extends Actor

class_name Player

const main_menu = "res://scenes/UI.tscn"

func _physics_process(delta):
	var keys = get_keys()
	direction = get_direction()
	
	move_actor(delta, direction)
	play_animations(direction)
	
	if keys["escape"] > 0:
# warning-ignore:return_value_discarded
		get_tree().change_scene(main_menu)


func get_direction():
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-Input.get_action_strength("jump") if is_on_floor() and Input.is_action_just_pressed("jump") else 0.0)


func get_keys():
	var keys = {
		"escape": Input.get_action_strength("escape"),
	}
	return keys


func play_animations(direction):
	sprite.flip_h = direction.x < 0
	if is_on_floor():
		if direction.x != 0:
			stateMachine.travel("Walk")
		else:
			stateMachine.travel("Stand")
	else:
		if motion.y < 0:
			stateMachine.travel("Jump_up")
		else:
			stateMachine.travel("Jump_down")
