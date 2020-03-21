extends Node2D

func _ready():
	pass # Replace with function body.

func on_enter_scene():
	get_node("/root/Node2D/CajaDeTexto").NuevoTexto("Ahora estoy en el dormitorio!")
