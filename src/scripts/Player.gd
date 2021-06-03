extends Actor

class_name Player

signal exited_screen(position)

const main_menu = "res://scenes/UI.tscn"

onready var visibility = $VisibilityNotifier2D
onready var damageTimer = get_node("DamageTimer")
onready var invincibleTimer = get_node("InvincibleTimer")
onready var effectPlayer = get_node("EffectPlayer")
onready var hitbox = $Area2D

var wasHit = false
var knockedOut = false
var invincible = false

func _physics_process(delta):
	var keys = get_keys()
	
	if !wasHit:
		if !knockedOut:
			direction = get_direction()
		else:
			stateMachine.travel("Dead")
	elif is_on_floor() and !knockedOut:
		direction = Vector2.ZERO
		wasHit = false
		knockedOut = true
		damageTimer.start(2)
	
	move_actor(delta, direction)
	if !knockedOut:
		play_animations(direction)
	
	if !visibility.is_on_screen():
		emit_signal("exited_screen", Vector2(position.x,position.y-3))
	
	if keys["escape"] > 0:
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
	if direction.x < 0:
		sprite.flip_h = true
	elif direction.x > 0:
		sprite.flip_h = false
	
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


func _on_DamageTimer_timeout():
	knockedOut = false
	invincible = true
	stateMachine.travel("Stand")
	effectPlayer.play("Invincible")
	invincibleTimer.start(3)


func _on_InvincibleTimer_timeout():
	invincible = false
	hitbox.set_monitoring(false)
	hitbox.set_monitoring(true)


func _on_Area2D_body_entered(body):
	if !wasHit and !knockedOut and !invincible:
		if (position - body.position).normalized().x > 0:
#			set_deferred("direction", Vector2(1, -1))
			direction = Vector2(1, -1)
#			set_deferred("motion", direction * MAX_SPEED / 2)
			motion = direction * MAX_SPEED / 2
		else:
#			set_deferred("direction", Vector2(-1, -1))
			direction = Vector2(-1, -1)
#			set_deferred("motion", direction * MAX_SPEED / 2)
			motion = direction * MAX_SPEED / 2
#		wasHit = true
		set_deferred("wasHit", true)


