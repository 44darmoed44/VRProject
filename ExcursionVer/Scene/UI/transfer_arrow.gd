extends CanvasLayer

@export var player: XROrigin3D
@export var tp_point: Marker3D 



func _on_button_pressed():
	player.global_position = tp_point.global_position
