extends Node2D

class_name Coin

# Defines the coin's hitbox
onready var hitbox = $Area2D/CollisionShape2D
# Defines the coin's sprite
onready var sprite = $Sprite

# Possible coin sizes
enum Size {Small, Big}

# Sets coin type based on size
export (Size) var Type = Size.Small

# Value of the coin, based on type
var value : int

# Sets correct value and hitbox and sprite sizes based on coin type
func _ready():
	if Type == Size.Small:
		hitbox.get_shape().set_extents(Vector2(3, 3))
		sprite.set_frame(0)
		value = 1
	elif Type == Size.Big:
		hitbox.get_shape().set_extents(Vector2(5, 5))
		sprite.set_frame(1)
		value = 3

# Adds coins on collision with player
func _on_Area2D_body_entered(body : Node):
	if body.add_coins(value):
		queue_free()
#		set_deferred("area.monitoring", false)
#		area.set_monitoring(false)
#		effect.interpolate_property(self, 'position', self.position, 
#				self.position + Vector2(3,3), 0.5, Tween.TRANS_LINEAR, 
#				Tween.EASE_OUT_IN)


#func _on_Tween_tween_all_completed():
#	queue_free()
