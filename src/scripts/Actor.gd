extends KinematicBody2D

class_name Actor


export var ACCELERATION = 1
export var MAX_SPEED = 80
export var FRICTION = 1
export var AIR_FRICTION = 0.5
export var GRAVITY = 230

# more like jump force
export var JUMP_SPEED = 120

# speed, used by move_actor
var motion = Vector2.ZERO

# direction
var direction = Vector2.ZERO

# wygląd
onready var sprite = $Sprite

# backend for animations, plays animations
onready var animationPlayer = $AnimationPlayer

# animation tree
onready var stateMachine = $AnimationTree.get("parameters/playback")

# Moves object based on ....
func move_actor(delta, _direction):
	motion.y += GRAVITY * delta
	
	if is_on_floor():
		if direction.y < 0:
			motion.y = JUMP_SPEED * _direction.y
		if direction.x != 0:
			motion.x = lerp(motion.x, MAX_SPEED * _direction.x, ACCELERATION)
		else:
			motion.x = lerp(motion.x, 0, FRICTION)
	else:
		if direction.x != 0:
			motion.x = lerp(motion.x, MAX_SPEED * _direction.x, AIR_FRICTION)
		else:
			motion.x = lerp(motion.x, 0, AIR_FRICTION)
	
	motion = move_and_slide(motion, Vector2.UP)

