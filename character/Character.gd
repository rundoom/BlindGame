extends CharacterBody2D
class_name Player


@export var SPEED = 200
@onready var item_picker = $ItemPicker as ItemPicker
@onready var world := get_tree().get_first_node_in_group("world") as TileLevel
var stored_items: Array[BaseItem] = []
@onready var player_ui := $PlayerUI as PlayerUI
@onready var space_state = get_world_2d().direct_space_state
var energy := 100:
	set(value):
		energy = value
		player_ui.energy = value
var last_rotation = 0


func _ready() -> void:
	energy = energy


func _physics_process(delta: float) -> void:
	var hrz_dir := Input.get_axis("ui_left", "ui_right")
	var vrt_dir := Input.get_axis("ui_up", "ui_down")
	
	velocity = Vector2(hrz_dir, vrt_dir).normalized() * SPEED
	if velocity != Vector2.ZERO: rotation = velocity.angle()
	
	last_rotation = rotation
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and !item_picker.items_in_area.is_empty():
		var item = item_picker.items_in_area[-1]
		item.get_parent().remove_child(item)
		stored_items.append(item)
		player_ui.add_item(item)
		
	if event.is_action_pressed("ui_cancel") and !stored_items.is_empty():
		var item = stored_items[0]
		drop_item(item)
		
	if event.is_action_pressed("LMB") and energy >= 5:
		var phys_params = PhysicsShapeQueryParameters2D.new()
		phys_params.shape = $ItemPicker/CollisionShape2D.shape
		phys_params.transform = $ItemPicker/CollisionShape2D.global_transform
		phys_params.collision_mask = 4

		var collide_points = space_state.collide_shape(phys_params, 128)

		var used_cells = {}
		for it in collide_points:
			var cell_coords = world.local_to_map(it)
			if cell_coords not in used_cells:
				used_cells[cell_coords] = null
				if world.local_to_map(event.position) == cell_coords:
					world.disrupt_tile(cell_coords, 1)
					energy -= 5
					break
		
		
func drop_item(item: BaseItem):
	item.global_position = global_position
	world.add_child(item)
	stored_items.erase(item)
