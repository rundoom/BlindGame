extends Area2D
class_name ItemPicker


var items_in_area: Array[BaseItem] = []
var object_in_area: Array[InteractableObject] = []


func _on_area_entered(area: BaseItem) -> void:
	items_in_area.append(area)
	area.show_name()


func _on_area_exited(area: BaseItem) -> void:
	items_in_area.erase(area)
	area.hide_name()


func _on_body_entered(body: Node2D) -> void:
	object_in_area.append(body)


func _on_body_exited(body: Node2D) -> void:
	object_in_area.erase(body)
