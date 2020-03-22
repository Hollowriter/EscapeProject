extends Node

onready var nivel:int = 0
onready var musica = $MusicaMenu

func _ready():
	audio_reproducir()

func audio_reproducir():
	if nivel == 0:
		musica = $MusicaMenu
	if nivel == 1:
		musica = $MusicaCasa
	musica.play()

func audio_parar():
	musica.stop()

func cambiar_nivel(nv):
	nivel = nv
