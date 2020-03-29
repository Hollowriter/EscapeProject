extends Node

onready var nivel:int = 1 # para testear, en el juego final se inicializa en 0
onready var musicaIntro = $MusicaCasaIntro
onready var musica = $MusicaCasa
onready var secondsIntro = 0

onready var cancionesIntro = [$MusicaCasaIntro,$MusicaCalleIntro,
					null,null,$MusicaCasaIntro]
onready var canciones = [$MusicaCasa,$MusicaCalle,
				$MusicaFarmacia,$MusicaCalleYParque,
				$MusicaCasa]

func _ready():
	audio_reproducir()

func audio_reproducir():
	musicaIntro.stop()
	musica.stop()
	if cancionesIntro[nivel-1] != null:
		PlayIntro()
	else:
		PlayLoop()

func audio_parar():
	musica.stop()
	musicaIntro.stop()

func cambiar_nivel(nv):
	nivel = nv
	audio_reproducir()

func PlayIntro():
	musica.stop()
	musicaIntro = cancionesIntro[nivel-1]
	musicaIntro.play()
	
func PlayLoop():
	musica.stop()
	musicaIntro.stop()
	musica = canciones[nivel-1]
	musica.play()
