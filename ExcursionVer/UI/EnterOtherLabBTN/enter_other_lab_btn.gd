extends CanvasLayer

func _on_button_pressed():
	RoomConfiguration.room_updater.change_laboratory()
