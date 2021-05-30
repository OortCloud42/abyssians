<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Player

**Extends:** [Actor](../Actor) < [KinematicBody2D](../KinematicBody2D)

## Description

## Constants Descriptions

### main\_menu

```gdscript
const main_menu: String = "res://scenes/UI.tscn"
```

## Property Descriptions

### visibility

```gdscript
var visibility
```

### damageTimer

```gdscript
var damageTimer
```

### invincibleTimer

```gdscript
var invincibleTimer
```

### effectPlayer

```gdscript
var effectPlayer
```

### wasHit

```gdscript
var wasHit
```

### knockedOut

```gdscript
var knockedOut
```

### invincible

```gdscript
var invincible
```

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
func play_animations(direction)
```

Plays player animations based on movement direction and position

## Signals

- signal exited_screen(position): Calls the _on_Player_exited_screen() function which moves the camera when player exited visible screen space
