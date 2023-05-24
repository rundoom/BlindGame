extends TileMap
class_name TileLevel


#var disrupted_tiles: Dictionary = {}
var ItemSc = preload("res://items/base_item.tscn")


func disrupt_tile(tile_pos: Vector2i) -> void:
	if get_cell_atlas_coords(0, tile_pos) == Vector2i(-1, -1): return
#	var tile_hp = disrupted_tiles.get(tile_pos)
	
#	if tile_hp == null:
#		var cell_data := get_cell_tile_data(0, tile_pos)
#		var hp = cell_data.get_custom_data("hp")
#		disrupted_tiles[tile_pos] = cell_data.get_custom_data("hp")
	var tile_data = get_cell_tile_data(0, tile_pos)
#	disrupted_tiles[tile_pos] -= dmg
#	if disrupted_tiles[tile_pos] <= 0:
	var loot = ItemSc.instantiate()
	loot.item_name = tile_data.get_custom_data("item_name")
	loot.global_position = map_to_local(tile_pos)
	loot.image = tile_data.get_custom_data("icon")
	add_child(loot)
	erase_cell(0, tile_pos)
#	disrupted_tiles.erase(tile_pos)


func get_tile_hp(tile_pos: Vector2i) -> int:
	if get_cell_atlas_coords(0, tile_pos) == Vector2i(-1, -1): return -1
	return get_cell_tile_data(0, tile_pos).get_custom_data("hp")
