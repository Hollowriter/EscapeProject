extends CanvasLayer

export var textoAlEntrar = ""

onready var cajaDeTexto = $CajaDeTexto

func on_enter_scene():
	cajaDeTexto.NuevoTexto(textoAlEntrar)
