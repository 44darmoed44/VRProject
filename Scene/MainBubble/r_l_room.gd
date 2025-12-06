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
@onready var transf_node := $TransfBTN

var room: Node3D
var next_room_name: String

func _ready():
	load_room()
	# connect animation finished signal
	animator.connect("animation_finished", animation_finished) 
	
	RoomConfiguration.room_updater = self


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
	var lab_trasf_key = null
	for key in room_btn_dict.keys():
		if key == "ratio_y": continue
		if key == "lab_transf": 
			lab_trasf_key = key
			continue
		if room_btn_dict[key] == "pass":
			disable_transfer_btn(key)
	
	print(room_name)
	
	if lab_trasf_key == null:
		clear_change_lab_btns()
	else:
		var tn_btn_inst : PackedScene = load("res://UI/EnterOtherLabBTN/lab_trans_viewport.tscn")
		var tn_btn = tn_btn_inst.instantiate()
		transf_node.add_child(tn_btn)
		
		var btn_par_dict = room_btn_dict[lab_trasf_key]
		tn_btn.position = btn_dict[btn_par_dict["pos"]].position
		match btn_par_dict["pos"]:
			"forward":
				tn_btn.position.z -= 3
			"back":
				tn_btn.position.z += 3
			"left":
				tn_btn.position.x -= 3
			"right":
				tn_btn.position.x += 3
		tn_btn.position.y = 3
		#tn_btn.update_data(btn_par_dict["next_lab"], btn_par_dict["next_room"])
	

func clear_room():
	room_model.remove_child(room)
	room.queue_free()
 

func update_room(new_room):
	animator.play("transit_in")
	next_room_name = new_room


func clear_change_lab_btns():
	var tn_children = transf_node.get_children()
	if tn_children.size() > 0:
		for child in tn_children:
			child.queue_free()
	


func change_laboratory():
	var lab_transf_dict = RoomConfiguration.room_config[type_laboratory][room_name]["lab_transf"]
	var next_lab = lab_transf_dict["next_lab"]
	var next_room = lab_transf_dict["next_room"]
	type_laboratory = next_lab
	next_room_name = next_room
	clear_change_lab_btns()
	animator.play("transit_in")


func animation_finished(anim_name):
	if anim_name == "transit_in":
		load_room(next_room_name)
		animator.play("transit_out")

func disable_transfer_btn(btn_name: String):
	var btn = btn_dict[btn_name]
	btn.enabled = false
	btn.visible = false


func _input(event):
	var move: bool = false
	if event.is_action_pressed("ui_up"):
		next_room_name = RoomConfiguration.room_config[type_laboratory][room_name]["forward"]
		move = true
	elif event.is_action_pressed("ui_down"):
		next_room_name = RoomConfiguration.room_config[type_laboratory][room_name]["back"]
		move = true
	elif event.is_action_pressed("ui_right"):
		next_room_name = RoomConfiguration.room_config[type_laboratory][room_name]["right"]
		move = true
	elif event.is_action_pressed("ui_left"):
		next_room_name = RoomConfiguration.room_config[type_laboratory][room_name]["left"]
		move = true
	
	if move:
		if next_room_name == "pass" or next_room_name == room_name: return
		animator.play("transit_in")
