<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# MainMenu

**Extends:** [Control](../Control)

## Description

## Constants Descriptions

### entryCount

```gdscript
const entryCount: int = 3
```

Menu entry count

### settings

```gdscript
const settings: String = "res://scenes/Settings.tscn"
```

Settings menu scene path

### world

```gdscript
const world: String = "res://scenes/World.tscn"
```

World scene path

## Property Descriptions

### selector\_start

```gdscript
var selector_start
```

Start selector, used for starting the game

### selector\_settings

```gdscript
var selector_settings
```

Settings selector, used for switching to the settings menu

### selector\_exit

```gdscript
var selector_exit
```

Exit selector, used for exiting the game

### current\_selection

```gdscript
var current_selection
```

Current selection, used for selecting the desired setting and correct positioning of the cursor

## Method Descriptions

### handle\_selection

```gdscript
func handle_selection(_current_selection)
```

Changes scene based on selected entry

### set\_current\_selection

```gdscript
func set_current_selection(_current_selection)
```

Places the selection marker in the correct place