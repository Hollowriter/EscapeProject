extends Node

var url_baseDeDatos_items = "res://BaseDeDatos/data_items.json"

func get_item(id) -> Dictionary:
	var item_data = {}
	item_data = DataParser.cargar_datos(url_baseDeDatos_items)
	if !item_data.has((id)):
		return {}
	item_data[(id)]["id"] = int(id);
	return item_data[(id)]
