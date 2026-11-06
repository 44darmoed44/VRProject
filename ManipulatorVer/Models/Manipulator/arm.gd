extends StaticBody3D
class_name Arm

@export var manipulator: Manipulator
@export var progress: PathFollow3D
@export var checkbox: Area3D

var is_opening = false
var is_closing = false

var speed := .2

var grapped_obj: Node3D 


func _ready() -> void:
	if checkbox != null:
		checkbox.body_entered.connect(_on_body_entered)


func _process(delta: float) -> void:
	if is_opening:
		progress.progress_ratio += speed * delta
		if grapped_obj != null:
			grapped_obj.reparent(get_tree().current_scene)
			grapped_obj.freeze = false
	if is_closing:
		progress.progress_ratio -= speed * delta


func _on_body_entered(body):
	if is_closing and body is RigidBody3D:
		grapped_obj = body
		grapped_obj.freeze = true
		body.reparent(self)
