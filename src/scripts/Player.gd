extends Actor

class_name Player

# Calls the _on_Player_exited_screen() function which moves the camera when player exited visible screen space
signal exited_screen(position)

const main_menu = "res://scenes/UI.tscn"

# sprawdzenie czy gracz jest widoczny na ekranie
onready var visibility = $VisibilityNotifier2D
# more like nieprzytomność timer
onready var damageTimer = get_node("DamageTimer")
# nietykalność timer
onready var invincibleTimer = get_node("InvincibleTimer")
# handles visual player effects
onready var effectPlayer = get_node("EffectPlayer")

# true when player is still flying 
var wasHit = false
# true when damagetimer is on, player knocked out
var knockedOut = false
# true when invincibletimer is on
var invincible = false

# Handles player's physics
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

# Gets direction in which player should be moved based on keyboard inputs
func get_direction():
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-Input.get_action_strength("jump") if is_on_floor() and Input.is_action_just_pressed("jump") else 0.0)

# Gets other non-movement related keys
func get_keys():
	var keys = {
		"escape": Input.get_action_strength("escape"),
	}
	return keys

# Plays player animations based on movement direction and position
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

# Initiates the invincibility timer after being stunned
func _on_DamageTimer_timeout():
	knockedOut = false
	invincible = true
	stateMachine.travel("Stand")
	effectPlayer.play("Invincible")
	invincibleTimer.start(3)

# Disables invincibility after invincibility timer times out
func _on_InvincibleTimer_timeout():
	invincible = false

# Checks if player collided with enemy
func _on_Area2D_body_entered(body):
	if body.name != "TileMap" and !wasHit and body.name != "Player" and !knockedOut and !invincible:
		if (position - body.position).normalized().x > 0:
			direction = Vector2(1, -1)
			motion = direction * MAX_SPEED / 2
		else:
			direction = Vector2(-1, -1)
			motion = direction * MAX_SPEED / 2
		wasHit = true


