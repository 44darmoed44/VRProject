extends Node3D

signal open_door

@onready var animator := $AnimationPlayer

var is_open = false

func _ready() -> void:
	open_door.connect(change_door_status)


func change_door_status():
	if animator.is_playing():
		return
	if is_open:
		animator.play("close")
	else:
		animator.play("open")
	await animator.animation_finished
	is_open = not is_open
