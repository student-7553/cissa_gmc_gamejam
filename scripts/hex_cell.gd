extends Node3D
class_name Hex_Cell

# Possible improvement this script itself handles showing the cell 
# How do we handle the synergy

const CORNER_ANGLE: float = 60
const CELL_WIDTH: float = 2

var currentPoint = 0
var basePoint = 0
var save_pos: Vector3

signal select_cell(cell: Hex_Cell)

func _ready() -> void:
	save_pos = position

func check_status(cell: Hex_Cell):
	pass

func mouse_entered() -> void:
	select_cell.emit(self)

func pop_up():
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y + 0.51, 0.25)

func pop_down():
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y, 0.25)
