extends BaseItem


@onready var space_state = get_world_2d().direct_space_state


func activate(event: InputEvent):
	var point_params := PhysicsPointQueryParameters2D.new()
	point_params.position = event.position
	point_params.collision_mask = 8
	var collisions = space_state.intersect_point(point_params)
	if collisions.is_empty(): return
	
	var collision = collisions.front().collider as InteractableObject
	if collision != null and collision.is_in_group("axeble"):
		collision.queue_free()
