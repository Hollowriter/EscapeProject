extends TextureButton

signal seleccionado
signal agarrado

export(bool) var agarrable = false
export(String) var texto = ""

onready var animationPlayer = $AnimationPlayer
onready var audio = $Sonido

func Seleccionado():
	if agarrable:
		emit_signal("agarrado")
	else:
		emit_signal("seleccionado")
		animationPlayer.play("seleccionado")
	audio.play()

func Deseleccionar():
	animationPlayer.play("normal")
