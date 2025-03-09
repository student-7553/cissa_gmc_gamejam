extends Node3D
class_name Hex_Cell

# Possible improvement this script itself handles showing the cell 
# How do we handle the synergy

const ANGLE: float = 60
const CELL_WIDTH: float = 2
const SIDES: int = 6
const HEX_DIRECTIONS: Array[Vector3] = [Vector3(0, 1, 0), Vector3(0, 0, 1), Vector3(1, 0, 0), Vector3(0, -1, 0), Vector3(0, 0, -1), Vector3(-1, 0, 0)]

var current_score = 0
var base_score = 0
var save_pos: Vector3
var cube_coord: Vector3 ## Position in the hex grid (q, r, s)
var neighbours: Array[Hex_Cell]

signal select_cell(cell: Hex_Cell)

func _ready() -> void:
	save_pos = position

func find_neighbours():
	"""
	Could declare a reference to grid and simply reference the array
	"""
	pass

func test() -> void:
	select_cell.emit(self)
	print(cube_coord)

func pop_up():
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y + 0.51, 0.25)

func pop_down():
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y, 0.25)
	tw.tween_callback(find_neighbours)
