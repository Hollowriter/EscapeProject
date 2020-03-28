extends TextureButton

signal seleccionado
signal agarrado
signal darPista

export(bool) var agarrable = false
export(bool) var riesgo = false
export(String) var necesitaA = ""
export(String) var texto = ""
export(String) var pista = ""
export var limiteRiesgo = 0

onready var intentos = 0
onready var agarrado = false
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
		agarrado = true
		audioAgarrado.play()
	else:
		animationPlayer.play("seleccionado")
		if necesitaA != "":
			if escenaPrincipal.itemSeleccionado == necesitaA or faltaNecesitaA == false:
				faltaNecesitaA = false
				emit_signal("seleccionado")
				audio.play()
				rect_position = Vector2(1000, 1000)
			else:
				if riesgo == true:
					intentos += 1
					#if intentos > limiteRiesgo:
					#	intentos = 0
				emit_signal("darPista")
				audioPista.play()
		else:
			if riesgo == true:
				intentos += 1
				#if intentos > limiteRiesgo:
				#	intentos = 0
			emit_signal("seleccionado")
			audio.play()

func Deseleccionar():
	animationPlayer.play("normal")

func CheckAgarrado():
	return agarrado

func CheckRiesgo():
	return riesgo

func CheckIntentos():
	return intentos

func CheckLimiteRiesgo():
	return limiteRiesgo
