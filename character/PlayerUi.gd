extends CanvasLayer
class_name PlayerUI


var ItemPresenterSc = preload("res://character/item_presenter.tscn")


func add_item(item: BaseItem):
	var item_presenter = ItemPresenterSc.instantiate() as ItemPresenter
	item_presenter.item = item
	$ItemsList.add_child(item_presenter)
	
	
func remove_item(item: BaseItem):
	var removed_item = $ItemsList.get_children().filter(func(it): return it.item == item)[0]
	$ItemsList.remove_child(removed_item)
