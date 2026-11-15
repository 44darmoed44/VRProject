extends Area3D

signal interact

@export var player: PCPlayer
@export var animator: AnimationPlayer

func _ready() -> void:
	connect("interact", _on_interact)


func _on_interact() -> void:
	animator.play("man_control_btn_press")
	player.is_man_control = not player.is_man_control
