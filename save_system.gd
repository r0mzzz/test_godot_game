extends Node


func save_game():
	var file = FileAccess.open("res://savegame.json", FileAccess.WRITE)
	var inventory = Inventory.inventory
	file.store_string(JSON.stringify(inventory))
	file.close()
	
func load_game():
	var file = FileAccess.open("res://savegame.json", FileAccess.READ)
	var data = file.get_file_as_string("res://savegame.json")
	return JSON.parse_string(data)
	
