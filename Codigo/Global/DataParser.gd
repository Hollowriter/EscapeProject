extends Node

onready var file = File.new()

func cargar_datos(url):
	if url == null: return
	if !file.file_exists(url): return
	file.open(url, file.READ)
	var data = {}
	data = parse_json(file.get_as_text())
	file.close()
	return data
	
func escribir_datos(url, dict):
	if url == null: return
	file.open(url, file.WRITE)
	file.store_line(dict.to_json())
	file.close()
	return
