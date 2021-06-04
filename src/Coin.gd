extends Node2D

class_name Coin

onready var hitbox = $Area2D/CollisionShape2D
onready var area = $Area2D
onready var sprite = $Sprite


enum Size {Small, Big}
export (Size) var Type = Size.Small


func _ready():
	if Type == Size.Small:
		hitbox.get_shape().set_extents(Vector2(3, 3))
		sprite.set_frame(0)
	elif Type == Size.Big:
		hitbox.get_shape().set_extents(Vector2(3, 3))
		sprite.set_frame(1)


func _on_Area2D_body_entered(body : Node):
	if body.add_coins(1 if Type == Size.Small else 3):
		queue_free()
#		set_deferred("area.monitoring", false)
#		area.set_monitoring(false)
#		effect.interpolate_property(self, 'position', self.position, self.position + Vector2(3,3), 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)


#func _on_Tween_tween_all_completed():
#	queue_free()
