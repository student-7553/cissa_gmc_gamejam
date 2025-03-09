## Manages the Logic for player input, etc

extends Node
class_name Grid_Manager

@export var grid: Hex_Grid

var current_cell: Hex_Cell

func _ready() -> void:
	for cell in grid.grid.values():
		cell.select_cell.connect(select_new_cell)

func select_new_cell(cell: Hex_Cell):
	if current_cell == null:
		current_cell = cell
		current_cell.pop_up()
		return
	current_cell.pop_down()
	current_cell = cell
	current_cell.pop_up()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and current_cell:
		current_cell.rotate_ray()
