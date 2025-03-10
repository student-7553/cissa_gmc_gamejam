## Manages the Logic for player input, etc

extends Node
class_name Grid_Manager

const HEX_DIRECTIONS: Array[Vector3] = [Vector3(1, 0, -1), Vector3(1, -1, 0), Vector3(0, -1, 1), Vector3(-1, 0, 1), Vector3(-1, 1, 0), Vector3(0, 1, -1)]

@export var grid: Hex_Grid

var current_cell: Hex_Cell
var lifeEnergyManager: LifeEnergyManager

func _ready() -> void:
	lifeEnergyManager = get_node("../LifeEnergyManager")
	assert(lifeEnergyManager != null, "LifeEnergyManager could not be found")

	for cell in grid.grid.values():
		cell.select_cell.connect(select_new_cell)
		cell.cell_score_change.connect(lifeEnergyManager.relativeUpdateLifeEnergy)

func _input(event):
	if event.is_action_pressed("click") && current_cell != null:
		## Get the top card
		var new_card: Card = Globals.card_manager.current_card#.duplicate()
		if new_card == null:
			print("No new card available")
			return
		## Check if it is valid to place
		if not current_cell.check_node.valid_placement(new_card.cellKey):
			print("Cannot place ", new_card)
			current_cell.invalid_indicator.indicate()
			return
		Globals.card_manager.draw_card()
		## Replace the current_cell
		# get the hex cell data - position
		var save_coord: Vector3 = current_cell.cube_coord
		var save_type: Card.PossibleCell = current_cell.cell_type
		
		replace_cell(new_card)
		
		## Handle Synergy
		if current_cell.synergy:
			current_cell.synergy.replace_self.connect(replace_cell)
			current_cell.synergy.attempt_synergy_self(save_type)
			current_cell.synergy.scan_neighbours(current_cell.synergy.get_neighbours(save_coord, grid))
		current_cell.select_cell.connect(select_new_cell)

func replace_cell(card: Card):
	Globals.sound_manager.sfx_place_node()
	var new_cell: Hex_Cell = card.scene.instantiate()
	grid.add_child(new_cell)
	new_cell.copy_cell_data(current_cell)
	current_cell.queue_free()
	grid.grid[current_cell.cube_coord] = new_cell
	current_cell = new_cell
	current_cell.cell_score_change.connect(lifeEnergyManager.relativeUpdateLifeEnergy)

func select_new_cell(cell: Hex_Cell):
	if cell == null:
		current_cell.pop_down()
		current_cell = null
		return
	
	Globals.sound_manager.sfx_Hover.play()
	if current_cell == null:
		current_cell = cell
		current_cell.pop_up()
		return
	current_cell.pop_down()
	current_cell = cell
	current_cell.pop_up()
