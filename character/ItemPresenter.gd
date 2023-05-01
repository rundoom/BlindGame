extends PanelContainer
class_name ItemPresenter


var item: BaseItem:
	set(value):
		item = value
		$ItemName.text = value.item_name

