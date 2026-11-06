extends CharacterBody3D

var move_speed := 250
var mouse_sensitivity := 0.003

@onready var pivot := $Pivot

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED and \
											event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		pivot.rotation.x = clamp(pivot.rotation.x, -PI/2, PI/2)


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta: float) -> void:
	
	var vect = Input.get_vector("move_l", "move_r", "move_u", "move_d")
	var dir = transform.basis * Vector3(vect.x, 0, vect.y).normalized()
	
	if dir:
		velocity.x = dir.x * move_speed * delta
		velocity.z = dir.z * move_speed * delta
	else:
		velocity = Vector3.ZERO
	
	if not is_on_floor(): velocity += get_gravity() * 25 * delta
	
	move_and_slide()
