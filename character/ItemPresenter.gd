extends PanelContainer
class_name ItemPresenter


var item: BaseItem = (load("res://items/base_item.tscn") as PackedScene).instantiate():
	set(value):
		item = value
		$TextureRect.texture = item.image



func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("LMB"):
		print(item.item_name)
