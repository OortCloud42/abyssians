<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SettingsMenu

**Extends:** [Control](../Control)

## Description

## Constants Descriptions

### entryCount

```gdscript
const entryCount: int = 5
```

Menu entry count

### main\_menu

```gdscript
const main_menu: String = "res://scenes/UI.tscn"
```

Main UI scene path

## Property Descriptions

### selector\_setting1

```gdscript
var selector_setting1
```

First selector

### selector\_setting2

```gdscript
var selector_setting2
```

Second selector

### selector\_setting3

```gdscript
var selector_setting3
```

Third selector

### selector\_setting4

```gdscript
var selector_setting4
```

Fourth selector

### selector\_exit

```gdscript
var selector_exit
```

Last selector, used for exiting the settings menu

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