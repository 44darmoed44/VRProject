extends Node3D
class_name RoomUpdater

@export var room_name: String
@export var type_laboratory: String
@export var animator: AnimationPlayer

@onready var room_model := $RoomModel
@onready var btn_dict = {
	"forward" : $MoveForward,
	"back" : $MoveBack,
	"right" : $MoveRight,
	"left" : $MoveLeft
}

var room: Node3D
var next_room_name: String

func _ready():
	load_room()
	# connect animation finished signal
	animator.connect("animation_finished", animation_finished) 


func load_room(new_room_name: String = room_name):
	# delete old room
	if room != null: clear_room()
	
	# load room
	var room_dict_inst = RoomConfiguration.room_preload[type_laboratory]
	var room_inst = room_dict_inst[new_room_name]
	var room_dict = RoomConfiguration.room_config[type_laboratory]
	var room_ratio = room_dict[new_room_name]["ratio_y"]
	room = room_inst.instantiate()
	room_name = new_room_name
	room_model.add_child(room)
	room_model.rotation = Vector3(0, deg_to_rad(room_ratio), 0)
	
	# enable all transfer buttons
	for btn in btn_dict.values():
		btn.enabled = true
		btn.visible = true
	
	# disabled "pass" transfer buttons
	var room_btn_dict = RoomConfiguration.room_config[type_laboratory][room_name]
	for key in room_btn_dict.keys():
		if key == "ratio_y": continue
		if room_btn_dict[key] == "pass":
			disable_transfer_btn(key)

func clear_room():
	room_model.remove_child(room)
	room.queue_free()
 

func animation_finished(anim_name):
	if anim_name == "transit_in":
		load_room(next_room_name)
		animator.play("transit_out")

func disable_transfer_btn(btn_name: String):
	var btn = btn_dict[btn_name]
	btn.enabled = false
	btn.visible = false


func _input(event):
	if event.is_action_pressed("ui_up"):
		next_room_name = RoomConfiguration.room_config[type_laboratory][room_name]["forward"]
	elif event.is_action_pressed("ui_down"):
		next_room_name = RoomConfiguration.room_config[type_laboratory][room_name]["back"]
	elif event.is_action_pressed("ui_right"):
		next_room_name = RoomConfiguration.room_config[type_laboratory][room_name]["right"]
	elif event.is_action_pressed("ui_left"):
		next_room_name = RoomConfiguration.room_config[type_laboratory][room_name]["left"]
	
	if Input.is_anything_pressed():
		if next_room_name == "pass" or next_room_name == room_name: return
		animator.play("transit_in")
