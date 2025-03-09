## Manages the Logic for player input, etc

extends Node
class_name Grid_Manager

const HEX_DIRECTIONS: Array[Vector3] = [Vector3(0, 1, 0), Vector3(0, 0, 1), Vector3(1, 0, 0), Vector3(0, -1, 0), Vector3(0, 0, -1), Vector3(-1, 0, 0)]

@export var grid: Hex_Grid

var current_cell: Hex_Cell
var cardManager: CardManager

func _ready() -> void:
	for cell in grid.grid.values():
		cell.select_cell.connect(select_new_cell)

	cardManager = get_node("../CardManager")
	assert(cardManager != null, "CardManager could not be found")

func select_new_cell(cell: Hex_Cell):
	if current_cell == null:
		current_cell = cell
		current_cell.pop_up()
		return
	current_cell.pop_down()
	current_cell = cell
	current_cell.pop_up()

## Get the adjacent cells
func get_neighbours(pos: Vector3) -> Array[Hex_Cell]:
	var hex_array: Array[Hex_Cell] = []
	for hex_dir in HEX_DIRECTIONS:
		hex_array.append(grid.grid[hex_dir])
	return hex_array

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and current_cell:
		current_cell.rotate_ray()

func _input(event):
	if event.is_action_pressed("click") && current_cell != null:
		current_cell.handleClick(cardManager.getTopCard())
		## Handle Synergy
		current_cell.synergy.scan_neighbours(get_neighbours(current_cell.cube_coord))
