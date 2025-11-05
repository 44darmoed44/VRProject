extends Node3D
class_name RoomUpdater

@export var room_name: String
@export var animator: AnimationPlayer

@onready var room_model := $RoomModel
@onready var btn_dict = {
	"forward" : $MoveForward,
	"back" : $MoveBack,
	"right" : $MoveRight,
	"left" : $MoveLeft
}

var room: Node3D

func _ready():
	load_room()


func load_room(name: String = room_name):
	# load room
	var room_inst = RoomConfiguration.room_preload[name]
	var room_ratio = RoomConfiguration.room_config[name]["ratio_y"]
	room = room_inst.instantiate()
	room_name = name
	room_model.add_child(room)
	room_model.rotation = Vector3(0, deg_to_rad(room_ratio), 0)
	
	# enable all transfer buttons
	for btn in btn_dict.values():
		btn.enabled = true
		btn.visible = true
	
	# disabled "pass" transfer buttons
	var room_btn_dict = RoomConfiguration.room_config[room_name]
	for key in room_btn_dict.keys():
		if key == "ratio_y": continue
		if room_btn_dict[key] == "pass":
			disable_transfer_btn(key)

func clear_room():
	room_model.remove_child(room)
	room.queue_free()
 

func update_room(new_room_name: String):
	animator.play("transit_in")
	clear_room()
	load_room(new_room_name)
	animator.play("transit_out")


func disable_transfer_btn(btn_name: String):
	var btn = btn_dict[btn_name]
	btn.enabled = false
	btn.visible = false
