extends Node3D

@export var camera_list: Array[Viewport]
@export var camera_screen: Sprite3D
@export var player: Player
@export var lamp: MeshInstance3D
@export var m_mode_label: Label3D


var is_camera_changing = false
var current_camera


func _ready() -> void:
	player.change_move_flag.connect(can_change_camera)
	current_camera = camera_list[0]


func can_change_camera():
	is_camera_changing = not is_camera_changing
	lamp.material_override.shading_mode = not is_camera_changing
	camera_screen.visible = is_camera_changing
	m_mode_label.visible = is_camera_changing


func change_camera():
	var next_cam_id = camera_list.find(current_camera) + 1
	if next_cam_id == len(camera_list): next_cam_id = 0
	var vp_texture = ViewportTexture.new()
	vp_texture = camera_list[next_cam_id]
	camera_screen.texture = vp_texture.get_texture()
	current_camera = camera_list[next_cam_id]
	
