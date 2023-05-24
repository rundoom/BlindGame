extends CanvasLayer
class_name PlayerUI


var ItemPresenterSc = preload("res://character/item_presenter.tscn")
@onready var player := get_tree().get_first_node_in_group("player") as Player
var energy:
	set(value):
		$EnergyBar.value = value

var max_energy:
	set(value):
		$EnergyBar.max_value = value


func add_item(item: BaseItem):
	var item_presenter = ItemPresenterSc.instantiate() as ItemPresenter
	item_presenter.item = item
	item_presenter.drop_item.connect(remove_item)
	item_presenter.destroy_item.connect(remove_item)
	item_presenter.destroy_item.connect(player.destroy_item)
	item_presenter.drop_item.connect(player.drop_item)
	$ItemsList.add_child(item_presenter)
	
	
func remove_item(item: BaseItem):
	var removed_item = $ItemsList.get_children().filter(func(it): return it.item == item)[0]
	$ItemsList.remove_child(removed_item)
