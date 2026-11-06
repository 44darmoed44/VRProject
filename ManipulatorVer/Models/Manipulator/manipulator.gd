extends Node3D
class_name Manipulator

@export var y_axis: Node3D
@export var x_shoulder_1: Node3D
@export var x_shoulder_2: Node3D
@export var x_handle: Node3D
@export var arm_1: Arm
@export var arm_2: Arm

var cur_shoulder = 0
var m_mode_min = 0
var m_mode_max = 3

enum manipulator_mode {JOINT, SELF}
var current_manipulator_mode = manipulator_mode.JOINT

var open_m_arm_flag = false
var close_m_arm_flag = false
var m_direction: Vector2


func _process(delta: float) -> void:
	manipulator_controller(delta)


func manipulator_controller(delta):
	arm_1.is_opening = open_m_arm_flag
	arm_1.is_closing = close_m_arm_flag
	arm_2.is_closing = close_m_arm_flag
	arm_2.is_opening = open_m_arm_flag
	
	if current_manipulator_mode == manipulator_mode.SELF:
		match cur_shoulder:
			0:
				y_axis.rotate_y(m_direction.x * delta)
			1: 
				x_shoulder_1.rotate_z(m_direction.y * delta)
			2:
				x_shoulder_2.rotate_z(m_direction.y * delta)
			3:
				x_handle.rotate_z(m_direction.y * delta)
	if current_manipulator_mode == manipulator_mode.JOINT:
		match cur_shoulder:
			0:
				y_axis.rotate_y(m_direction.x * delta)
			1: 
				x_shoulder_1.rotate_z(m_direction.y * delta)
				x_shoulder_2.rotate_z(-m_direction.y * delta)
			2:
				x_shoulder_2.rotate_z(m_direction.y * delta)
			3:
				x_handle.rotate_z(m_direction.y * delta)


func change_m_mode():
	if current_manipulator_mode == 0: current_manipulator_mode += 1
	else: current_manipulator_mode -= 1


func change_shoulder(action: String):
	match action:
		"minus":
			cur_shoulder -= 1
			if cur_shoulder < m_mode_min: 
				cur_shoulder = m_mode_min
		"plus":
			cur_shoulder += 1
			if cur_shoulder > m_mode_max:
				cur_shoulder = m_mode_max
