extends Node

onready var file = File.new()

func cargar_datos(url) -> Dictionary:
	if url == null: return {}
	if !file.file_exists(url): return {}
	file.open(url, file.READ)
	var data = {}
	data = parse_json(file.get_as_text())
	file.close()
	return data
	
func escribir_datos(url:String, dict:Dictionary):
	if url == null: return
	file.open(url, file.WRITE)
	file.store_line(to_json(dict))
	file.close()
	return
