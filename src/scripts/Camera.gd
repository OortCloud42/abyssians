extends Camera2D


var view_size

func _ready():
	pass



func _on_Player_exited_screen(position):
	view_size = get_viewport_rect().size
	print(view_size)
	print(position)
	print(self.position)
	if self.position.x > position.x:
		self.position.x -= view_size.x
	elif self.position.y > position.y:
		self.position.y -= view_size.y
	elif self.position.x + view_size.x < position.x:
		self.position.x += view_size.x
	elif self.position.y + view_size.y < position.y:
		self.position.y += view_size.y
