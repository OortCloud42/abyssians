extends KinematicBody2D

class_name Actor

export var ACCELERATION = 1
export var MAX_SPEED = 80
export var FRICTION = 1
export var AIR_FRICTION = 0.5
export var GRAVITY = 230
export var JUMP_SPEED = 120

var motion = Vector2.ZERO
var direction = Vector2.ZERO

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
onready var stateMachine = $AnimationTree.get("parameters/playback")
onready var animationTree = $AnimationTree


func move_actor(delta, direction):
	motion.y += GRAVITY * delta
	
	if is_on_floor():
		if direction.y < 0:
			motion.y = JUMP_SPEED * direction.y
		if direction.x != 0:
			motion.x = lerp(motion.x, MAX_SPEED * direction.x, ACCELERATION)
		else:
			motion.x = lerp(motion.x, 0, FRICTION)
	else:
		if direction.x != 0:
			motion.x = lerp(motion.x, MAX_SPEED * direction.x, AIR_FRICTION)
		else:
			motion.x = lerp(motion.x, 0, AIR_FRICTION)
	
	motion = move_and_slide(motion, Vector2.UP)

