extends Node3D
class_name Hex_Grid

@export var map_size = 20
@export var tile_size = 2
@export var player_manager: Player_Manager
@export var tile_scene: PackedScene

var grid: Array[Array] = []

func _ready() -> void:
	generate_map()


## --- LOGIC FOR HEX GRID GENERATION ---

func generate_map():
	for child in get_children():
		remove_child(child)
	for x in range(-map_size, map_size):
		for y in range(-map_size, map_size):
			if in_map(x,y):
				add_tile(x, y)

func add_tile(x, y):
	var new_tile: Hex_Cell = tile_scene.instantiate()
	var offset: float = 0.0 if !(x % 2) else tile_size / 2.0
	
	add_child(new_tile)
	new_tile.select_cell.connect(player_manager.select_new_cell)
	
	new_tile.translate(Vector3(x * tile_size, 0, y * tile_size + offset))

func in_map(x,y):
	var r = ceil(map_size / 2)
	var cube = oddq_to_cube(Vector2(x, y))
	if cube.x <= r and cube.x >= -r and cube.y <= r and cube.y >= -r and cube.z <= r and cube.z >= -r:
		return true
	return false

func oddq_to_cube(hex):
	var q = hex.x
	var r = hex.y - (hex.x - (int(q)&1))/2
	return Vector3(q, r, -q-r)
