extends TextureButton

signal seleccionado
signal agarrado
signal darPista

export(bool) var agarrable = false
export(String) var necesitaA = ""
export(String) var texto = ""
export(String) var pista = ""

onready var animationPlayer = $AnimationPlayer
onready var audio = $Sonido
onready var audioPista = $SonidoPista
onready var audioAgarrado = $SonidoAgarrado
onready var escenaPrincipal = get_parent().get_parent().get_parent()

var faltaNecesitaA = true

func _ready():
	if texto == "":
		texto = name
	
func Seleccionado():
	# escenaPrincipal.AumentarRiesgo() # comentado porque aun no funciona correctamente (Hollow)
	if agarrable:
		emit_signal("agarrado")
		audioAgarrado.play()
	else:
		animationPlayer.play("seleccionado")
		if necesitaA != "":
			if escenaPrincipal.itemSeleccionado == necesitaA or faltaNecesitaA == false:
				faltaNecesitaA = false
				emit_signal("seleccionado")
				audio.play()
				queue_free()
			else:
				emit_signal("darPista")
				audioPista.play()
		else:
			emit_signal("seleccionado")
			audio.play()

func Deseleccionar():
	animationPlayer.play("normal")
