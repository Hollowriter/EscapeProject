extends CanvasLayer

export var textoAlEntrar = ""

onready var cajaDeTexto = get_parent().get_parent()

func on_enter_scene():
	print(cajaDeTexto.name)
	get_node("CajaDeTexto").NuevoTexto(textoAlEntrar)
