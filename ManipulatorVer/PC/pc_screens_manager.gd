class_name PCScreensManager
extends Node3D

signal power_switch()

@onready var screen := $Screen
@onready var power_light := $PowerLight
@onready var text_cam_num := $Screen/TextCamNum
@onready var manual_screen := $ManualScreen
@onready var text_tip_num := $ManualScreen/SlideChangeTip/ManualTxt2

@export var camera_list: Array[SubViewport]
@export var tips_list: Array[Node3D]

var is_turn_on := false
var cur_camera_idx := 0
var cur_tip_idx := 0


func _ready() -> void:
	connect("power_switch", _on_power_switch)
	text_cam_num.text = "Камера " + str(cur_camera_idx + 1)


func _unhandled_input(event: InputEvent) -> void:
	if is_turn_on:
		if Input.is_action_just_pressed("ui_right"):
			switch_camera(1)
		if Input.is_action_just_pressed("ui_left"):
			switch_camera(-1)
		if Input.is_action_just_pressed("next_tip"):
			switch_tip(1)
		if Input.is_action_just_pressed("prev_tip"):
			switch_tip(-1)


func _on_power_switch() -> void:
	is_turn_on = not is_turn_on
	if is_turn_on:
		screen.visible = true
		manual_screen.visible = true
		power_light.material_override.shading_mode = 0
	else:
		screen.visible = false
		manual_screen.visible = false
		power_light.material_override.shading_mode = 1


func switch_camera(step: int) -> void:
	cur_camera_idx += step
	if cur_camera_idx >= camera_list.size():
		cur_camera_idx = 0
	if cur_camera_idx < 0:
		cur_camera_idx = camera_list.size() - 1
	
	screen.texture.set_viewport_path_in_scene(
		camera_list[cur_camera_idx].get_path()
		)
	text_cam_num.text = "Камера " + str(cur_camera_idx + 1)


func switch_tip(step: int) -> void:
	cur_tip_idx += step
	if cur_tip_idx >= tips_list.size():
		cur_tip_idx = 0
	if cur_tip_idx < 0:
		cur_tip_idx = tips_list.size() - 1
	
	for tip in tips_list:
		tip.visible = false
	tips_list[cur_tip_idx].visible = true
	
	text_tip_num.text = str(cur_tip_idx + 1)
