extends CharacterBody2D


@export var SPEED = 200
@onready var item_picker = $ItemPicker as ItemPicker
@onready var world = get_tree().get_first_node_in_group("world")
var stored_items: Array[BaseItem] = []
@onready var player_ui := $PlayerUI as PlayerUI


func _physics_process(delta: float) -> void:
	var hrz_dir := Input.get_axis("ui_left", "ui_right")
	var vrt_dir := Input.get_axis("ui_up", "ui_down")
	
	velocity = Vector2(hrz_dir, vrt_dir) * SPEED
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and !item_picker.items_in_area.is_empty():
		var item = item_picker.items_in_area[-1]
		item.get_parent().remove_child(item)
		stored_items.append(item)
		player_ui.add_item(item)
		
		
	if event.is_action_pressed("ui_cancel") and !stored_items.is_empty():
		var item = stored_items[0]
		item.global_position = global_position
		world.add_child(item)
		stored_items.erase(item)
		player_ui.remove_item(item)
