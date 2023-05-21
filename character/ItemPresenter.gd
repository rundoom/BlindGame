extends PanelContainer
class_name ItemPresenter


var item: BaseItem:
	set(value):
		item = value
		$TextureRect.texture = item.image

