extends TextureButton

signal seleccionado
signal agarrado

export(bool) var agarrable = false
export(String) var texto = ""

onready var animationPlayer = $AnimationPlayer

func Seleccionado():
	if agarrable:
		emit_signal("agarrado")
	else:
		emit_signal("seleccionado")
		animationPlayer.play("seleccionado")

func Deseleccionar():
	animationPlayer.play("normal")
