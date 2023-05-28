extends StaticBody2D
class_name InteractableObject


var ItemSc = preload("res://items/base_item.tscn")
var FoodSc = preload("res://items/food.tscn")
@onready var world := get_tree().get_first_node_in_group("world") as TileLevel


func activate() -> void:
	var food := FoodSc.instantiate() as BaseItem
	food.global_position = global_position
	world.add_child(food)


func _on_tree_exiting() -> void:
	var wood := ItemSc.instantiate() as BaseItem
	wood.item_name = "wood"
	wood.image = load("res://items/wood.tres")
	wood.global_position = global_position
	world.add_child.call_deferred(wood)
