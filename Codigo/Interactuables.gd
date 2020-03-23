extends Control

onready var cajaDeTexto = get_parent().get_node("CajaDeTexto")
onready var escenaPrincipal = get_parent().get_parent()

var ultimoItemClickeado

func _ready():
	for child in get_children():
		child.connect("seleccionado",self,"ActualizarItemClickeado",[child])
		child.connect("darPista",self,"DarPistaItemClickeado",[child])
		child.connect("agarrado",escenaPrincipal,"AgarrarItemClickeado",[child])

func ActualizarItemClickeado(nuevoItem):
	if ultimoItemClickeado != null:
		ultimoItemClickeado.Deseleccionar()
	ultimoItemClickeado = nuevoItem
	cajaDeTexto.NuevoTexto(nuevoItem.texto)
	if nuevoItem.necesitaA != "":
		escenaPrincipal.SoltarItem(nuevoItem.necesitaA)

func DarPistaItemClickeado(nuevoItem):
	if ultimoItemClickeado != null:
		ultimoItemClickeado.Deseleccionar()
	ultimoItemClickeado = nuevoItem
	cajaDeTexto.NuevoTexto(nuevoItem.pista)
