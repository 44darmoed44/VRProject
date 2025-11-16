extends CanvasLayer

@export var btn_name: String
@export var room_updater: RoomUpdater

func _on_button_pressed():
	var current_room_name = room_updater.room_name
	var new_room_name = RoomConfiguration.room_config[current_room_name][btn_name]
	print(new_room_name, " ", btn_name)
	if new_room_name != "pass":
		room_updater.update_room(new_room_name)
	
