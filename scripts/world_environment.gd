extends WorldEnvironment

@export var rotationValue = 0.00025

func _physics_process(delta: float) -> void:
	environment.sky_rotation.y += rotationValue
	if environment.sky_rotation.y >= 360:
		environment.sky_rotation.y = 0
