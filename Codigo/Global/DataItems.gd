extends Node

var url_baseDeDatos_items = "res://BaseDeDatos/data_items.json"

func _ready():
	var itemo = get_item(1)
	if itemo == null: return
	print("ID " + String(itemo['id']))
	print("Nombre " + itemo['nombre'])
	print("Tipo " + itemo['tipo'])
	print("Descripcion " + itemo['descripcion'])

func get_item(id):
	var item_data = {}
	item_data = DataParser.cargar_datos(url_baseDeDatos_items)
	if !item_data.has(String(id)):
		return
	item_data[String(id)]["id"] = int(id);
	return item_data[String(id)]
