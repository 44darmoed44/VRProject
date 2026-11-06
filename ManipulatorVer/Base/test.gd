extends Node3D

@onready var manipulator := $Manipulator

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_A: 
			manipulator.y_axis.rotate_y(25)
		if event.keycode == KEY_D:
			manipulator.y_axis.rotate_y(-25)
