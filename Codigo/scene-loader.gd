extends Node

export(Texture) var spriteBolsaConPiedras
export(String) var textoBolsaConPiedras

var espacios = ["","","","","",""]
var contenido = [[],[],[],[],[],[]]
var itemSeleccionado
var scenes_loaded={}
var last_scene
var nivel = 1
var riesgoDeInfeccion = 0
var limiteInfeccion = 10

onready var inventario
onready var cajaDeTexto
onready var medidorRiesgo = $MedidorRiesgo

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
	cajaDeTexto = last_scene.get_node("CajaDeTexto")
	inventario = last_scene.get_node("Inventario")
	inventario.BotonInventarioApretado(false)
	for i in range(espacios.size()):
		if espacios[i] != "":
			inventario.AgregarItem(i, contenido[i][0])

func AgarrarItemClickeado(item):
	for i in range(espacios.size()):
		if espacios[i] == "":
			espacios[i] = item.name
			item.queue_free()
			contenido[i] = [item.texture_normal, item.texto]
			inventario.AgregarItem(i, item.texture_normal)
			break

func SoltarItem(item):
	inventario.DesseleccionarItem()
	for i in range(espacios.size()):
		if espacios[i] == item:
			espacios[i] = ""
			contenido[i] = []
			inventario.AgregarItem(i, null)

func CondicionesDeCadaNivel(accion = "seleccionar", item1 = "", item2 = ""):
	match (nivel):
		1:
			if accion == "salir casa":
				var itemsQueNecesitas = ["Billetera", "Documento", "Bolsa", "Alcohol en gel"]
				for itemNecesario in itemsQueNecesitas:
					if not espacios.has(itemNecesario):
						Perdiste()
		2:
			if accion == "seleccionado en inventario":
				if ["Piedras", "Bolsa"] == [item1, item2]:
					for numEspacio in range(6):
						if espacios[numEspacio] != "Piedras":
							pass
						SoltarItem("Piedras")
						for _numEspacio in range(6):
							if espacios[_numEspacio] == "Bolsa":
								espacios[_numEspacio] = "BolsaConPiedras"
								contenido[_numEspacio] = [spriteBolsaConPiedras, textoBolsaConPiedras]
								cajaDeTexto.NuevoTexto("Bolsa con piedritas conseguida.")
						
		3:
			if accion == "salir farmacia":
				var itemNecesario = "Recibo"
				if not espacios.has(itemNecesario):
					Perdiste()
		4:
			pass
		5:
			pass

func AumentarRiesgo():
	if nivel == 1 or nivel == 5:
		return
	
	riesgoDeInfeccion += 1
	
	medidorRiesgo.text = "Riesgo de infeccion: " + str(riesgoDeInfeccion)
	
	if riesgoDeInfeccion >= limiteInfeccion:
		Perdiste()
	
func Perdiste():
	get_tree().change_scene("res://Escenas/PantallaGameOver.tscn")
