extends Area2D
class_name ItemPicker


var items_in_area: Array[BaseItem] = []


func _on_area_entered(area: Area2D) -> void:
	items_in_area.append(area)
	area.show_name()


func _on_area_exited(area: Area2D) -> void:
	items_in_area.erase(area)
	area.hide_name()
