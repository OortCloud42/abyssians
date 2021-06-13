<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Player

**Extends:** [Actor](../Actor) < [KinematicBody2D](../KinematicBody2D)

## Description

## Constants Descriptions

### main\_menu

```gdscript
const main_menu: String = "res://scenes/UI.tscn"
```

Main menu scene path

### max\_hp

```gdscript
const max_hp: int = 5
```

Max number of lives

## Property Descriptions

### visibility

```gdscript
var visibility
```

Check if player is visible on screen, ussed for moving the camera

### damageTimer

```gdscript
var damageTimer
```

Knock-out timer, controls the knocked-out state after taking damage

### invincibleTimer

```gdscript
var invincibleTimer
```

Invincibilty timer, controls the short invincibility effect after taking damage to avoid getting stun-locked

### effectPlayer

```gdscript
var effectPlayer
```

Handles visual effects

### hitbox

```gdscript
var hitbox
```

Player's hitbox

### coins

```gdscript
var coins: int = 0
```

Number of coins

### lifes

```gdscript
var lifes: float = 3
```

Number of lives

### wasHit

```gdscript
var wasHit: bool
```

True when player is still flying after getting knocked back

### knockedOut

```gdscript
var knockedOut: bool
```

True when damagetimer is on and player is knocked out

### invincible

```gdscript
var invincible: bool
```

True when invincibletimer is on and player is invincible

## Method Descriptions

### get\_direction

```gdscript
func get_direction()
```

Gets direction in which player should be moved based on keyboard inputs

### get\_keys

```gdscript
func get_keys()
```

Gets other non-movement related keys

### play\_animations

```gdscript
func play_animations(direction: Vector2)
```

Plays player animations based on movement direction and position

### add\_coins

```gdscript
func add_coins(amount: int)
```

Adds coins on collision with coin sprite

### add\_lifes

```gdscript
func add_lifes(amount: float)
```

Adds lives on collision with coin sprite

## Signals

- signal exited_screen(position): Calls the _on_Player_exited_screen() function which moves the camera when player exited visible screen space
- signal hearts_update(lifes): 
