extends Node

var url_JugadorData = "user://JugadorData.bin"
var inventario = {}
var maxSlots = 6
onready var jugadorData = DataParser.cargar_datos(url_JugadorData)

func _ready():
	cargar_datos()

func cargar_datos():
	if jugadorData == null:
		var dict = {"inventario":{}}
		for slot in range (0, maxSlots):
			dict["inventario"][String(slot)] = {"id": "0", "nombre": "cosita"}
		DataParser.escribir_datos(url_JugadorData, dict)
		inventario = dict["inventario"]
		print("Llegue a parsear")
	else:
		inventario = jugadorData["inventario"]
