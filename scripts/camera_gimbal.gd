extends Node3D

@export var rotationSpeed = PI / 2
@export var maxZoom = 3.0
@export var minZoom = 0.5
@export var zoomSpeed = 2.5
@export var zoom_increment = .5

@onready var gimbal_x: Node3D = $CameraGimbalY/CameraGimbalX
@onready var gimbal_y: Node3D = $CameraGimbalY

var zoom = 1.5

func _process(delta: float) -> void:
	get_keyboard_input(delta)
	gimbal_x.rotation.x = clamp(gimbal_x.rotation.x, -0.5,.5) # Rotation
	scale = lerp(scale, Vector3.ONE * zoom, zoomSpeed * delta) # Zoom

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("zoom_in"):
		zoom -= zoom_increment
	if event.is_action_pressed("zoom_out"):
		zoom += zoom_increment
		
	zoom = clamp(zoom, minZoom, maxZoom)

func get_keyboard_input(delta: float) -> void:
	var yRotation = 0
	if Input.is_action_pressed("rotate_right"):
		yRotation += 1
	if Input.is_action_pressed("rotate_left"):
		yRotation -= 1
	gimbal_y.rotate_object_local(Vector3.UP, yRotation * rotationSpeed * delta)

	var xRotation = 0
	if Input.is_action_pressed("rotate_down"):
		xRotation += 1
	if Input.is_action_pressed("rotate_up"):
		xRotation -= 1
	gimbal_x.rotate_object_local(Vector3.RIGHT, xRotation * rotationSpeed * delta)
