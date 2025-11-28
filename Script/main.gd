extends Node3D

var xr_interface: XRInterface

var camera_mouse_control = false
var camera_pivot
var mouse_sensitivity: float = 0.002
var vertical_angle_limit: float = 90.0
var rotation_h: float = 0.0
var rotation_v: float = 0.0

func _ready() -> void:
	xr_interface = XRServer.find_interface("OpenXR")
	
	if xr_interface and xr_interface.is_initialized():
		print("all good")
		
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		get_viewport().use_xr = true
	else:
		print("vr doesn't connect")
		camera_mouse_control = true
		camera_pivot = $Character.camera_pivot
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	if camera_mouse_control:
		# Обработка движения мыши
		if event is InputEventMouseMotion:
			if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
				# Горизонтальное вращение
				rotation_h -= event.relative.x * mouse_sensitivity
				# Вертикальное вращение
				rotation_v -= event.relative.y * mouse_sensitivity
				rotation_v = clamp(rotation_v, deg_to_rad(-vertical_angle_limit), deg_to_rad(vertical_angle_limit))
				
				# Применяем вращение
				camera_pivot.rotation.y = rotation_h
				camera_pivot.rotation.x = rotation_v
		
		# Переключение захвата мыши по нажатию Esc
		if event is InputEventKey and event.pressed:
			if event.keycode == KEY_ESCAPE:
				get_tree().quit()
