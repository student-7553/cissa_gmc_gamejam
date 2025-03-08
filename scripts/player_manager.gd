## Manages the Logic for player input, etc

extends Node
class_name Player_Manager

var current_cell: Hex_Cell

func select_new_cell(cell: Hex_Cell):
	if current_cell == null:
		current_cell = cell
		return
	current_cell.pop_down()
	current_cell = cell
	current_cell.pop_up()
