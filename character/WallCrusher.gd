extends Area2D


@onready var space_state = get_world_2d().direct_space_state


func _on_body_entered(body: TileMap) -> void:
	var phys_params = PhysicsShapeQueryParameters2D.new()
	phys_params.shape = $CollisionShape2D.shape
	phys_params.transform = $CollisionShape2D.global_transform
	phys_params.collision_mask = 4
	
	var collide_points = space_state.collide_shape(phys_params, 128)
	
	for it in collide_points: body.erase_cell(0, body.local_to_map(it))
	
