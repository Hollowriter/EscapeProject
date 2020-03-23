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
onready var escenaPrincipal = get_parent().get_parent().get_parent()

func Seleccionado():
	if agarrable:
		emit_signal("agarrado")
	else:
		if necesitaA != "":
			if escenaPrincipal.itemSeleccionado == necesitaA:
				emit_signal("seleccionado")
				audio.play()
			else:
				emit_signal("darPista")
		else:
			emit_signal("seleccionado")
			animationPlayer.play("seleccionado")

func Deseleccionar():
	animationPlayer.play("normal")
