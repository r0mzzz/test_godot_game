extends CharacterBody2D

var speed = 150 # speed in pixels/sec
@onready var interact_ui = $CanvasLayer
@onready var inventory_ui = $Inventoryui
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	Inventory.set_player_reference(self)
	animated_sprite_2d.play("idle")
		
func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	position = position.snapped(Vector2(1,1))
	velocity = direction * speed

	move_and_slide()
	
func _input(event: InputEvent):
	if event.is_action_pressed("open_inventory"):
		inventory_ui.visible = !inventory_ui.visible
		get_tree().paused = !get_tree().paused


func _on_button_pressed() -> void:
	SaveSystem.save_game()
