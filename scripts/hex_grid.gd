extends Node3D
class_name Hex_Grid

@export var map_size = 8
@export var tile_size = 2
@export var tile_scene: PackedScene

var RAY_LENGTH = 50

var grid: Dictionary[Vector3, Hex_Cell] = {} ## dictionary with key value pair of - (q, r, s) : HEX_CELL

func _ready() -> void:
	generate_map()

## --- LOGIC FOR HEX GRID GENERATION ---

func generate_map():
	for child in get_children():
		remove_child(child)
	for x in range(- map_size, map_size):
		for y in range(- map_size, map_size):
			if in_map(x, y):
				add_tile(x, y)
	print(grid)

func add_tile(x, y):
	var new_tile: Hex_Cell = tile_scene.instantiate()
	var offset: float = 0.0 if !(x % 2) else tile_size / 2.0
	
	add_child(new_tile)
	new_tile.cube_coord = oddq_to_cube(Vector2(x, y))
	grid[new_tile.cube_coord] = new_tile
	
	new_tile.translate(Vector3(x * tile_size, 0, y * tile_size + offset))

func in_map(x, y):
	var r = ceil(map_size / 2)
	var cube = oddq_to_cube(Vector2(x, y))
	if cube.x <= r and cube.x >= -r and cube.y <= r and cube.y >= -r and cube.z <= r and cube.z >= -r:
		return true
	return false

func oddq_to_cube(hex: Vector2) -> Vector3:
	var q = hex.x
	var r = hex.y - (hex.x - (int(q) & 1)) / 2
	return Vector3(q, r, -q - r)

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()

func _input(event):
	if event.is_action_pressed("click"):
		handleClick()


func handleClick():
	var space_state = get_world_3d().direct_space_state
	var cam = get_node("../CameraGimbal/CameraGimbalY/CameraGimbalX/Camera3D")


	var mousepos = get_viewport().get_mouse_position()

	# Todo add layer and mask so that the ray only hits the hex cell
	var origin = cam.project_ray_origin(mousepos)
	var end = origin + cam.project_ray_normal(mousepos) * RAY_LENGTH
	var query = PhysicsRayQueryParameters3D.create(origin, end)
	query.collide_with_areas = true

	var result = space_state.intersect_ray(query)

	if !result.has("collider") || result.collider.get_class() != "Area3D":
		print("empty")
		return


	var area3D: Area3D = result.collider
	var parentArea: Hex_Cell = area3D.get_parent()

	if !parentArea.is_in_group("hex_cell"):
		print("not in group...")
		return

	parentArea.test()
