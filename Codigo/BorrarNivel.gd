extends Node

onready var sceneLoader = get_parent().get_parent().get_parent()
export var nivelBorra = 0

func _ready():
	if nivelBorra == 1: borrar_nivel1()
	if nivelBorra == 2: borrar_nivel2()
	if nivelBorra == 3: borrar_nivel3()
	if nivelBorra == 5: borrar_nivel5()
	queue_free()

func borrar_nivel1():
	sceneLoader.drop_scene("Cocina")
	sceneLoader.drop_scene("Living")

func borrar_nivel2():
	sceneLoader.drop_scene("CalleYParque")

func borrar_nivel3():
	sceneLoader.drop_scene("Farmacia")

func borrar_nivel5():
	sceneLoader.drop_scene("Cocina2")
	sceneLoader.drop_scene("Living2")
	sceneLoader.drop_scene("Habitacion")
	sceneLoader.drop_scene("Bano")
