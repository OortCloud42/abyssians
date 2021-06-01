extends Enemy

class_name Slime

# Calculares patrol points using the desired path
func _ready():
	if patrol_path:
		patrol_points = get_node(patrol_path).curve.get_baked_points()
#		print("points:", patrol_points, " number of points: ", get_node(patrol_path).curve.get_point_count(), " closest point: ", get_node(patrol_path).curve.get_closest_point(position))

# Handles movmement on the patrol path
func _physics_process(delta):
	if !patrol_path:
		return
	direction = follow_path()
	move_actor(delta, direction)
	play_animations(direction)

# Plays animations based on current direction and position
func play_animations(direction):
	sprite.flip_h = direction.x < 0
	if is_on_floor():
		if motion.x != 0:
			stateMachine.travel("Walk")
		else:
			stateMachine.travel("Stand")
	else:
		if motion.y != 0:
			stateMachine.travel("In_air")
