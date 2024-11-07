extends Control

@onready var icon = $NinePatchRect/Sprite2D
@onready var quantity_label = $NinePatchRect/Label

var item = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func set_empty():
	icon.texture = null
	quantity_label.text = ""

func set_item(new_item):
	item = new_item
	icon.texture = item["texture"]
	icon.region_enabled = true

	var new_region_size = Vector2(16, 16)  # Change to your desired width and height
	icon.region_rect = Rect2(Vector2(0, 0), new_region_size)

	quantity_label.text = str(item["quantity"])

func _on_drop_pressed():
	if item != null:
		var drop_position = Inventory.player_node.global_position
		var drop_offset = Vector2(0, 50)
		drop_offset = drop_offset.rotated(Inventory.player_node.rotation)
		Inventory.drop_item(item, drop_position + drop_offset)
		Inventory.remove_item(item["type"], item["name"])



func _on_button_pressed() -> void:
	_on_drop_pressed()
