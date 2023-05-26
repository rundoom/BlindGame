extends Area2D
class_name BaseItem

@export var item_name: StringName
@export var image: AtlasTexture
@onready var player := get_tree().get_first_node_in_group("player") as Player
@export var is_activatable = false
@export var is_single_use = true

signal destroy_item(item: BaseItem)


func _ready() -> void:
	$Name.text = item_name


func show_name():
	$Name.show()
	
	
func hide_name():
	$Name.hide()


func activate():
	pass
