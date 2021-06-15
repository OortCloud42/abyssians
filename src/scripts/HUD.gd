extends CanvasLayer

class_name HUD

onready var heart1 = $Control/Sprite
onready var heart2 = $Control/Sprite2
onready var heart3 = $Control/Sprite3
onready var heart4 = $Control/Sprite4
onready var heart5 = $Control/Sprite5
onready var coincounter = $HBoxContainer/Label

func _ready():
	heart1.frame = 2
	heart2.frame = 2
	heart3.frame = 2
	heart4.frame = 0
	heart5.frame = 0
	coincounter.text = "0000"


func _on_Player_hearts_update(lifes):
	if lifes <= 1:
		heart1.frame = lifes * 2
		heart2.frame = 0
		heart3.frame = 0
		heart4.frame = 0
		heart5.frame = 0
	elif lifes <= 2:
		heart1.frame = 2
		heart2.frame = (lifes - 1) * 2
		heart3.frame = 0
		heart4.frame = 0
		heart5.frame = 0
	elif lifes <= 3:
		heart1.frame = 2
		heart2.frame = 2
		heart3.frame = (lifes - 2) * 2
		heart4.frame = 0
		heart5.frame = 0
	elif lifes <= 4:
		heart1.frame = 2
		heart2.frame = 2
		heart3.frame = 2
		heart4.frame = (lifes - 3) * 2
		heart5.frame = 0
	elif lifes <= 5:
		heart1.frame = 2
		heart2.frame = 2
		heart3.frame = 2
		heart4.frame = 2
		heart5.frame = (lifes - 4) * 2


func _on_Player_coins_update(coins):
	coincounter.text = str(coins).pad_zeros(4)
