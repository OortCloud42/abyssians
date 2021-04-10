extends Enemy

class_name Slime

func _ready():
	if patrol_path:
		patrol_points = get_node(patrol_path).curve.get_baked_points()
		print("points:", patrol_points)


func _physics_process(delta):
#	if is_on_wall():
#		if direction == Vector2.LEFT:
#			direction = Vector2.RIGHT
#		else:
#			direction = Vector2.LEFT
#	move_actor(delta, direction)
#	play_animations(direction)
	if !patrol_path:
		return
	direction = follow_path()
	print("direction: ", direction)
	move_actor(delta, direction)


func play_animations(direction):
	sprite.flip_h = direction.x < 0
	if is_on_floor():
		if direction.x != 0:
			stateMachine.travel("Walk")
		else:
			stateMachine.travel("Stand")
	else:
		if motion.y != 0:
			stateMachine.travel("In_air")
