extends Node3D
class_name Invalid_Indicator

@onready var label: Label3D = $Label3D

var camera_pos: Vector3

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	if visible:
		camera_pos = Globals.camera.global_transform.origin
		camera_pos.y = 0
		look_at(camera_pos, Vector3(0, 1, 0))

func indicate():
	show()
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(label, "position:x", -.1, 0.06)
	tw.tween_property(label, "position:x", .1, 0.06)
	tw.tween_property(label, "position:x", -.1, 0.06)
	tw.tween_property(label, "position:x", .1, 0.06)
	tw.tween_callback(hide)
