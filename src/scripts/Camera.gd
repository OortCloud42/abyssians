extends Camera2D

class_name PlayerCamera

# Camera size
var view_size

# Moves the camera when player exits the visible screen space
func _on_Player_exited_screen(position : Vector2):
	view_size = get_viewport_rect().size
	if self.position.x > position.x:
		self.position.x -= view_size.x
	elif self.position.y > position.y:
		self.position.y -= view_size.y
	elif self.position.x + view_size.x < position.x:
		self.position.x += view_size.x
	elif self.position.y + view_size.y < position.y:
		self.position.y += view_size.y
