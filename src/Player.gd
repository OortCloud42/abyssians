extends KinematicBody2D

const ACCELERATION = 1
const MAX_SPEED = 80
const FRICTION = 1
const AIR_FRICTION = 0.5
const GRAVITY = 230
const JUMP_SPEED = 120

var motion = Vector2.ZERO

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
onready var stateMachine = $AnimationTree.get("parameters/playback")
onready var animationTree = $AnimationTree

func _physics_process(delta):
	var direction = get_direction()
	move_player(delta, direction)
	play_animations(direction)


func get_direction():
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-Input.get_action_strength("jump") if is_on_floor() and Input.is_action_just_pressed("jump") else 0.0)


func move_player(delta, direction):
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


func play_animations(direction):
	sprite.flip_h = direction.x < 0
	if is_on_floor():
		if direction.x != 0:
			stateMachine.travel("Run")
		else:
			stateMachine.travel("Stand")
	else:
		if motion.y < 0:
			stateMachine.travel("Jump_up")
		else:
			stateMachine.travel("Jump_down")
