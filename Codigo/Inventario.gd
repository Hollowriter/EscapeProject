extends Control

var inventarioVisible = false

onready var animationPlayer = $AnimationPlayer
onready var escenaPrin = get_parent().get_parent()
onready var cajaDeTexto = get_parent().get_node("CajaDeTexto")

func BotonInventarioApretado():
	if animationPlayer.is_playing():
		return
	
	if inventarioVisible:
		animationPlayer.play_backwards("Mostrar")
	else:
		animationPlayer.play("Mostrar")
	
	inventarioVisible = !inventarioVisible

func AgregarItem(lugar, imagen, escala=1):
	var item = get_node("BotonInventario/Espacios/Espacio" + str(lugar) + "/Item")
	item.texture = imagen
	item.rect_scale = Vector2(escala,escala)

func LeerDescripcion(numero):
	pass

func SeleccionarItem(numero):
	pass

func MostrarDescripcion(numero):
	if escenaPrin.contenido[numero].size() > 1:
		cajaDeTexto.NuevoTexto(escenaPrin.contenido[numero][1])

func MousePasoPorArriba0():
	MostrarDescripcion(0)

func MousePasoPorArriba1():
	MostrarDescripcion(1)

func MousePasoPorArriba2():
	MostrarDescripcion(2)

func MousePasoPorArriba3():
	MostrarDescripcion(3)

func MousePasoPorArriba4():
	MostrarDescripcion(4)

func MousePasoPorArriba5():
	MostrarDescripcion(5)
