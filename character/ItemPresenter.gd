extends PanelContainer
class_name ItemPresenter

signal drop_item(item: BaseItem)
signal destroy_item(item: BaseItem)


var item: BaseItem:
	set(value):
		item = value
		$TextureRect.texture = item.image


func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("LMB") and item.is_activatable:
		item.activate()
		destroy_item.emit(item)
	if event.is_action_pressed("RMB"):
		drop_item.emit(item)
	
