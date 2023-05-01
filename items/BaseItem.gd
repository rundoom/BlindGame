extends Area2D
class_name BaseItem

@export var item_name: StringName


func _ready() -> void:
	$Name.text = item_name


func show_name():
	$Name.show()
	
	
func hide_name():
	$Name.hide()
