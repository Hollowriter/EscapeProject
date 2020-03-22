extends Control

var inventarioVisible = false

onready var animationPlayer = $AnimationPlayer

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
