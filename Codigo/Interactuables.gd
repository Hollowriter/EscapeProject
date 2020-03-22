extends Control

onready var cajaDeTexto = get_parent().get_node("CajaDeTexto")

var ultimoItemClickeado

func _ready():
	for child in get_children():
		print(child.name)
		child.connect("seleccionado",self,"ActualizarItemClickeado",[child])

func ActualizarItemClickeado(nuevoItem):
	if ultimoItemClickeado != null:
		ultimoItemClickeado.Deseleccionar()
	ultimoItemClickeado = nuevoItem
	cajaDeTexto.NuevoTexto(ultimoItemClickeado.texto)
	
