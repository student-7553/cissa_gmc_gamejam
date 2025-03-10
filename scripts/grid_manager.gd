## Manages the Logic for player input, etc

extends Node
class_name Grid_Manager

const HEX_DIRECTIONS: Array[Vector3] = [Vector3(1,0,-1), Vector3(1,-1,0), Vector3(0,-1,1), Vector3(-1,0,1), Vector3(-1,1,0), Vector3(0,1,-1)]

@export var grid: Hex_Grid

var current_cell: Hex_Cell
var cardManager: CardManager

func _ready() -> void:
	for cell in grid.grid.values():
		cell.select_cell.connect(select_new_cell)
	cardManager = get_node("../CardManager")
	assert(cardManager != null, "CardManager could not be found")

func _input(event):
	if event.is_action_pressed("click") && current_cell != null:
		## Get the top card
		var new_card: Card = cardManager.getTopCard()
		## Check if it is valid to place
		if not current_cell.check_node.valid_placement(new_card.cellKey):
			print("Cannot place ", new_card)
			return
		## Replace the current_cell
		# get the hex cell data - position
		var save_coord: Vector3 = current_cell.cube_coord
		var save_type: Card.PossibleCell = current_cell.cell_type
		
		replace_cell(new_card)
		
		## Handle Synergy
		if current_cell.synergy:
			current_cell.synergy.replace_self.connect(replace_cell)
			current_cell.synergy.attempt_synergy_self(save_type)
			current_cell.synergy.scan_neighbours(get_neighbours(save_coord))
		current_cell.select_cell.connect(select_new_cell)

func replace_cell(card: Card):
	var new_cell: Hex_Cell = card.scene.instantiate()
	grid.add_child(new_cell)
	new_cell.copy_cell_data(current_cell)
	current_cell.queue_free()
	current_cell = new_cell

func select_new_cell(cell: Hex_Cell):
	Globals.sound_manager.sfx_Hover.play()
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
		var adj_pos: Vector3 = hex_dir + pos
		if adj_pos in grid.grid.keys():
			hex_array.append(grid.grid[hex_dir + pos])
	return hex_array
