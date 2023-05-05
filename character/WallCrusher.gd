extends Area2D


@onready var space_state = get_world_2d().direct_space_state
@onready var world = get_tree().get_first_node_in_group("world")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("dig"):
		var phys_params = PhysicsShapeQueryParameters2D.new()
		phys_params.shape = $CollisionShape2D.shape
		phys_params.transform = $CollisionShape2D.global_transform
		phys_params.collision_mask = 4

		var collide_points = space_state.collide_shape(phys_params, 128)

		var used_cells = {}
		for it in collide_points:
			var cell_coords = world.local_to_map(it)
			if cell_coords not in used_cells:
				used_cells[cell_coords] = null
				world.disrupt_tile(cell_coords, 1)
	
