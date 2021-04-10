extends Actor

class_name Enemy

export (NodePath) var patrol_path
var patrol_points
var patrol_index = 0


func follow_path():
	if !patrol_path:
		return
	var target = patrol_points[patrol_index]
	print("target: ", target, "position: ", position)
#	print("position: ", position)
#	print("distance to point: ", position.distance_to(target))
	if position.distance_to(target) < 10:
#		print("reached point")
		patrol_index = wrapi(patrol_index + 1, 0, patrol_points.size())
		target = patrol_points[patrol_index]
	return target.normalized()