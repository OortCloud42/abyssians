<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Actor

**Extends:** [KinematicBody2D](../KinematicBody2D)

## Description

## Property Descriptions

### ACCELERATION

```gdscript
export var ACCELERATION = 1
```

How fast does the actor accelerate

### MAX\_SPEED

```gdscript
export var MAX_SPEED = 80
```

Maximum speed cap at which the actor can move

### FRICTION

```gdscript
export var FRICTION = 1
```

Reverse acceleration, how fast does the actor slow down without user input

### AIR\_FRICTION

```gdscript
export var AIR_FRICTION = 0.5
```

How fast does the actor slow down in air without user input

### GRAVITY

```gdscript
export var GRAVITY = 230
```

How fast does the actor accelerate towards ground when in air

### JUMP\_SPEED

```gdscript
export var JUMP_SPEED = 120
```

Jump force. how high can the actor jump

### motion

```gdscript
var motion
```

Speed and direction of motion, used by move_actor

### direction

```gdscript
var direction
```

Direction in which the actor should move

### sprite

```gdscript
var sprite
```

Appearance of the actor

### animationPlayer

```gdscript
var animationPlayer
```

Handles animations

### stateMachine

```gdscript
var stateMachine
```

Animation tree, allows easy switching between animations

## Method Descriptions

### move\_actor

```gdscript
func move_actor(delta, _direction)
```

Moves object based on direction, usually based on user input or pathfinding code\
Currently used for player class with get_direction()