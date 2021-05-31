<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Actor

**Extends:** [KinematicBody2D](../KinematicBody2D)

## Description

## Property Descriptions

### ACCELERATION

```gdscript
export var ACCELERATION = 1
```

### MAX\_SPEED

```gdscript
export var MAX_SPEED = 80
```

### FRICTION

```gdscript
export var FRICTION = 1
```

### AIR\_FRICTION

```gdscript
export var AIR_FRICTION = 0.5
```

### GRAVITY

```gdscript
export var GRAVITY = 230
```

### JUMP\_SPEED

```gdscript
export var JUMP_SPEED = 120
```

more like jump force

### motion

```gdscript
var motion
```

speed, used by move_actor

### direction

```gdscript
var direction
```

direction

### sprite

```gdscript
var sprite
```

wygląd

### animationPlayer

```gdscript
var animationPlayer
```

backend for animations, plays animations

### stateMachine

```gdscript
var stateMachine
```

animation tree

## Method Descriptions

### move\_actor

```gdscript
func move_actor(delta, _direction)
```

Moves object based on ....