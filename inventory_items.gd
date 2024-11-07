@tool
extends Node2D

@export var item_type = ""
@export var item_name = ""
@export var item_effect = ""
@export var item_texture: CompressedTexture2D

@onready var icon_sprite: Sprite2D = $Sprite2D
var player_in_range = false
var scene_path: String = "res://inventory_items.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not Engine.is_editor_hint():
		icon_sprite.texture = item_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if Engine.is_editor_hint():
		icon_sprite.texture = item_texture
		
	if player_in_range and Input.is_action_pressed("pickup_item"):
		pickup_item()

func pickup_item():
	var item = {
		"quantity": 1,
		"type" :item_type,
		"name" : item_name,
		"texture" : item_texture,
		"effect" : item_effect,
		"scene_path" : scene_path
 	}
	if Inventory.player_node:
		Inventory.add_item(item)
		self.queue_free()
		


func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("player"):
		player_in_range = true
		body.interact_ui.visible = true


func _on_area_2d_body_exited(body: Node2D):
	if body.is_in_group("player"):
		player_in_range = false
		body.interact_ui.visible = false

func set_item_data(data):
	item_type = data.type
	item_name = data.name
	item_effect = data.effect
	item_texture = data.texture
