extends Node3D

@export var player: Player


func _on_table_btn_button_pressed(button: Variant) -> void:
	player.emit_signal("change_move_flag")


func _on_door_btn_button_pressed(button: Variant) -> void:
	$GridN.emit_signal("open_door")
