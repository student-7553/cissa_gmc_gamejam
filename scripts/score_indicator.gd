extends Label3D
class_name Score_Indicator

@onready var anim: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	visible = false

func play_anim():
	anim.play("indicate")
