extends Control

var inventarioVisible = false

onready var animationPlayer = $AnimationPlayer
onready var sonido = $AbrirSonido
onready var escenaPrin = get_parent().get_parent()
onready var cajaDeTexto = get_parent().get_node("CajaDeTexto")

func BotonInventarioApretado(valor = null):
	if animationPlayer.is_playing():
		return
	if valor == null:
		if inventarioVisible:
			sonido = $CerrarSonido
			sonido.play()
			animationPlayer.play_backwards("Mostrar")
		else:
			sonido = $AbrirSonido
			sonido.play()
			animationPlayer.play("Mostrar")
		
		inventarioVisible = !inventarioVisible
	else:
		if valor == inventarioVisible:
			return
		if valor:
			sonido = $AbrirSonido
			sonido.play()
			animationPlayer.play("Mostrar")
		else:
			sonido = $CerrarSonido
			sonido.play()
			animationPlayer.play_backwards("Mostrar")
		
		inventarioVisible = valor

func AgregarItem(lugar, imagen, escala=1):
	var item = get_node("BotonInventario/Espacio" + str(lugar) + "/Item")
	item.texture = imagen
	item.rect_scale = Vector2(escala,escala)

func SeleccionarItem(numero):
	if escenaPrin.contenido[numero].size() > 1:
		cajaDeTexto.NuevoTexto(escenaPrin.contenido[numero][1])
	for i in range(6):
		var espacio = get_node("BotonInventario/Espacio" + str(i))
		if i == numero:
			if escenaPrin.espacios[numero] != "":
				espacio.self_modulate = Color("#555555")
				escenaPrin.itemSeleccionado = escenaPrin.espacios[numero]
			else:
				espacio.self_modulate = Color("#000000")
				escenaPrin.itemSeleccionado = null
		else:
			espacio.self_modulate = Color("#000000")
