extends Node2D

func _ready():
	$Button.connect("button_down",self,"on_button_1")
	$Button2.connect("button_down",self,"on_button_2")
	pass

func on_enter_scene():
	get_node("/root/Node2D/CajaDeTexto").NuevoTexto("Texto al entrar en Cocina!!")

func on_button_1():
	get_node("/root/Node2D/CajaDeTexto").NuevoTexto("Texto desde el boton de Cocina!!")

func on_button_2():	
	get_node("/root/Node2D/Lugar").change_scene_to("Dormitorio")
