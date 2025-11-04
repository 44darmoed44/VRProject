extends Node3D
class_name RoomUpdater

@export var room_name: String

@onready var room_model := $RoomModel

var room: Node3D

func _ready():
	load_room()


func load_room(name: String = room_name):
	var room_inst = RoomConfiguration.room_preload[name]
	var room_ratio = RoomConfiguration.room_config[name]["ratio_y"]
	room = room_inst.instantiate()
	room_name = name
	room_model.add_child(room)
	room_model.rotation = Vector3(0, deg_to_rad(room_ratio), 0)


func clear_room():
	room_model.remove_child(room)
	room.queue_free()
 
func update_room(new_room_name: String):
	clear_room()
	load_room(new_room_name)
