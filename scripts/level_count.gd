extends Label
class_name Level_Count

func _ready() -> void:
	Globals.level_count = self

func set_level(level: int, max: int):
	text = "Stage: " + str(level) + "/" + str(max)
