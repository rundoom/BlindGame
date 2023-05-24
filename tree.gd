extends StaticBody2D
class_name InteractableObject


var FoodSc = preload("res://items/food.tscn")
@onready var world := get_tree().get_first_node_in_group("world") as TileLevel


func activate() -> void:
	var food := FoodSc.instantiate() as BaseItem
	food.global_position = global_position
	world.add_child(food)
