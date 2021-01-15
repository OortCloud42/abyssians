extends KinematicBody2D

const INTENDED_FPS = 60
const ACCELERATION = 8
const MAX_SPEED = 64
const FRICTION = 0.25
const AIR_RESISTANCE = 0.02
const GRAVITY = 4
const JUMP_FORCE = 125

var motion = Vector2.ZERO

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	print(delta)
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input != 0:
		animationPlayer.play("Run")
		motion.x += x_input * ACCELERATION * delta * INTENDED_FPS
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		sprite.flip_h = x_input < 0
	else:
		animationPlayer.play("Stand")
	
	motion.y += GRAVITY * delta * INTENDED_FPS
	
	if is_on_floor():
		if x_input == 0:
			#motion.x = lerp(motion.x, 0, pow(1 - FRICTION, delta))
			motion.x = lerp(motion.x, 0, FRICTION * delta * INTENDED_FPS)
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_FORCE
	else:
		if motion.y > 0:
			animationPlayer.play("Jump_down")
		else:
			animationPlayer.play("Jump_up")
		
		if Input.is_action_just_released("ui_up") and motion.y < -JUMP_FORCE/2:
			motion.y = -JUMP_FORCE/2
		
		if x_input == 0:
			#motion.x = lerp(motion.x, 0, pow(1 - AIR_RESISTANCE, delta))
			motion.x = lerp(motion.x, 0, AIR_RESISTANCE * delta * INTENDED_FPS)
	
	motion = move_and_slide(motion, Vector2.UP)
