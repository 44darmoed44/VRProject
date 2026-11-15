class_name PCPlayer
extends CharacterBody3D

@onready var pivot := $Pivot
@onready var ray_cast := $Pivot/Camera3D/RayCast3D
@onready var screen_center_point := $Pivot/Camera3D/ColorRect
@onready var camera := $Pivot/Camera3D

@export var manipulator: Manipulator

var move_speed := 250
var mouse_sensitivity := 0.003
var man_speed := 5.0

var is_man_control := false
var is_zooming := false
var is_r_btn_mouse_pressed := false


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Input.is_mouse_button_pressed(1) and Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		if not is_r_btn_mouse_pressed:
			is_zooming = not is_zooming
			if is_zooming: 
				camera.fov = 35
				mouse_sensitivity = 0.0015
			else: 
				camera.fov = 75
				mouse_sensitivity = 0.003
			is_r_btn_mouse_pressed = true
	else: is_r_btn_mouse_pressed = false
	
	
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED and \
											event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		pivot.rotation.x = clamp(pivot.rotation.x, -PI/2, PI/2)


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta: float) -> void:
	interact_control()
	if not is_man_control: movement_control(delta)
	else: man_control(delta)
	move_and_slide()


func movement_control(delta: float) -> void:
	var vect = Input.get_vector("move_l", "move_r", "move_u", "move_d")
	var dir = transform.basis * Vector3(vect.x, 0, vect.y).normalized()
	
	if dir:
		velocity.x = dir.x * move_speed * delta
		velocity.z = dir.z * move_speed * delta
	else:
		velocity = Vector3.ZERO
	
	if not is_on_floor(): velocity += get_gravity() * 25 * delta


func interact_control() -> void:
	var obj = ray_cast.get_collider()
	
	# UI update
	if ray_cast.is_colliding() and "InteractiveObject" in obj.get_groups():
		screen_center_point.color = Color.RED
		if Input.is_action_just_pressed("interact"):
			obj.emit_signal("interact")
	else:
		screen_center_point.color = Color.WHITE


func man_control(delta: float) -> void:
	if Input.is_action_pressed("sh1_l"):
		manipulator.y_axis.rotate_y(-man_speed * delta)
	if Input.is_action_pressed("sh1_r"):
		manipulator.y_axis.rotate_y(man_speed * delta)
	if Input.is_action_pressed("sh2_u"):
		manipulator.x_shoulder_1.rotate_z(-man_speed * delta)
	if Input.is_action_pressed("sh2_d"):
		manipulator.x_shoulder_1.rotate_z(man_speed * delta)
	if Input.is_action_pressed("sh3_u"):
		manipulator.x_shoulder_2.rotate_z(-man_speed * delta)
	if Input.is_action_pressed("sh3_d"):
		manipulator.x_shoulder_2.rotate_z(man_speed * delta)
	if Input.is_action_pressed("sh4_u"):
		manipulator.x_handle.rotate_z(-man_speed * delta)
	if Input.is_action_pressed("sh4_d"):
		manipulator.x_handle.rotate_z(man_speed * delta)
	if Input.is_action_pressed("h_o"):
		manipulator.open_m_arm_flag = true
	else:
		manipulator.open_m_arm_flag = false
	if Input.is_action_pressed("h_c"): 
		manipulator.close_m_arm_flag = true
	else:
		manipulator.close_m_arm_flag = false
