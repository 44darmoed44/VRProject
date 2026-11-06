extends XROrigin3D
class_name Player

signal change_move_flag

@export var manipulator: Manipulator
@export var m_mode_label: Label3D
@export var camera_controller: Node3D

var can_move = true

func _process(delta: float) -> void:
	if can_move: return
	update_m_label()


func update_m_label():
	m_mode_label.text = "Выбранное плечо: \n" + str(manipulator.cur_shoulder)
	match manipulator.current_manipulator_mode:
		manipulator.manipulator_mode.JOINT:
			m_mode_label.text += "\n Включен режим: JOINT"
		manipulator.manipulator_mode.SELF:
			m_mode_label.text += "\n Включен режим: SELF"



func _on_change_move_flag() -> void:
	can_move = not can_move 
	$LeftHand/MovementDirect.enabled = can_move


func _on_left_hand_input_vector_2_changed(name: String, value: Vector2) -> void:
	if can_move: return
	manipulator.m_direction = value


func _on_left_hand_button_released(name: String) -> void:
	if not can_move:
		match name:
			"by_button":
				manipulator.change_shoulder("plus")
			"ax_button":
				manipulator.change_shoulder("minus")
			"trigger_click":
				manipulator.change_m_mode()


func _on_right_hand_button_released(name: String) -> void:
	if not can_move:
		match name:
			"trigger_click":
				camera_controller.change_camera()
			"ax_button":
				manipulator.close_m_arm_flag = false
			"by_button":
				manipulator.open_m_arm_flag = false


func _on_right_hand_button_pressed(name: String) -> void:
	if not can_move:
		match name:
			"ax_button": 
				manipulator.close_m_arm_flag = true
			"by_button":
				manipulator.open_m_arm_flag = true
