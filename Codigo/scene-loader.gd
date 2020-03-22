extends Node

<<<<<<< HEAD
<<<<<<< Updated upstream
=======
var espacios = ["","","","","",""]
var contenido = [[],[],[],[],[],[]]
>>>>>>> Stashed changes
=======
var espacios = ["","","","","",""]
var contenido = ["","","","","",""]
>>>>>>> ea52534d3403182179a2b044467c3c65165080fb
var scenes_loaded={}
var last_scene

onready var inventario

func _ready():
	load_scene("Cocina")
	load_scene("Dormitorio")
	#load_scene("Calle")
	yield( get_tree().create_timer(0.5), "timeout")
	change_scene_to("Dormitorio")

func load_scene(scene_name):
	var SCN=load("res://Escenas/Lugares/"+scene_name+".tscn")
	scenes_loaded[scene_name]=SCN.instance()

func change_scene_to(scene_name):
	if last_scene: remove_child(last_scene)
	add_child(scenes_loaded[scene_name])
	if scenes_loaded[scene_name].has_method("on_enter_scene"): scenes_loaded[scene_name].on_enter_scene()
	last_scene=scenes_loaded[scene_name]
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
	
=======
>>>>>>> ea52534d3403182179a2b044467c3c65165080fb
	inventario = last_scene.get_node("Inventario")
	for i in range(espacios.size()):
		if espacios[i] != "":
			inventario.AgregarItem(i, contenido[i][0])

func AgarrarItemClickeado(item):
	for i in range(espacios.size()):
		if espacios[i] == "":
			espacios[i] = item.name
			item.queue_free()
<<<<<<< HEAD
			contenido[i] = [item.texture_normal, item.texto]
			inventario.AgregarItem(i, item.texture_normal)
			return
>>>>>>> Stashed changes
=======
			contenido[i] = [item.texture_normal]
			inventario.AgregarItem(i, item.texture_normal)
			return
>>>>>>> ea52534d3403182179a2b044467c3c65165080fb
