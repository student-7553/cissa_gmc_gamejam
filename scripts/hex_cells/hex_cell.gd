extends Node3D
class_name Hex_Cell

@export var mesh: Node3D
@export var cell_type: Card.PossibleCell
@export var alternate_meshes: Array[PackedScene]

@onready var score_indicator: Score_Indicator = $score_indicator
@onready var invalid_indicator: Invalid_Indicator = $invalid_indicator
@onready var check_node: BaseCheck = $check
@onready var synergy: Synergy = $synergy

var current_score = 0
var base_score = 0
var save_pos: Vector3
var cube_coord: Vector3 ## Position in the hex grid (q, r, s)

var isHovered: bool = false

signal select_cell(cell: Hex_Cell)

signal cell_score_change(scoreUpdate: int)

func _ready() -> void:
	randomize_mesh()

	save_pos = position
	synergy.increase_score.connect(increase_score)
	synergy.type = cell_type
	squash()

func random_angle():
	return randi_range(0, 6) * 60

func randomize_mesh():
	## See if there are any meshes
	if alternate_meshes.size() != 0:
		## Flip a coin, if heads use a random mesh and hide the current one
		var face: int = randi_range(0,1)
		## instantiate mesh and add child
		if face == 1:
			mesh.hide()
			var idx: int = randi_range(0, alternate_meshes.size() - 1)
			var new_mesh: Node3D = alternate_meshes[idx].instantiate()
			add_child(new_mesh)
			new_mesh.rotation_degrees.y += random_angle() + 30
			mesh = new_mesh
	mesh.rotation_degrees.y += random_angle() ## Random rotation for the cell placement

func increase_score(amount: int):
	cell_score_change.emit(amount)
	Globals.sound_manager.sfx_CollectPoints.play()
	current_score += amount
	if score_indicator:
		score_indicator.indicate(amount)
	squash()

## Called when a cell is being replaced
func copy_cell_data(cell: Hex_Cell):
	cube_coord = cell.cube_coord
	save_pos = cell.save_pos

	cell_score_change.emit(- current_score)
	current_score = cell.current_score
	cell_score_change.emit(current_score)

	base_score = cell.base_score
	position = cell.position

func pop_up():
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y + 0.51, 0.25).set_trans(Tween.TRANS_BOUNCE)

func pop_down():
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y, 0.25).set_trans(Tween.TRANS_BOUNCE)

func squash():
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(mesh, "scale", Vector3.ONE * .5, 0.1).set_trans(Tween.TRANS_CIRC)
	tw.tween_property(mesh, "scale", Vector3.ONE, 0.1).set_trans(Tween.TRANS_CIRC)

func mouse_entered() -> void:
	select_cell.emit(self)

func mouse_exited() -> void:
	select_cell.emit(null)
