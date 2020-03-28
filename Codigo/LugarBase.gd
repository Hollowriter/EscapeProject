extends CanvasLayer

onready var vecesEntradas = 0
export var textoAlEntrar = ""
export var textoSegundaVez = ""

onready var cajaDeTexto = $CajaDeTexto

func on_enter_scene():
	SumarVecesEntradas()
	if vecesEntradas <= 1:
		cajaDeTexto.NuevoTexto(textoAlEntrar)
	else:
		cajaDeTexto.NuevoTexto(textoSegundaVez)

func SumarVecesEntradas():
	vecesEntradas += 1
