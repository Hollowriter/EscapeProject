extends Control

var espacios = ["","","","","",""]
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
