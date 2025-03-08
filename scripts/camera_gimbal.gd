extends Node3D

@export var rotationSpeed = PI / 2
@export var maxZoom = 3.0
@export var minZoom = 0.5
@export var zoomSpeed = 0.09

var zoom = 1.5

func _process(delta: float) -> void:
	get_keyboard_input(delta)
	$CameraGimbalY/CameraGimbalX.rotation.x = clamp($CameraGimbalY/CameraGimbalX.rotation.x, -0.5,.5)
	$CameraGimbalY.scale = lerp(scale, Vector3.ONE * zoom, zoomSpeed)
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("zoom_in"):
		zoom -= zoomSpeed
	if event.is_action_pressed("zoom_out"):
		zoom += zoomSpeed
		
	zoom = clamp(zoom, minZoom, maxZoom)
	
	scale = Vector3.ONE * zoom
	
func get_keyboard_input(delta: float) -> void:
	var yRotation = 0
	if Input.is_action_pressed("rotate_right"):
		yRotation += 1
	if Input.is_action_pressed("rotate_left"):
		yRotation -= 1
	$CameraGimbalY.rotate_object_local(Vector3.UP, yRotation * rotationSpeed * delta)

	var xRotation = 0
	if Input.is_action_pressed("rotate_down"):
		xRotation += 1
	if Input.is_action_pressed("rotate_up"):
		xRotation -= 1
	$CameraGimbalY/CameraGimbalX.rotate_object_local(Vector3.RIGHT, xRotation * rotationSpeed * delta)
