extends CanvasLayer

class_name HUD

# Heart sprites
onready var hearts=[$Control/Sprite,
					$Control/Sprite2,
					$Control/Sprite3,
					$Control/Sprite4,
					$Control/Sprite5]
# Coin display
onready var coincounter = $HBoxContainer/Label


# Set heart sprites to correct frames
func _ready():
	hearts[0].frame = 2;
	hearts[1].frame = 2;
	hearts[2].frame = 2;
	hearts[3].frame = 0;
	hearts[4].frame = 0;
	coincounter.text = "0000"


# Update hearts
func _on_Player_hearts_update(lifes):
	if lifes <= 1:
		hearts[0].frame = lifes * 2
		hearts[1].frame = 0
		hearts[2].frame = 0
		hearts[3].frame = 0
		hearts[4].frame = 0
	elif lifes <= 2:
		hearts[0].frame = 2
		hearts[1].frame = (lifes - 1) * 2
		hearts[2].frame = 0
		hearts[3].frame = 0
		hearts[4].frame = 0
	elif lifes <= 3:
		hearts[0].frame = 2
		hearts[1].frame = 2
		hearts[2].frame = (lifes - 2) * 2
		hearts[3].frame = 0
		hearts[4].frame = 0
	elif lifes <= 4:
		hearts[0].frame = 2
		hearts[1].frame = 2
		hearts[2].frame = 2
		hearts[3].frame = (lifes - 3) * 2
		hearts[4].frame = 0
	elif lifes <= 5:
		hearts[0].frame = 2
		hearts[1].frame = 2
		hearts[2].frame = 2
		hearts[3].frame = 2
		hearts[4].frame = (lifes - 4) * 2


func _on_Player_coins_update(coins):
	coincounter.text = str(coins).pad_zeros(4)
