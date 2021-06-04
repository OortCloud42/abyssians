extends Node2D

class_name Heart

onready var hitbox = $Area2D/CollisionShape2D
onready var area = $Area2D
onready var sprite = $Sprite


enum Size {Small, Medium, Big}
export (Size) var Type = Size.Small

var value : float


func _ready():
	if Type == Size.Small:
		hitbox.get_shape().set_extents(Vector2(4, 4))
		sprite.set_frame(0)
		value = 0.5
	elif Type == Size.Medium:
		hitbox.get_shape().set_extents(Vector2(6, 6))
		sprite.set_frame(1)
		value = 1
	elif Type == Size.Big:
		hitbox.get_shape().set_extents(Vector2(7, 7))
		sprite.set_frame(2)
		value = 3


func _on_Area2D_body_entered(body : Node):
	if body.add_lifes(value):
		queue_free()
#		set_deferred("area.monitoring", false)
#		area.set_monitoring(false)
#		effect.interpolate_property(self, 'position', self.position, self.position + Vector2(3,3), 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)


#func _on_Tween_tween_all_completed():
#	queue_free()
