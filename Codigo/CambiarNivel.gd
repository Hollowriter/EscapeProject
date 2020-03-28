extends Node

onready var sceneLoader = get_parent().get_parent().get_parent()
export var nivelCarga = 0

func Apretado():
	if nivelCarga == 1: cargar_nivel1()
	if nivelCarga == 2: cargar_nivel2()
	if nivelCarga == 3: cargar_nivel3()
	if nivelCarga == 4: cargar_nivel4()
	if nivelCarga == 5: cargar_nivel5()
	
	if nivelCarga >= 1:
		sceneLoader.nivel = nivelCarga

func cargar_nivel1():
	sceneLoader.load_scene("Cocina")
	sceneLoader.load_scene("Living")
	yield( sceneLoader.get_tree().create_timer(0.5), "timeout")
	sceneLoader.change_scene_to("Living")

func cargar_nivel2():
	sceneLoader.CondicionesDeCadaNivel("salir casa")
	sceneLoader.get_node("Canvas/MedidorRiesgo").visible = true
	
	sceneLoader.load_scene("Callejon")
	yield( sceneLoader.get_tree().create_timer(0.5), "timeout")
	sceneLoader.change_scene_to("Callejon")

func cargar_nivel3():
	sceneLoader.load_scene("Farmacia")
	yield( sceneLoader.get_tree().create_timer(0.5), "timeout")
	sceneLoader.change_scene_to("Farmacia")
	
func cargar_nivel4():
	sceneLoader.CondicionesDeCadaNivel("salir farmacia")
	
	sceneLoader.load_scene("CalleYParque")
	yield( sceneLoader.get_tree().create_timer(0.5), "timeout")
	sceneLoader.change_scene_to("CalleYParque")

func cargar_nivel5():
	sceneLoader.load_scene("Cocina2")
	sceneLoader.load_scene("Living2")
	sceneLoader.load_scene("Habitacion")
	sceneLoader.load_scene("Bano")
	yield( sceneLoader.get_tree().create_timer(0.5), "timeout")
	sceneLoader.change_scene_to("Living2")
