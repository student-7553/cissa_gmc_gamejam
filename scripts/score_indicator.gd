extends Label3D
class_name Score_Indicator

@onready var anim: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	visible = false

func indicate(amount: int):
	text = "+" + str(amount)
	anim.play("indicate")
