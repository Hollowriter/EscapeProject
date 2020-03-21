extends TextureButton

signal seleccionado

export(bool) var agarrable = false
export(String) var texto = ""

onready var animationPlayer = $AnimationPlayer

func Seleccionado():
	emit_signal("seleccionado")
	animationPlayer.play("seleccionado")

func Deseleccionar():
	animationPlayer.play("normal")
