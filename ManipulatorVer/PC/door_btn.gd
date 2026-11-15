extends Area3D

signal interact

@export var animator: AnimationPlayer
@export var grid: GridN

func _ready() -> void:
	connect("interact", _on_interact)


func _on_interact() -> void:
	animator.play("door_btn_press")
	grid.emit_signal("open_door")
