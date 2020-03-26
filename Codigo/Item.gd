extends TextureButton

signal seleccionado
signal agarrado
signal darPista

export(bool) var agarrable = false
export(String) var necesitaA = ""
export(String) var texto = ""
export(String) var pista = ""

onready var agarrado = false
onready var animationPlayer = $AnimationPlayer
onready var audio = $Sonido
onready var audioPista = $SonidoPista
onready var audioAgarrado = $SonidoAgarrado
onready var escenaPrincipal = get_parent().get_parent().get_parent()

func _ready():
	if texto == "":
		texto = name
	
	if necesitaA != "" && pista == "":
		pista = "usar " + necesitaA + " en este objeto"

func Seleccionado():
	if agarrable:
		if agarrado == false:
			emit_signal("agarrado")
			agarrado = true
			audioAgarrado.play()
	else:
		if necesitaA != "":
			if escenaPrincipal.itemSeleccionado == necesitaA:
				emit_signal("resuelto")
				audio.play()
				rect_position = Vector2(1000, 1000)
			else:
				emit_signal("darPista")
				audioPista.play()
		else:
			emit_signal("seleccionado")
			animationPlayer.play("seleccionado")
			audio.play()

func Deseleccionar():
	animationPlayer.play("normal")

func CheckAgarrado():
	return agarrado
