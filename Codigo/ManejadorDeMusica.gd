extends Node

onready var nivel:int = 1 # para testear, en el juego final se inicializa en 0
onready var musicaIntro = $MusicaCasaIntro
onready var musica = $MusicaCasa
onready var secondsIntro = 0

func _ready():
	audio_reproducir()

func audio_reproducir():
	musicaIntro.stop()
	musica.stop()
	if nivel == 1:
		musica_nivel1()
	if nivel == 2:
		musica_nivel2()
	if nivel == 3:
		musica_nivel3()
	if nivel == 4:
		musica_nivel4()
	if nivel == 5:
		musica_nivel1()
	musica.play()

func audio_parar():
	musica.stop()

func cambiar_nivel(nv):
	nivel = nv

func musica_nivel1():
	musica = $MusicaCasa

func musica_nivel2():
	musica = $MusicaCalle

func musica_nivel3():
	musica = $MusicaFarmacia

func musica_nivel4():
	musica = $MusicaCalleYParque
