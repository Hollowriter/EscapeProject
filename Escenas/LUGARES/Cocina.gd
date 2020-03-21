extends Node2D

onready var con1=$Button.connect("button_down",self,"on_button_1")

func _ready():
	pass

func on_enter_scene():
	yield( get_tree().create_timer(0.5), "timeout")
	get_node("/root/Node2D/CajaDeTexto").NuevoTexto("Texto eviado desde la Cocina!!")

func on_button_1():
	get_node("/root/Node2D/CajaDeTexto").NuevoTexto("Texto desde el boton de Cocina!!")