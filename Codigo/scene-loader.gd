extends Node

var espacios = ["","","","","",""]
var contenido = [[],[],[],[],[],[]]
var itemSeleccionado
var scenes_loaded={}
var last_scene

onready var inventario

func _ready():
	load_scene("Cocina")
	load_scene("Living")
	#load_scene("Calle")
	yield( get_tree().create_timer(0.5), "timeout")
	change_scene_to("Living")

func load_scene(scene_name):
	var SCN=load("res://Escenas/Lugares/"+scene_name+".tscn")
	scenes_loaded[scene_name]=SCN.instance()
	
func drop_scene(scene_name): # Para poder borrar escenas
	scenes_loaded[scene_name].queue_free()

func change_scene_to(scene_name):
	if last_scene: remove_child(last_scene)
	add_child(scenes_loaded[scene_name])
	if scenes_loaded[scene_name].has_method("on_enter_scene"): scenes_loaded[scene_name].on_enter_scene()
	last_scene=scenes_loaded[scene_name]
	
	itemSeleccionado = null
	inventario = last_scene.get_node("Inventario")
	inventario.BotonInventarioApretado(false)
	for i in range(espacios.size()):
		if espacios[i] != "":
			inventario.AgregarItem(i, contenido[i][0])

func AgarrarItemClickeado(item):
	if item.CheckAgarrado() == false:
		for i in range(espacios.size()):
			if espacios[i] == "":
				espacios[i] = item.name
				item.hide()
				contenido[i] = [item.texture_normal, item.texto]
				inventario.AgregarItem(i, item.texture_normal)
				return

func SoltarItem(nombre):
	for i in range(espacios.size()):
		if espacios[i] == nombre:
			espacios[i] = ""
			contenido[i] = []
			inventario.AgregarItem(i, null)
			print(i)
